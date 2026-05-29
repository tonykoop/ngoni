// Ngoni parametric placeholder geometry.
// NOT fabrication authority. Scaffold for future CAD authoring.
// Dimensions from ngoni-design-table.xlsx (segmented lathe-turned bowl baseline).
// Authority: pending_measurement — do not use for fabrication without
// review against a measured template.

bowl_dia_in         = 10.0;  // small form baseline; large form ~14 in
bowl_depth_in       = 4.75;
neck_length_in      = 24.0;
neck_dia_in         = 1.25;
bridge_height_in    = 0.5;
skin_thickness_in   = 0.04; // goatskin placeholder
string_count        = 6;    // 6-string hunter form; 10-12 modern

module bowl_shell() {
  scale([bowl_dia_in/2, bowl_dia_in/2, bowl_depth_in])
    difference() {
      sphere(1, $fn=96);
      translate([0, 0, 0.10]) scale([0.85, 0.85, 0.85]) sphere(1, $fn=96);
      translate([-2, -2, -2]) cube([4, 4, 2]);
    }
}

module neck() {
  translate([0, 0, -bowl_depth_in * 0.1])
    cylinder(h=neck_length_in, d=neck_dia_in, $fn=32);
}

bowl_shell();
neck();
