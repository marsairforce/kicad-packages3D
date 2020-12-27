
/*
	roundedCube() v1.0.3 by robert@cosmicrealms.com from https://github.com/Sembiance/openscad-modules
	Allows you to round any edge of a cube
	
	Usage
	=====
	Prototype: roundedCube(dim, r, x, y, z, xcorners, ycorners, zcorners, $fn)
	Arguments:
		-      dim = Array of x,y,z numbers representing cube size
		-        r = Radius of corners. Default: 1
		-        x = Round the corners along the X axis of the cube. Default: false
		-        y = Round the corners along the Y axis of the cube. Default: false
		-        z = Round the corners along the Z axis of the cube. Default: true
		- xcorners = Array of 4 booleans, one for each X side of the cube, if true then round that side. Default: [true, true, true, true]
		- ycorners = Array of 4 booleans, one for each Y side of the cube, if true then round that side. Default: [true, true, true, true]
		- zcorners = Array of 4 booleans, one for each Z side of the cube, if true then round that side. Default: [true, true, true, true]
		-       rx = Radius of the x corners. Default: [r, r, r, r]
		-       ry = Radius of the y corners. Default: [r, r, r, r]
		-       rz = Radius of the z corners. Default: [r, r, r, r]
		-   center = Whether to render the cube centered or not. Default: false
		-      $fn = How smooth you want the rounding to be. Default: 128

	Change Log
	==========
	2018-08-21: v1.0.3 - Added ability to set the radius of each corner individually with vectors: rx, ry, rz
	2017-05-15: v1.0.2 - Fixed bugs relating to rounding corners on the X axis
	2017-04-22: v1.0.1 - Added center option
	2017-01-04: v1.0.0 - Initial Release

	Thanks to Sergio Vilches for the initial code inspiration
*/

// Example code:

/*cube([5, 10, 4]);

translate([8, 0, 0]) { roundedCube([5, 10, 4], r=1); }
translate([16, 0, 0]) { roundedCube([5, 10, 4], r=1, zcorners=[true, false, true, false]); }

translate([24, 0, 0]) { roundedCube([5, 10, 4], r=1, y=true, z=false); }
translate([32, 0, 0]) { roundedCube([5, 10, 4], r=1, x=true, z=false); }
translate([40, 0, 0]) { roundedCube([5, 10, 4], r=1, x=true, y=true, z=true); }
*/

module roundedCube(dim, r=1, x=false, y=false, z=true, xcorners=[true,true,true,true], ycorners=[true,true,true,true], zcorners=[true,true,true,true], center=false, rx=[undef, undef, undef, undef], ry=[undef, undef, undef, undef], rz=[undef, undef, undef, undef], $fn=128)
{
	translate([(center==true ? (-(dim[0]/2)) : 0), (center==true ? (-(dim[1]/2)) : 0), (center==true ? (-(dim[2]/2)) : 0)])
	{
		difference()
		{
			cube(dim);

			if(z)
			{
				translate([0, 0, -0.1])
				{
					if(zcorners[0])
						translate([0, dim[1]-(rz[0]==undef ? r : rz[0])]) { rotateAround([0, 0, 90], [(rz[0]==undef ? r : rz[0])/2, (rz[0]==undef ? r : rz[0])/2, 0]) { meniscus(h=dim[2], r=(rz[0]==undef ? r : rz[0]), fn=$fn); } }
					if(zcorners[1])
						translate([dim[0]-(rz[1]==undef ? r : rz[1]), dim[1]-(rz[1]==undef ? r : rz[1])]) { meniscus(h=dim[2], r=(rz[1]==undef ? r : rz[1]), fn=$fn); }
					if(zcorners[2])
						translate([dim[0]-(rz[2]==undef ? r : rz[2]), 0]) { rotateAround([0, 0, -90], [(rz[2]==undef ? r : rz[2])/2, (rz[2]==undef ? r : rz[2])/2, 0]) { meniscus(h=dim[2], r=(rz[2]==undef ? r : rz[2]), fn=$fn); } }
					if(zcorners[3])
						rotateAround([0, 0, -180], [(rz[3]==undef ? r : rz[3])/2, (rz[3]==undef ? r : rz[3])/2, 0]) { meniscus(h=dim[2], r=(rz[3]==undef ? r : rz[3]), fn=$fn); }
				}
			}

			if(y)
			{
				translate([0, -0.1, 0])
				{
					if(ycorners[0])
						translate([0, 0, dim[2]-(ry[0]==undef ? r : ry[0])]) { rotateAround([0, 180, 0], [(ry[0]==undef ? r : ry[0])/2, 0, (ry[0]==undef ? r : ry[0])/2]) { rotateAround([-90, 0, 0], [0, (ry[0]==undef ? r : ry[0])/2, (ry[0]==undef ? r : ry[0])/2]) { meniscus(h=dim[1], r=(ry[0]==undef ? r : ry[0])); } } }
					if(ycorners[1])
						translate([dim[0]-(ry[1]==undef ? r : ry[1]), 0, dim[2]-(ry[1]==undef ? r : ry[1])]) { rotateAround([0, -90, 0], [(ry[1]==undef ? r : ry[1])/2, 0, (ry[1]==undef ? r : ry[1])/2]) { rotateAround([-90, 0, 0], [0, (ry[1]==undef ? r : ry[1])/2, (ry[1]==undef ? r : ry[1])/2]) { meniscus(h=dim[1], r=(ry[1]==undef ? r : ry[1])); } } }
					if(ycorners[2])
						translate([dim[0]-(ry[2]==undef ? r : ry[2]), 0]) { rotateAround([-90, 0, 0], [0, (ry[2]==undef ? r : ry[2])/2, (ry[2]==undef ? r : ry[2])/2]) { meniscus(h=dim[1], r=(ry[2]==undef ? r : ry[2])); } }
					if(ycorners[3])
						rotateAround([0, 90, 0], [(ry[3]==undef ? r : ry[3])/2, 0, (ry[3]==undef ? r : ry[3])/2]) { rotateAround([-90, 0, 0], [0, (ry[3]==undef ? r : ry[3])/2, (ry[3]==undef ? r : ry[3])/2]) { meniscus(h=dim[1], r=(ry[3]==undef ? r : ry[3])); } }
				}
			}

			if(x)
			{
				translate([-0.1, 0, 0])
				{
					if(xcorners[0])
						translate([0, dim[1]-(rx[0]==undef ? r : rx[0])]) { rotateAround([0, 90, 0], [(rx[0]==undef ? r : rx[0])/2, 0, (rx[0]==undef ? r : rx[0])/2]) { meniscus(h=dim[0], r=(rx[0]==undef ? r : rx[0])); } }
					if(xcorners[1])
						translate([0, dim[1]-(rx[1]==undef ? r : rx[1]), dim[2]-(rx[1]==undef ? r : rx[1])]) { rotateAround([90, 0, 0], [0, (rx[1]==undef ? r : rx[1])/2, (rx[1]==undef ? r : rx[1])/2]) { rotateAround([0, 90, 0], [(rx[1]==undef ? r : rx[1])/2, 0, (rx[1]==undef ? r : rx[1])/2]) { meniscus(h=dim[0], r=(rx[1]==undef ? r : rx[1])); } } }
					if(xcorners[2])
						translate([0, 0, dim[2]-(rx[2]==undef ? r : rx[2])]) { rotateAround([180, 0, 0], [0, (rx[2]==undef ? r : rx[2])/2, (rx[2]==undef ? r : rx[2])/2]) { rotateAround([0, 90, 0], [(rx[2]==undef ? r : rx[2])/2, 0, (rx[2]==undef ? r : rx[2])/2]) { meniscus(h=dim[0], r=(rx[2]==undef ? r : rx[2])); } } }
					if(xcorners[3])
						rotateAround([-90, 0, 0], [0, (rx[3]==undef ? r : rx[3])/2, (rx[3]==undef ? r : rx[3])/2]) { rotateAround([0, 90, 0], [(rx[3]==undef ? r : rx[3])/2, 0, (rx[3]==undef ? r : rx[3])/2]) { meniscus(h=dim[0], r=(rx[3]==undef ? r : rx[3])); } }
				}
			}
		}
	}
}

module meniscus(h, r, fn=128)
{
	$fn=fn;

	difference()
	{
		cube([r+0.2, r+0.2, h+0.2]);
		translate([0, 0, -0.1]) { cylinder(h=h+0.4, r=r); }
	}
}

module rotateAround(a, v) { translate(v) { rotate(a) { translate(-v) { children(); } } } }


// The rectangular iron core for Hammond 229 series transformers
//A  - the A (y) dimension from datasheet
//B  - the B (x) dimension from datasheet
//C  - the C (z) dimension from datasheet
module transformer_core(A,B,C,D,D1,E) {
    cw = C/2; // the width of the core, relative to the total height.
    y=((A/2)-(C/2))/2;
    color("#3C3C3C")
    difference() {
    translate([0,y,cw/2]) {
        linear_extrude(height = cw, 
        center = false, convexity = 10, twist = 0)
        polygon([ 
            [ 0, 0  ],
            [ 0, cw ],
            [ B, cw ],
            [ B, 0  ]
        ]);
    }
    translate([B/2-E/2-1, A/2-D1/2-D+(B/2-E/2-1), cw/2]) {
        cylinder(h = cw, r = 1.9, center = false, $fn=20);
    }
    translate([B/2+E/2+1, A/2-D1/2-D+(B/2-E/2-1), cw/2]) {
        cylinder(h = cw, r = 1.9, center = false, $fn=20);
    }
    }
    
    color("#3C3C3C")
    difference() {
    translate([0,y,cw/2]) {
    linear_extrude(height = cw, 
        center = false, convexity = 10, twist = 0)
        polygon([ 
            [ 0, 2*cw ],
            [ 0, 3*cw ],
            [ B, 3*cw ],
            [ B, 2*cw ]
        ]);
    }
    translate([B/2-E/2-1, A-(A/2-D1/2-D+(B/2-E/2-1)), cw/2]) {
        cylinder(h = cw, r = 1.9, center = false, $fn=20);
    }
    translate([B/2+E/2+1, A-(A/2-D1/2-D+(B/2-E/2-1)), cw/2]) {
        cylinder(h = cw, r = 1.9, center = false, $fn=20);
    }
}

    translate([0,y,cw/2]) 
    color("#3C3C3C")
    linear_extrude(height = cw, 
        center = false, convexity = 10, twist = 0)
        polygon([ 
            [ 0,  cw   ],
            [ 0,  cw*2 ],
            [ cw, cw*2 ],
            [ cw, cw   ]
        ]);
 
    translate([0,y,cw/2]) 
    color("#3C3C3C")
    linear_extrude(height = cw, 
        center = false, convexity = 10, twist = 0)
        polygon([ 
            [ B-cw, cw   ],
            [ B-cw, cw*2 ],
            [ B,    cw*2 ],
            [ B,    cw   ]
        ]);   
}

module transformer_bobbin(A,B,C) {
    cw = C/2; // the width of the core, relative to the total height.
    h=C/2; // the half height
    y=((A/2)-(C/2))/2;
    
    // the bobbin
    translate([cw, y/4, 0])color("white")roundedCube([1, A/2, A/2], r=3, x=true, z=false); 
    translate([B/2, y/4, 0])color("white")roundedCube([1, A/2, A/2], r=2, x=true, z=false); 
    translate([B-cw, y/4, 0])color("white")roundedCube([1, A/2, A/2], r=2, x=true, z=false); 

    translate([cw, A-2*cw+y/4, 0])color("white")roundedCube([1, A/2, A/2], r=2, x=true, z=false); 
    translate([B/2, A-2*cw+y/4, 0])color("white")roundedCube([1, A/2, A/2], r=2, x=true, z=false); 
    translate([B-cw, A-2*cw+y/4, 0])color("white")roundedCube([1, A/2, A/2], r=2, x=true, z=false); 
}

module transformer_windings(A,B,C) {
    cw = C/2; // the width of the core, relative to the total height.
    ww = 2; // winding width
    y=((A/2)-(C/2))/2;
    
    // windings
    translate([cw, ww/2+y/4, (cw-2*ww)/4-ww])color("yellow")roundedCube([A-cw, A/2-ww, A/2-ww], r=3, x=true, z=false); 
    translate([cw, A/2+ww-+y/4, (cw-2*ww)/4-ww])color("yellow")roundedCube([A-cw, A/2-ww, A/2-ww], r=3, x=true, z=false); 
}

module transformer_pins(A,B,C,D,D1,E) {
    ph=5;
    pw=1;
    pr1=B/2 - E/2;
    pr2=B/2 + E/2;
    
    py1= A/2 - D1/2 - D;
    py2= A/2 - D1/2;
    py3= A/2 + D1/2;
    py4= A/2 + D1/2 + D;
    
    // plastic block beside first row of pins
    translate([pr1,0,0]) {
        color("white")cube([4, A, 7.75]);
    }

    // first row of pins
    translate([pr1, py1, -ph]) {
        cube([pw,pw,ph]);
    }
    translate([pr1, py2, -ph]) {
        cube([pw,pw,ph]);   
    }
    translate([pr1, py3, -ph]) {
        cube([pw,pw,ph]);   
    }
    translate([pr1, py4, -ph]) {
        cube([pw,pw,ph]);   
    }
    
    // plastic block beside second row of pins
    translate([pr2-4, 0, 0]) {
        color("white")cube([4, A, 7.75]);
    }
    
    // second row of pins
    translate([pr2, py1, -ph]) {
        cube([pw,pw,ph]);
    }
    translate([pr2, py2, -ph]) {
        cube([pw,pw,ph]);   
    }
    translate([pr2, py3, -ph]) {
        cube([pw,pw,ph]);   
    }
    translate([pr2, py4, -ph]) {
        cube([pw,pw,ph]);   
    }
}

// The Hammond 229 series transformers
//A  - the A (y) dimension from datasheet
//B  - the B (x) dimension from datasheet
//C  - the C (z) dimension from datasheet
//D  - the outer pin spacing on a row of pins
//D1 - the inner pin spacing on a row of pins
//E  - the spacing between rows of pins
module transformer(A,B,C,D,D1,E) {
    pr1=B/2 - E/2;
    py1= A/2 - D1/2 - D;
    pw=1;
    translate([-pr1-pw/2,-py1-pw/2,0])
    union() {
    transformer_core(A,B,C,D,D1,E);
    transformer_bobbin(A,B,C);
    transformer_windings(A,B,C);
    transformer_pins(A,B,C,D,D1,E);
    }
}
// main
union() {
    transformer(51,64,27,13,13,51);
}
 

