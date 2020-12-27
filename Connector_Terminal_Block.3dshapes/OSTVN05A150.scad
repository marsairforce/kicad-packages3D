// Generates a terminal block parametrically
// https://www.digikey.ca/en/products/detail/on-shore-technology-inc/OSTVN05A150/1588865?s=N4IgjCBcpgDA7AViqAxlAZgQwDYGcBTAGhAHsoBtEAJmoE5ZYIBdEgBwBcoQBlDgJwCWAOwDmIAL4kAtABYUIdJGz5iZSiABs2gBwhWITt0kSJQA

np=5; // number of terminals
dp=2.54; // spacing between pins
sd=1.9; // screw diameter
wd=1.5; // wire hole diameter
pkgDepth=6.5;
pkgHeight=8.5;
pinDepth=3.2;
pinLength=3.5;
pinSize=0.4;
pkgColor="#76AE8D";

module body() {
    difference() {
        color(pkgColor)
        polyhedron( 
        points = [
        // bottom plane
        [ 0,         0,          0 ], // 0
        [ 0,         pkgDepth,   0 ], // 1
        [ np*dp,     pkgDepth,   0 ], // 2
        [ np*dp,     0,          0 ], // 3

        // top plane
        [ 0,         pkgDepth-1.5,   pkgHeight ], // 4
        [ np*dp,     pkgDepth-1.5,   pkgHeight ], // 5
        [ np*dp,     1.5,   pkgHeight ], // 6
        [ 0,         1.5,   pkgHeight ], // 7

        // the mid kneel point (front)
        [ 0,         0,   pkgHeight/2 ], // 8
        [ 0,         0.5, pkgHeight/2 ], // 9
        [ np*dp,     0.5, pkgHeight/2 ], // 10
        [ np*dp,     0,   pkgHeight/2 ], // 11
            
        // the mid kneel point (back)
        [ 0,         pkgDepth, pkgHeight/2 ], // 12
        [ np*dp,     pkgDepth, pkgHeight/2 ], // 13
        ],
        faces = [
        [0, 3, 2, 1 ], // bottom face
        [4, 5, 6, 7 ], // top face
        [8, 9, 10,11], // mid kneel point
        [9, 7, 6, 10], // front angle part
        [0, 8, 11,3 ], // front vertical
        [4, 12, 13, 5 ], // back vertical
        [12, 1, 2, 13 ], // back vertical
        [6, 5, 13, 2, 3, 11, 10 ], // right side
        [4, 7, 9, 8, 0,  1, 12  ] // left side
        ]);

      // the holes for the screws and the front screw terminal places
      for (a =[1:np]) {
        c = (a == 1) ? dp/2 : (a-1)*dp + dp/2;
        translate([c, pinDepth, pkgHeight-1]) color(pkgColor) cylinder( h=2, r=(sd/2), $fn=20);
        
        translate([c-(sd/2), -0.01, 1.49]) color(pkgColor) cube([ sd, sd, pkgHeight/2-1.8 ]);  
      } // for
    }
}

module pins() {
    for (a =[1:np]) {
        c = (a == 1) ? dp/2 : (a-1)*dp + dp/2;

        // the screws on the top
        translate([c, pinDepth, pkgHeight-0.6]) color("#C0C0C0") cylinder( h=0.1, r=(sd/2), $fn=60);
        difference() {
        translate([c, pinDepth, pkgHeight-0.4]) color("#C0C0C0") cylinder( h=0.1, r=sd/2-0.1, $fn=60);
        translate([c-(sd/2), pinDepth, pkgHeight-0.7]) color("#C0C0C0") cube([sd, 0.1, 0.5]);
            
        translate([c+0.1, pinDepth-sd/4, pkgHeight-0.7])rotate([0, 0, 90])
            color("#C0C0C0") cube([sd/2+.2, 0.1, 0.5]); 
        }
        
        // the metal front pieces
        difference() {
        translate([c-(sd/2), 0.5, 0.99]) color("#C0C0C0") cube([ sd, 1, pkgHeight/2-1 ]);
        translate([c, 1.4, 3]) rotate([90,0,0]) color("#C0C0C0") cylinder(r=wd/2, h=1.3, $fn=20);
        }
        translate([c-0.5,pinDepth,-pinLength])color("#C0C0C0")cube([pinSize,pinSize, pinLength]);
    } // for
}

translate([-dp/2+0.28,-pinDepth-pinSize/2,0])
union() {
    body();
    pins();
}