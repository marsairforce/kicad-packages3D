
module pin(n) {
    translate([2.54*(n-1), 0, 0])translate([-0.25,-0.25,-4.1])cube([0.5,0.5,4.1]);
}

rotate([0,0,-90])
{
    color("darkgrey")translate([-2,-9.2+3.2,0])cube([21.8, 9.2, 11.1]);
    color("white")translate([1,-9.2+3.2+0.9,5])rotate([90,0,0])linear_extrude(1)text(text="RECOM", size=3);
    for (a = [1,2,3,5,6,7,8]) pin(a);
}

