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




$fn=30;
difference() {
	minkowski() {
		translate([wall, wall, wall]) cube([width-(2*wall), depth-(2*wall), height]);
		sphere(1);
	}		
	translate([wall*2, wall*2, wall*2]) cube([width-(4*wall), depth-(4*wall), height]);
	translate([0,0,edge]) cube([width,wall*3, height]);
	translate([0,depth-(3*wall),height-edge]) cube([width,wall*3, height]);	
	translate([0,3*wall, edge]) rotate([side_angle,0,0])cube([wall*3, depth-(wall*2), height]);
	translate([width-(3*wall),3*wall, edge]) rotate([side_angle,0,0])cube([wall*3, depth-(wall*2), height]);	
}

translate([(wall*2)+(pi_width-pi_mount_offset-pi_mount_width_apart),depth-(wall*2)-pi_mount_offset,wall*2])
	cylinder(r=mount_stand_r,h=mount_stand_h, center=true);

translate([(wall*2)+(pi_width-pi_mount_offset-pi_mount_width_apart),depth-(wall*2)-pi_mount_offset,wall*2+mount_stand_h])
	cylinder(r=mount_rod,h=mount_stand_h, center=true);

translate([(wall*2)+(pi_width-pi_mount_offset-pi_mount_width_apart),depth-(wall*2)-pi_mount_offset-pi_mount_depth_apart,wall*2])
	cylinder(r=mount_stand_r,h=mount_stand_h, center=true);

translate([(wall*2)+(pi_width-pi_mount_offset-pi_mount_width_apart),depth-(wall*2)-pi_mount_offset-pi_mount_depth_apart,wall*2+mount_stand_h])
	cylinder(r=mount_rod,h=mount_stand_h, center=true);
	
	




