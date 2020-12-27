
rotate([0,0,-90]){
difference(){
translate([-3.4/2,-3.6/2,0.1])color("grey")cube([3.4,3.6,2.0]);
translate([0,0,1.1])color("grey")cylinder(r=1.1,h=1.1,$fn=20);
}
difference(){
translate([0,0,1])color("white")cylinder(r=1,h=1,$fn=20);
translate([-1,-0.45/2,1.6])color("white")cube([2,0.45,0.41]);
translate([-0.45/2,-1,1.6])color("white")cube([0.45,2,,0.41]);
}

translate([-3.4/2+0.3-0.9/2,-0.5,0])color("silver")cube([0.9,1,0.8]);
translate([-3.4/2+0.3-0.9/2,-0.75/2,0])color("silver")cube([0.9,0.75,0.8]);
translate([3.4/2-0.3-0.9/2,-1.15-0.75/2,0])color("silver")cube([0.9,0.75,0.8]);
translate([3.4/2-0.3-0.9/2,+1.15-0.75/2,0])color("silver")cube([0.9,0.75,0.8]);
}