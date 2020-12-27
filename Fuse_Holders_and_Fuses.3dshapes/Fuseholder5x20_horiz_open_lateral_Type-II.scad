aDim=5;

t=0.74; // thickness of the metal in mm

module fuse_holder() {
    translate([-2,aDim/2,3.5]) rotate([0,90,0]) 
    difference(){
        cylinder(r=aDim/2, h=5,$fn=20);
        translate([0,0,-0.01]) cylinder(r=aDim/2-t/2, h=5.02,$fn=20);
        translate([-aDim/2,-1.5, -0.01]) cube([aDim, 3, 5.02], center=false);
    }
    
    
    translate([-2,1,0])cube([5,t/2,2]);
    translate([-2,4,0])cube([5,t/2,2]);
    translate([-2,1,0])cube([5,3.35,t/2]);


    // the pins
    pl=3.46;
    translate([0,2.45,t/2])cube([1.08, 5.6,t],center=true);
    
    translate([0,0,-pl/2])cube([1.08,t,pl],center=true);
    translate([0,4.9,-pl/2])cube([1.08,t,pl],center=true);
}

module fuse() {
cylinder(r=aDim/2-t,h=5, $fn=200);
color("white")translate([0,0,5])cylinder(r=aDim/2-t,h=9.80, $fn=200);
translate([0,0,14.80])cylinder(r=aDim/2-t,h=5, $fn=200);
}

module fuse_with_holder() {
    group(){
    // display two holder pins
    fuse_holder();
    translate([17.7,4.9,0])rotate([0,0,180])fuse_holder();

    // draw a fuse
    translate([-1,2.5,3.5])rotate([0,90,0])fuse();
    }
}

//fuse_holder();
//fuse();
fuse_with_holder();