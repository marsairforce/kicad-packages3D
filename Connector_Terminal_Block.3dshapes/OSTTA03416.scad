// On Shore OSTTA series 3 position terminal block

np=3; // number of terminals
dp=5.08; // spacing between pins
sd=3; // screw diameter
wd=2.5; // wire hole diameter
pkgColor="#005D9C";

module body(){
    difference() {
    
    color(pkgColor)
    polyhedron( 
    points = [
    // bottom plane
    [ 0.7,         0,   0.5 ], // 0
    [ 0.7,         9,   0.5 ], // 1
    [ 0.7+(np*dp), 9,   0.5 ], // 2
    [ 0.7+(np*dp), 0,   0.5 ], // 3

    // top plane
    [ 0.7,         9,   13 ], // 4
    [ 0.7+(np*dp), 9,   13 ], // 5
    [ 0.7+(np*dp), 2,   13 ], // 6
    [ 0.7,         2,   13 ], // 7

    // the mid kneel point
    [ 0.7,         0,   7 ], // 8
    [ 0.7,         0.5, 7 ], // 9
    [ 0.7+(np*dp), 0.5, 7 ], // 10
    [ 0.7+(np*dp), 0,   7 ], // 11
    ],
    faces = [
    [0, 3, 2, 1 ], // bottom face
    [4, 5, 6, 7 ], // top face
    [8, 9, 10,11], // mid kneel point
    [9, 7, 6, 10], // front angle part
    [0, 8, 11,3 ], // front vertical
    [4, 1, 2, 5 ], // back vertical
    [6, 5, 2, 3, 11, 10 ], // right side
    [4, 7, 9, 8, 0, 1 ]
    ]);

    // the recessed triangle thing on the right
    color(pkgColor)
    polyhedron([
    [(np*dp)+0.3,      7.5, 0.49 ], // 0
    [(np*dp)+0.3,      8.5, 0.49 ], // 1
    [(np*dp)+0.3+0.75, 8,   0.49 ], // 2
    [(np*dp)+0.3,      7.5, 7   ],  // 3
    [(np*dp)+0.3,      8.5, 7   ],  // 4
    [(np*dp)+0.3+0.75, 8,   7   ],  // 5
    ],
    [
    [1, 0, 2 ],
    [3, 4, 5 ],
    [4, 3, 0, 1 ],
    [3, 5, 2, 0 ],
    [4, 5, 2, 1 ]
    ]);

      // the holes for the screws and the front screw terminal places
      for (a =[1:np]) {
        c = (a == 1) ? dp/2 : (a-1)*dp + dp/2;
        translate([0.75+c, 4, 8.1]) color(pkgColor) 
          cylinder( h=5, r=(sd/2), $fn=20);
        
        translate([0.75+c-(sd/2), -0.01, 1.49]) color(pkgColor)
          cube([ 3, 3, 5.5 ]);  
      } // for

    }

    // bumps on the bottom
    color(pkgColor)
    for (a =[1:np]) {
      c = (a == 1) ? dp/2 : (a-1)*dp + dp/2;
      translate([c, 0.25, 0]) 
        color(pkgColor) cylinder( h=0.5, r=0.3, $fn=20);
      translate([c, 8.75, 0]) 
        color(pkgColor) cylinder( h=0.5, r=0.3, $fn=20);
    }
      
      
    // the triangle thing on the left
    color(pkgColor)
    polyhedron([
    [0,    7.5, 0.5 ], // 0
    [0,    8.5, 0.5 ], // 1
    [0.75, 8,   0.5 ], // 2
    [0,    7.5, 7   ], // 3
    [0,    8.5, 7   ], // 4
    [0.75, 8,   7   ], // 5
    ],
    [
    [1, 0, 2 ],
    [3, 4, 5 ],
    [4, 3, 0, 1 ],
    [3, 5, 2, 0 ],
    [4, 5, 2, 1 ]
    ]);
}

module terminals() {

for (a =[1:np]) {
    c = (a == 1) ? dp/2 : (a-1)*dp + dp/2;
    
    // the screws on the top
    translate([0.75+c, 4, 11.0]) color("#C0C0C0") cylinder( h=1, r=(sd/2), $fn=60);
    difference() {
    translate([0.75+c, 4, 11.7]) 
        color("#C0C0C0") cylinder( h=1, r=1.4, $fn=60);
    translate([0.75+c-(sd/2), 4, 11.8]) color("#C0C0C0") cube([sd, 0.2, (sd/2)]);
    }
    
    // the metal front pieces
    difference() {
    translate([0.75+c-(sd/2), 0.5, 0.99]) color("#C0C0C0") cube([ sd, 1, 6 ]);
    translate([0.75+c, 1.4, 3]) rotate([90,0,0]) 
        color("#C0C0C0") cylinder(r=wd/2, h=1.3, $fn=20);
    }
    
    // the pin on the bottom
    translate([0.75+c-0.5,4,-4.5])
        color("#C0C0C0")cube([1,1,5]);
  } // for
}

translate([-(0.75+dp/2),-(4+0.5),0]) // have pin 1 over the origin.
union() {
  body();
  terminals();
}  