include<params.scad>;

$fn=30;

module base() {
	difference() {
		// Outer shell
		minkowski() {
			difference() {
				translate([wall, wall, wall]) cube([width-(2*wall), depth-(2*wall), height-(2*wall)]);
				translate([-1, 0, height-edge-wall]) 	
					rotate([top_angle,0,0]) 
							cube([width+(wall*2), pi_depth*2, edge]);
			}			
			sphere(1);
		}
		
		// Center cut out
		translate([wall, depth-pi_depth-4, 0]) 
			cube([width-(2*wall), pi_depth-wall+4, height-wall]); 

		// Center cut out
		translate([wall, wall, 0]) 
			cube([width-(2*wall), edge, height-edge-wall]); 

		translate([wall, wall*3, 0]) 
			rotate([top_angle,0,0]) 
				cube([width-(2*wall), pi_depth-wall, height-edge-wall]); 

		// Front cut out
		translate([-1,-1,-1]) 
			cube([width+(wall*2), edge_inset+1, edge+1]);

		// Back cut out
		translate([-1, depth-edge_inset , -1]) 
			cube([width+wall*2, wall*5, height-edge+1]);

		// Diagonal edges
		translate([-1, edge_inset, -(height-edge)]) 	
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

difference() {
	base();
	etherent_port();
	usb_port(usb_port_a_offset);
	usb_port(usb_port_b_offset);
}