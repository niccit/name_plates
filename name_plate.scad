$fa = 1;
$fs = 0.4;

show_all = true;
show_top_plate = false;
show_bottom_plate = false;
show_front_plate = false;

module top_plate_top_half(l=188, w=149, h=4) {
    difference() {
        cube([l, w, h], center=true);
        translate([0, -40, -1])
            add_text(text="Brady M210", size=14);
        translate([0, -60, -1])
            add_text(text="Label Printer", size=14);
    }
}

module top_plate_bottom_half(l=188, w=149, h=4) {
    difference() {
        cube([l, w, h], center=true);
        translate([0, 60, -1])
            add_text(text="and Accessories", size=14);
    }
}

module front_plate(l=197, w=83, h=4) {
    difference() {
        cube([l, w, h], center=true);
        add_text(text="Brady M210 Label Printer", size=12);
    }
}


default_font="Roboto:style=Bold";
default_font_size=24;
default_font_direction="ltr";
default_font_spacing=1;

module add_text(text="TEST", font=default_font, size=default_font_size, height=6, direction=default_font_direction, spacing=default_font_spacing, halign="center", valign="center") {

   linear_extrude(height = height) {
   text(text, font=font, size=size, direction=direction, spacing=spacing, halign=halign, valign=valign);
   }
}

if (show_all == true) {
    top_plate_top_half();
    translate([0, -150, 0])
        top_plate_bottom_half();
    translate([-200, -60, 0])
        front_plate();
}

if (show_top_plate == true) {
    top_plate_top_half();
}

if (show_bottom_plate == true) {
    top_plate_bottom_half();
}

if (show_front_plate == true) {
    front_plate();
}