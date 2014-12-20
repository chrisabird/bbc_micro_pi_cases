include<params.scad>;

$fn=30;

module base() {
	difference() {
		// Outer shell
		minkowski() {
			translate([wall, wall, wall]) cube([width-(2*wall), depth-(2*wall), height-(wall*2)]);
			sphere(1);
		}
		
		// Center cut out
		translate([wall, wall, wall]) 
			cube([width-(2*wall), depth-(2*wall), height]); 

		// Front cut out
		translate([-1,-1,edge]) 
			cube([width+(wall*2), edge_inset+1, height]);

		// Back cut out
		translate([-1, depth-edge_inset ,height-edge]) 
			cube([width+wall*2, wall*4, height]);

		// Diagonal edges
		translate([-1, edge_inset, edge]) 	
			rotate([side_angle,0,0]) 
				cube([width+(wall*2), depth-(wall*2), height]);


	}
}


module etherent_port() {
	translate([-1, depth-wall-ethernet_port_offset-(ethernet_port_width/2), wall+mount_stand_h+pcb_height]) 
		cube([ethernet_port_depth, ethernet_port_width, ethernet_port_height]);
}

module usb_port(offset) {
	translate([-1, depth-wall-offset-(usb_port_width/2), wall+mount_stand_h+pcb_height]) 
		cube([usb_port_depth, usb_port_width, usb_port_height]); 
}

module audio_port() {
	translate([wall+(pi_width-audio_port_offset-audio_port_r), depth+(audio_port_depth/2), wall+mount_stand_h+pcb_height+audio_port_r]) 
		rotate([90,0,0]) 
			cylinder(r=audio_port_r, h=audio_port_depth);
}

module hdmi_port() {
	translate([wall+(pi_width-hdmi_offset-(hdmi_width/2)), depth-(hdmi_depth/2), wall+mount_stand_h+pcb_height]) 
		cube([hdmi_width, hdmi_depth, hdmi_height]);
}

module micro_usb_port() {
	translate([wall+(pi_width-micro_usb_port_offset-(micro_usb_port_width/2)), depth-(micro_usb_port_depth/2), wall+mount_stand_h+pcb_height]) 
		cube([micro_usb_port_width, micro_usb_port_depth, micro_usb_port_height]);
}

module mount(offset_x, offset_y) {
	translate([wall+(pi_width-pi_mount_offset-offset_x), depth-wall-pi_mount_offset-offset_y, wall])
		cylinder(r=mount_stand_r,h=mount_stand_h, center=true);

	translate([wall+(pi_width-pi_mount_offset-offset_x), depth-wall-pi_mount_offset-offset_y, wall+mount_stand_h])
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