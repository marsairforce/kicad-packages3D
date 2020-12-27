module pin(x,y) {
    translate([-0.2+x,-0.3+y,-3.5])cube([0.4,0.6,3.5]);
}

module body() {
difference() {
    translate([-22.5, -4.5, 0])color("silver")cube([45, 9, 7]);
    translate([20.5,0,7-2])color("silver")cylinder(r=1,h=2.1,$fn=20);
    translate([-20.5,0,7-2])color("silver")cylinder(r=1,h=2.1,$fn=20);
    translate([-18.5, -1.4, 7-0.49])color("silver")cube([37, 2.8, 0.5]);
}

translate([-3, -1.4, 7])color("black")cube([6, 2.8, 10]);
//+18.5-3

pin(-20,1.25);
pin(-20,3.75);
pin(-20,-1.25);
pin(-20,-3.75);
pin(20,1.25);
pin(20,-3.75);
}

body();