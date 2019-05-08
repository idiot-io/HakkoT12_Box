//

$fn=50;
nozzle=0.8;
wall=nozzle*2;
clearance=0.1;
//�������
h=40;
x=82.5; //���������� ������ ��������� ��� �������� ��� ��������� ������
y=30;
powersupply_y=28;
module border_support() {
difference(){
cube([wall*2,wall*2,h/2+4]);
translate([-0.5,wall,h/2]) rotate([90,0,0])        linear_extrude(height = wall*3, center = true, convexity = 10, twist = 0)
            polygon([[0,0],
                     [0,6],
                     [2,6],
                     [2,4]]);
}
}
module frontpanel(){
	x=x-wall*2-clearance*2;
	h=h-wall*2-clearance*2;
	difference(){
	cube([x,h,wall]);
	translate([x/2-22.5/2,h/2-7,-0.5]) cube([22.5,14,wall+1]);
	translate([x/2-22.5/2-16.75,h/2,-0.5]) cylinder(d=12, h=wall+1);
	translate([x/2-22.5/2-16.75+12,h/2,-0.5]) cylinder(d=3.2, h=wall+1);
	translate([x/2-22.5/2-16.75+12,h/2-7.29,-0.5]) cylinder(d=3.2, h=wall+1);
	translate([x/2+22.5/2+16.05,h/2,-0.5]) cylinder(d=7, h=wall+1);
	translate([x/2+22.5/2+16.05,h/2+6,-0.5]) cylinder(d=3, h=wall);
	}
}
module rearpanel(){
	x=x-wall*2-clearance*2;
	h=h-wall*2-clearance*2;
	difference(){
	cube([x,h,wall]);
	//translate([30,h/2-25/2,-0.5]) cube([28,25,wall+1]);
    translate([28+x/2-22.5/2-16.75,h/2,-0.5]) cylinder(d=8, h=wall+1);
	}
}

module bottom(){

difference(){
        union(){
		difference(){
		cube([x,y,h/2]);
		translate([wall,wall*3+clearance*2,wall]) cube([x-wall*2,y-wall*6-clearance*4,h/2+wall]);
		}

//top support screw
				
		hull(){
		translate([wall+8/2,7.5+wall*3+8/2,0]) cylinder(d=8, h=h/2);
		translate([0,7.5+wall*3,0]) cube([wall,8,h/2]);
		}
		hull(){
		translate([x-wall-8/2,7.5+wall*3+8/2,0]) cylinder(d=8, h=h/2);
		translate([x-wall,7.5+wall*3,0]) cube([wall,8,h/2]);
		}
	}
    
	//front
	translate([wall*2,-wall,wall*2]) cube([x-wall*4,wall*5,h/2]);
	translate([wall,wall,wall]) cube([x-wall*2,wall+clearance*2,h/2+wall]);
	//rear
   translate([wall*2,y-wall*2,wall*2]) cube([x-wall*4,wall*3,h/2]);
	translate([wall+8,y-wall*4,wall*2]) cube([x-wall*2-16,wall*5,h/2]);
	translate([wall,y-wall*2-clearance*2,wall]) cube([x-wall*2,wall+clearance*2,h/2+wall]);
    
//top screw

	translate([wall+8/2,7.5+wall*3+8/2,-1]) cylinder(d=3, h=h);
	translate([x-wall-8/2,7.5+wall*3+8/2,-1]) cylinder(d=3, h=h);
	
}

//support with top
//translate([wall,y/4-wall*3,0]) rotate([0,0,0]) border_support();
//translate([wall,y/4*2-wall*3,0]) rotate([0,0,0]) border_support();
//translate([wall,y/4*3-wall*3,0]) rotate([0,0,0]) border_support();
//translate([x-wall,y/4+wall*3,0]) rotate([0,0,180]) border_support();
//translate([x-wall,y/4*2+wall*3,0]) rotate([0,0,180]) border_support();
//translate([x-wall,y/4*3+wall*3,0]) rotate([0,0,180]) border_support();
}

module top(){

difference(){
        union(){
		difference(){
		cube([x,y,h/2]);
		translate([wall,wall*3+clearance*2,wall]) cube([x-wall*2,y-wall*6-clearance*4,h/2+wall]);
		}
//top support screw
		
		hull(){
		translate([wall+8/2,7.5+wall*3+8/2,0]) cylinder(d=8, h=h/2);
		translate([0,7.5+wall*3,0]) cube([wall,8,h/2]);
		}
		hull(){
		translate([x-wall-8/2,7.5+wall*3+8/2,0]) cylinder(d=8, h=h/2);
		translate([x-wall,7.5+wall*3,0]) cube([wall,8,h/2]);
		}
	}
	//front
	translate([wall*2,-wall,wall*2]) cube([x-wall*4,wall*5,h/2]);
	translate([wall,wall,wall]) cube([x-wall*2,wall+clearance*2,h/2+wall]);
	//rear
	translate([wall*2,y-wall*2,wall*2]) cube([x-wall*4,wall*3,h/2]);
	translate([wall+8,y-wall*4,wall*2]) cube([x-wall*2-16,wall*5,h/2]);
	translate([wall,y-wall*2-clearance*2,wall]) cube([x-wall*2,wall+clearance*2,h/2+wall]);
//top screw

	translate([wall+8/2,7.5+wall*3+8/2,1]) cylinder(d=2.7, h=h);
	translate([x-wall-8/2,7.5+wall*3+8/2,1]) cylinder(d=2.7, h=h);
}

//support with top
//translate([wall,y/4-wall*3,0]) rotate([0,0,0]) border_support();
//translate([wall,y/4*2-wall*3,0]) rotate([0,0,0]) border_support();
//translate([wall,y/4*3-wall*3,0]) rotate([0,0,0]) border_support();
//translate([x-wall,y/4+wall*3,0]) rotate([0,0,180]) border_support();
//translate([x-wall,y/4*2+wall*3,0]) rotate([0,0,180]) border_support();
//translate([x-wall,y/4*3+wall*3,0]) rotate([0,0,180]) border_support();
}
rotate([0,180,0]) translate([-100-x+wall*2,0,0]) frontpanel();
translate([100,60,0]) rearpanel();
translate([-100,0,0]) top();
bottom();
