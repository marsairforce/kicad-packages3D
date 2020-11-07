// L_23X24.3mm_H14mm

h=14.1;
l=23.5;
w=24.3;

group(){
translate([-l/2,-w/2,0])color("grey")cube([l,w, h/4]);
translate([0,0,h/4])color("gold")cylinder(r=l/2-1,h=h/2);
translate([-l/2,-w/2,0])color("gold")cube([2,w,1]); 
translate([l/2-2,-w/2,0])color("gold")cube([2,w,1]); 

translate([0,0,3/4*h]) {
intersection() {
color("grey")cylinder(r=l/2,h=h/4);
translate([-l/4,-l/2,0])color("grey")cube([l/2,l,h/4]);
}
intersection() {
color("grey")cylinder(r=l/2,h=h/4);
translate([-l/2,-l/4,0])color("grey")cube([l,l/2,h/4]);
}
}
}