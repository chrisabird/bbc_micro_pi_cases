depth = 116;
width = 132;
height = 24;
edge = 4;
wall = 1;
side_angle=8.28;
mount_stand_r=2.5;
mount_stand_h=3;
mount_rod=1.25;

pi_width=85;
pi_depth=56;
pi_mount_offset=3.5;
pi_mount_width_apart=58;
pi_mount_depth_apart=49;

pcb_height=1.4;

ethernet_port_width=16;
ethernet_port_depth=20;
ethernet_port_height=14;
ethernet_port_offset=10.25;

usb_port_width=15;
usb_port_depth=20;
usb_port_height=16;
usb_port_a_offset=29;
usb_port_b_offset=47;


$fn=30;
difference() {
	minkowski() {
		translate([wall, wall, wall]) cube([width-(2*wall), depth-(2*wall), height]);
		sphere(1);
	}		
	translate([wall*2, wall*2, wall*2]) cube([width-(4*wall), depth-(4*wall), height]); // center
	translate([-1,-1,edge]) cube([width+(wall*2),wall*4, height]); // front
	translate([0,depth-(3*wall),height-edge]) cube([width,wall*4, height]); // back
	translate([-1,3*wall, edge]) rotate([side_angle,0,0])cube([width+(wall*2), depth-(wall*2), height]); // left


	translate([-1, depth-(wall*2)-ethernet_port_offset-(ethernet_port_width/2), (wall*2)+mount_stand_h+pcb_height]) 
		cube([ethernet_port_depth, ethernet_port_width, ethernet_port_height]); //ethernet port

	translate([-1, depth-(wall*2)-usb_port_a_offset-(usb_port_width/2), (wall*2)+mount_stand_h+pcb_height]) 
		cube([usb_port_depth, usb_port_width, usb_port_height]); //usb port a

	translate([-1, depth-(wall*2)-usb_port_b_offset-(usb_port_width/2), (wall*2)+mount_stand_h+pcb_height]) 
		cube([usb_port_depth, usb_port_width, usb_port_height]); //usb port a

}



// Back left mount 
translate([(wall*2)+(pi_width-pi_mount_offset-pi_mount_width_apart),depth-(wall*2)-pi_mount_offset,wall*2])
	cylinder(r=mount_stand_r,h=mount_stand_h, center=true);

translate([(wall*2)+(pi_width-pi_mount_offset-pi_mount_width_apart),depth-(wall*2)-pi_mount_offset,wall*2+mount_stand_h])
	cylinder(r=mount_rod,h=mount_stand_h, center=true);

// front left mount
translate([(wall*2)+(pi_width-pi_mount_offset-pi_mount_width_apart),depth-(wall*2)-pi_mount_offset-pi_mount_depth_apart,wall*2])
	cylinder(r=mount_stand_r,h=mount_stand_h, center=true);

translate([(wall*2)+(pi_width-pi_mount_offset-pi_mount_width_apart),depth-(wall*2)-pi_mount_offset-pi_mount_depth_apart,wall*2+mount_stand_h])
	cylinder(r=mount_rod,h=mount_stand_h, center=true);

// Back right mount 
translate([(wall*2)+(pi_width-pi_mount_offset),depth-(wall*2)-pi_mount_offset,wall*2])
	cylinder(r=mount_stand_r,h=mount_stand_h, center=true);

translate([(wall*2)+(pi_width-pi_mount_offset),depth-(wall*2)-pi_mount_offset,wall*2+mount_stand_h])
	cylinder(r=mount_rod,h=mount_stand_h, center=true);

// front right mount
translate([(wall*2)+(pi_width-pi_mount_offset),depth-(wall*2)-pi_mount_offset-pi_mount_depth_apart,wall*2])
	cylinder(r=mount_stand_r,h=mount_stand_h, center=true);

translate([(wall*2)+(pi_width-pi_mount_offset),depth-(wall*2)-pi_mount_offset-pi_mount_depth_apart,wall*2+mount_stand_h])
	cylinder(r=mount_rod,h=mount_stand_h, center=true);
	
	




