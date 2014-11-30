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

audio_port_depth=20;
audio_port_r=4;
audio_port_offset=53.5;

hdmi_width=15;
hdmi_height=7;
hdmi_depth=20;
hdmi_offset=32;

micro_usb_port_depth=20;
micro_usb_port_width=9;
micro_usb_port_height=3;
micro_usb_port_offset=10.6;

$fn=30;

module base() {
	difference() {
		minkowski() {
			translate([wall, wall, wall]) cube([width-(2*wall), depth-(2*wall), height]);
			sphere(1);
		}
		
		translate([wall*2, wall*2, wall*2]) 
			cube([width-(4*wall), depth-(4*wall), height]); // center cutout

		translate([-1,-1,edge]) 
			cube([width+(wall*2),wall*4, height]); // front cut out	

		translate([0,depth-(3*wall),height-edge]) 
			cube([width,wall*4, height]); // back cut out

		translate([-1,3*wall, edge]) 	
			rotate([side_angle,0,0]) 
				cube([width+(wall*2), depth-(wall*2), height]); // left cut out
	}
}

module etherent_port() {
	translate([-1, depth-(wall*2)-ethernet_port_offset-(ethernet_port_width/2), (wall*2)+mount_stand_h+pcb_height]) 
		cube([ethernet_port_depth, ethernet_port_width, ethernet_port_height]);
}

module usb_port(offset) {
	translate([-1, depth-(wall*2)-offset-(usb_port_width/2), (wall*2)+mount_stand_h+pcb_height]) 
		cube([usb_port_depth, usb_port_width, usb_port_height]); 
}

module audio_port() {
	translate([(wall*2)+(pi_width-audio_port_offset-audio_port_r),depth+(audio_port_depth/2),(wall*2)+mount_stand_h+pcb_height+audio_port_r]) 
		rotate([90,0,0]) 
			cylinder(r=audio_port_r, h=audio_port_depth);
}

module hdmi_port() {
	translate([(wall*2)+(pi_width-hdmi_offset-(hdmi_width/2)),depth-(hdmi_depth/2),(wall*2)+mount_stand_h+pcb_height]) 
		cube([hdmi_width, hdmi_depth, hdmi_height]);
}

module micro_usb_port() {
	translate([(wall*2)+(pi_width-micro_usb_port_offset-(micro_usb_port_width/2)),depth-(micro_usb_port_depth/2),(wall*2)+mount_stand_h+pcb_height]) 
		cube([micro_usb_port_width, micro_usb_port_depth, micro_usb_port_height]);
}

module mount(offset_x, offset_y) {
	translate([(wall*2)+(pi_width-pi_mount_offset-offset_x),depth-(wall*2)-pi_mount_offset-offset_y,wall*2])
		cylinder(r=mount_stand_r,h=mount_stand_h, center=true);

	translate([(wall*2)+(pi_width-pi_mount_offset-offset_x),depth-(wall*2)-pi_mount_offset-offset_y,wall*2+mount_stand_h])
		cylinder(r=mount_rod,h=mount_stand_h, center=true);
}

difference() {
	base();
	etherent_port();
	usb_port(usb_port_a_offset);
	usb_port(usb_port_b_offset);
	audio_port();
	hdmi_port();
	micro_usb_port();
}

mount(0, 0);
mount(pi_mount_width_apart, 0);
mount(0, pi_mount_depth_apart);
mount(pi_mount_width_apart, pi_mount_depth_apart);