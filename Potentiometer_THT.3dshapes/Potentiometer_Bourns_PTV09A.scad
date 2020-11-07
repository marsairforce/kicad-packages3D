
shaftL=20;


rotate([0,0,-90])translate([-5.5-2.5, 7-5.5,0]){
    cube([11,11,6.8]);
    translate([0.5,-2.5,0])color("gray")cube([10,2.5,6.2]);
    translate([5.5,5.5,0])color("gray")cylinder(r=6.8/2, h=shaftL);

    translate([-1.8/2,-2.3/2+5.5,-3.8])cube([1.8,2,3.8]);
    translate([-1.8/2+11,-2.3/2+5.5,-3.8])cube([1.8,2,3.8]);

    translate([-0.5+5.5,-0.5+5.5-7,-3.8])cube([1,1,3.8]);
    translate([-0.5+5.5-2.5,-0.5+5.5-7,-3.8])cube([1,1,3.8]);
    translate([-0.5+5.5+2.5,-0.5+5.5-7,-3.8])cube([1,1,3.8]);
}