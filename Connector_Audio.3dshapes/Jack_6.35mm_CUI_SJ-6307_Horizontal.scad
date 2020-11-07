
$fn=20;
module pin(x,y) {
    translate([x,y,0])translate([-0.7,-0.3,-4])cube([1.4,0.6,4]);
}

lPitch=16.8-10.5;
wPitch=16.3;

union() {
    pin(0,0);
    pin(0,wPitch);
    pin(2*lPitch,0);
    pin(2*lPitch,wPitch);

    translate([-4.2, -1.9, 0]) {
        color("gray")cube([24.8,20,8]);
        translate([-8.4, 5.5+5, 5.5+2.5])rotate([0,90,0])
        difference(){
            cylinder(r=5.4,h=8.4);
            translate([0,0,-0.1])cylinder(r=3.5,h=8.5);
        }
        translate([0, 7.75+2.5, 7.75])rotate([0,90,0])color("gray")cylinder(r=7.75,h=2);
        translate([6, 7.75+2.5, 7.75])rotate([0,90,0])color("gray")cylinder(r=7.75,h=2);
        translate([12.5, 7.75+2.5, 7.75])rotate([0,90,0])color("gray")cylinder(r=7.75,h=2);
        translate([19, 7.75+2.5, 7.75])rotate([0,90,0])color("gray")cylinder(r=7.75,h=2);
    }
}