// Ngoni (Kamele N'goni) — parametric master, variant-aware (Donso / Kamele).
//
// Authority: pending_measurement. NOT fabrication authority until reviewed
// against a measured template (see visual-output-register.csv CAD-001 and
// validation.csv gates). Supersedes the retired cad/ngoni-placeholder.scad.
//
// Dimension sources (do not edit values without updating the source record):
//   - all variant dimensions: ngoni-design-table.xlsx sheet "Ngoni",
//     DESIGN INPUTS block (Bowl Outer Ø, Bowl Depth, Neck Length, String Count,
//     Shortest/Longest String) and SEGMENTED BOWL block (Segments per Ring 10,
//     Ring Thickness 0.625 in).
//   - bridge stock 4 x 2 x 0.5 in, notch count = string_count, crown pocket
//     1/16 in deep x 4 in wide: ngoni-design-table.xlsx BOM + cad/cad-notes.md
//     "Bridge Modeling Strategy".
//   - single neck-through-bowl hole (Ngoni has one neck hole, not Kora's two):
//     ngoni-design-table.xlsx BUILD METHOD step 5.
//   - string schedule (pentatonic D-F-G-A-C, Mersenne-Taylor): xlsx STRING
//     SCHEDULES — vibrating lengths NOT modeled per-note; string band uses the
//     shortest/longest envelope only.
//
// Units: inches.

/* [Variant] */
// 0 = Donso (6), 1 = Kamele (10), 2 = Kamele (14)
variant = 1;

// Per-variant design-table inputs (index by variant). xlsx DESIGN INPUTS.
string_counts     = [6, 10, 14];
bowl_od_in_tbl    = [10.0, 12.6, 17.7];
bowl_depth_in_tbl = [5.0, 6.5, 8.0];
neck_length_in_tbl= [24.0, 30.0, 36.0];
short_string_in_tbl = [7.0, 6.5, 6.0];
long_string_in_tbl  = [18.0, 22.0, 28.0];

string_count  = string_counts[variant];
bowl_od_in    = bowl_od_in_tbl[variant];
bowl_depth_in = bowl_depth_in_tbl[variant];
neck_length_in= neck_length_in_tbl[variant];
short_string_in = short_string_in_tbl[variant];
long_string_in  = long_string_in_tbl[variant];

/* [Segmented bowl — xlsx SEGMENTED BOWL] */
segments_per_ring = 10;      // xlsx: Segments per Ring
ring_thickness_in = 0.625;   // xlsx: Ring Thickness (5/8 in)
wall_thickness_in = 0.375;   // cad-notes global equations (target 3/8 in wall)
base_ratio        = 0.56;    // base Ø / OD (cad-notes Kamele-10 profile: 7.0/12.6)

/* [Neck — xlsx + cad-notes] */
neck_dia_in       = 1.0;     // cad-notes neck_diam
neck_entry_dia_in = 1.25;    // cad-notes: turn-down to 1.25 in at bowl entry
neck_entry_len_in = 3.0;     // cad-notes: last 3 in

/* [Bridge — xlsx BOM + cad-notes] */
bridge_len_in     = 4.0;     // xlsx BOM bridge blank 4 in
bridge_width_in   = 2.0;     // xlsx BOM bridge blank 2 in
bridge_height_in  = 0.5;     // xlsx BOM bridge blank 0.5 in
bridge_notch_spacing_in = 0.315; // cad-notes: 8 mm spacing (~0.315 in)
crown_depth_in    = 0.0625;  // cad-notes: 1/16 in crown pocket
crown_width_in    = 4.0;     // cad-notes: 4 in crown

/* [Head] */
skin_thickness_in = 0.04;    // goatskin placeholder (prototype_assumption)

$fn = 96;

// ---------------------------------------------------------------------------
// Derived geometry (formulas, not baked values)
// ---------------------------------------------------------------------------
bowl_r_in   = bowl_od_in / 2;
base_r_in   = bowl_r_in * base_ratio;
num_rings   = ceil(bowl_depth_in / ring_thickness_in);   // xlsx cut list = 11 for Kamele10
miter_deg   = 180 / segments_per_ring;                   // 18 deg for 10 segments
function string_len(i) =                                 // shortest..longest envelope
  short_string_in + (long_string_in - short_string_in) *
  ((string_count <= 1) ? 0 : i / (string_count - 1));

// ---------------------------------------------------------------------------
// Component modules
// ---------------------------------------------------------------------------
// Turned bowl profile (revolved), frustum-plus-curve approximation of the
// stave/ring-stacked, lathe-turned walnut bowl. base tangent vertical, rim wide.
module bowl_shell() {
  color("SaddleBrown")
  rotate_extrude()
    polygon([
      [0, 0],
      [base_r_in, 0],
      [bowl_r_in, bowl_depth_in],
      [bowl_r_in - wall_thickness_in, bowl_depth_in],
      [base_r_in - wall_thickness_in, wall_thickness_in],
      [0, wall_thickness_in]
    ]);
}

// Ring layout markers: num_rings stacked bands (visual review of the ring stack).
module ring_lines() {
  for (k = [1 : num_rings - 1])
    color("Peru")
    translate([0, 0, k * ring_thickness_in])
      difference() {
        cylinder(h = 0.03, r = bowl_r_in * (0.56 + 0.44 * k / num_rings) + 0.02);
        translate([0,0,-0.01])
          cylinder(h = 0.05, r = bowl_r_in * (0.56 + 0.44 * k / num_rings) - 0.02);
      }
}

module goatskin_head() {
  color([0.93, 0.87, 0.72, 0.9])
    translate([0, 0, bowl_depth_in])
      cylinder(h = skin_thickness_in, r = bowl_r_in);
}

// Neck: passes through a single hole at the bowl head, turned down at entry.
module neck() {
  color("BurlyWood")
  translate([0, 0, bowl_depth_in + skin_thickness_in]) {
    // main neck shaft laid horizontally over the head, rising away from bowl
    rotate([0, 90, 0]) {
      cylinder(h = neck_entry_len_in, d = neck_entry_dia_in);          // entry taper zone
      translate([0, 0, neck_entry_len_in])
        cylinder(h = neck_length_in - neck_entry_len_in, d = neck_dia_in);
    }
  }
}

module bridge() {
  color("Tan")
  translate([bowl_r_in * 0.15, -bridge_width_in/2, bowl_depth_in + skin_thickness_in])
  difference() {
    cube([bridge_len_in, bridge_width_in, bridge_height_in]);
    // crown pocket
    translate([(bridge_len_in - crown_width_in)/2 + crown_width_in/2,
               bridge_width_in/2, bridge_height_in])
      scale([crown_width_in/2, bridge_width_in*0.4, crown_depth_in*2])
        sphere(1, $fn = 48);
    // string notch array (one notch per string)
    for (i = [0 : string_count - 1])
      translate([bridge_len_in/2 + (i - (string_count-1)/2) * bridge_notch_spacing_in,
                 bridge_width_in/2, bridge_height_in])
        cube([0.04, bridge_width_in + 0.1, 0.06], center = true);
  }
}

// String band: string_count nylon strings, one plane (all on one side of neck),
// length envelope shortest..longest. Schematic only, not tuned lengths.
module strings() {
  neck_top_z = bowl_depth_in + skin_thickness_in + neck_dia_in/2;
  for (i = [0 : string_count - 1]) {
    L = string_len(i);
    y = (i - (string_count-1)/2) * bridge_notch_spacing_in;
    color([0.9, 0.9, 0.85])
    hull() {
      translate([bowl_r_in * 0.15 + bridge_len_in/2, y,
                 bowl_depth_in + skin_thickness_in + bridge_height_in]) sphere(d=0.05);
      translate([bowl_r_in * 0.15 + bridge_len_in/2 - L, y, neck_top_z]) sphere(d=0.05);
    }
  }
  echo(variant = variant, string_count = string_count, bowl_od_in = bowl_od_in,
       num_rings = num_rings, miter_deg = miter_deg);
}

// ---------------------------------------------------------------------------
// Top-level assembly
// ---------------------------------------------------------------------------
module ngoni() {
  bowl_shell();
  ring_lines();
  goatskin_head();
  neck();
  bridge();
  strings();
}

ngoni();
