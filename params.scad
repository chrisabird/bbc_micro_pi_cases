depth = 116;
width = 132;
height = 24;
edge = 5;
edge_inset=4;
wall = 1;


pi_width=85;
pi_depth=56;
pi_mount_offset=3.5;
pi_mount_width_apart=58;
pi_mount_depth_apart=49;

side_angle=atan((height-edge*2)/(depth-(edge_inset*2)));
top_angle=atan(edge/(depth-wall-wall-pi_depth)); // 3.81
mount_stand_r=2.5;
mount_stand_h=3;
mount_rod=1.2;



pcb_height=1.4;

ethernet_port_width=18;
ethernet_port_depth=20;
ethernet_port_height=14;
ethernet_port_offset=10.25;

usb_port_width=17;
usb_port_depth=20;
usb_port_height=16;
usb_port_a_offset=29;
usb_port_b_offset=47;

audio_port_depth=20;
audio_port_r=4;
audio_port_offset=53.5;

hdmi_width=17;
hdmi_height=7;
hdmi_depth=20;
hdmi_offset=32;

micro_usb_port_depth=20;
micro_usb_port_width=9;
micro_usb_port_height=3;
micro_usb_port_offset=10.6;
