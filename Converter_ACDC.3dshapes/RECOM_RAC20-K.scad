
lB=52.5;
wB=27.4;
lT=51;
wT=26.3;
h=23;

oL=3.39;
oW=3.5;
pW=1;
pH=6;


module body(){
    translate([lB/2-oL,wB/2-oW,0])
    difference(){
        color("gray")
        polyhedron(
        points=[
        [-lB/2,-wB/2,0],
        [-lB/2,wB/2,0],
        [lB/2,wB/2,0],
        [lB/2,-wB/2,0],
        [-lT/2,-wT/2,h],
        [-lT/2,wT/2,h],
        [lT/2,wT/2,h],
        [lT/2,-wT/2,h]
        ],
        faces=[
        [0,3,2,1],
        [4,5,6,7],
        [0,4,7,3],
        [5,4,0,1],
        [6,5,1,2],
        [7,6,2,3],
        ]);

    translate([-lT/2+oL,wT/2-oW,h-0.25])color("gray")cylinder(r=1,h=1,center=true,$fn=20);
    }

}

module pin(x,y){
translate([2.54*x,2.54*y,-pH/2])color("gold")cube([pW,pW,pH],center=true);
}

union() {
    body();
    pin(0,0);
    pin(0,8);
    pin(18,0);
    pin(18,4);
    pin(18,8);
}