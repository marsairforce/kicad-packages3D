
shaftL=20;
bodyL=13;
bodyW=11.7;
bodyH=7.2;

module body() {
rotate([0,0,180]){
    // body
    translate([-bodyL/2,-bodyW/2])color("grey")cube([bodyL,bodyW,bodyH]);
    // body mounting tabs
    translate([-1.5/2,-bodyW/2,-1.4])cube([1.5,0.1,1.4]);
    translate([-1.5/2,-0.1+bodyW/2,-1.4])cube([1.5,0.1,1.4]);
    
    // shaft
    translate([0,0,bodyH])color("silver")cylinder(r=6.8/2, h=shaftL-bodyH, $fn=20);

    // pins
    translate([6.5,0,0])frontPin();
    translate([6.5,-2.5,0])frontPin();
    translate([6.5,+2.5,0])frontPin();
    
    translate([-6.5,-2.5,0])backPin();
    translate([-6.5,+2.5,0])backPin();
}
}

module frontPin() {
    translate([1,-0.75,0])cube([2,1.5,0.1]);
    translate([1-0.1,-0.75,0])cube([0.1,1.5,3.8]);
    translate([0,-0.75,3.8])cube([1,1.5,0.1]);
}

module backPin() {
    translate([-2.5,-0.75,0])cube([2,1.5,0.1]);
    translate([-0.5,-0.75,0])cube([0.1,1.5,1]);
    translate([-0.5,-0.75,1])cube([0.5,1.5,0.1]);
}

body();