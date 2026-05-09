# Ngoni — CAD Notes

**Instrument:** Ngoni (Kamele N'goni)  
**Date:** 2026-05-08  
**CAD Status:** Not yet started — these notes define the modeling strategy for when CAD is initiated.

---

## Recommended CAD Approach

The ngoni has four distinct geometric assemblies that benefit from parametric CAD:

1. **Segmented bowl** — parametric ring profile (outer Ø, wall, ring height, segment count)
2. **Neck** — simple revolve or extrude with taper profile
3. **Bridge** — prismatic body with notch array
4. **Full assembly** — bowl + neck + bridge + string schematic

### SolidWorks Workflow (preferred per Tony's shop standard)

Follow the MasterLayout pattern used in other repos (fujara → moseno via Pack-and-Go). See `references/solidworks-integration.md`.

**Global equations to set up first:**

```
bowl_OD = 12.6  "in"
bowl_depth = 6.5  "in"
neck_length = 30.0  "in"
neck_diam = 1.0  "in"
wall_thick = 0.375  "in"
seg_count = 10  ""
ring_height = 0.625  "in"
bridge_width = 4.0  "in"
bridge_height_stock = 0.75  "in"
```

**Design table columns (for Donso/Kamele 10/Kamele 14 configurations):**

| Config | bowl_OD | bowl_depth | neck_length | seg_count |
|---|---|---|---|---|
| Donso_6 | 10.0 | 5.0 | 24.0 | 10 |
| Kamele_10 | 12.6 | 6.5 | 30.0 | 10 |
| Kamele_14 | 17.7 | 8.0 | 36.0 | 12 |

---

## Bowl Modeling Strategy

The segmented bowl is best modeled as a **revolved profile** (for the turned final shape) combined with a **segment layout sketch** (for the cut list).

1. Create a `MasterLayout.SLDPRT` with the bowl profile sketch in the front plane
2. Revolve 360° for the turned bowl solid
3. Create a separate `Segment.SLDPRT` referencing the ring dimensions via in-context references or design table
4. Assembly: `BowlAssembly.SLDASM` with 10 segments patterned into a ring, 11 rings stacked

**Bowl profile sketch parameters (Kamele 10):**

- Start at base: X = 3.5 in (half of 7.0 in base Ø), Y = 0
- Head rim: X = 6.3 in (half of 12.6 in OD), Y = 6.5 in
- Profile: parabolic spline; tangent vertical at base, tangent horizontal at rim

---

## Neck Modeling Strategy

Simple revolve of a swept profile:
- Sketch: D-section or round, 1.0 in diameter
- Extrusion: 30.0 in
- Bowl-entry end: turn down to 1.25 in Ø clearance (to match bowl entry hole) for last 3 in

---

## Bridge Modeling Strategy

Extrude 4.0 × 2.0 × 0.75 in block, then:
- Subtract parabolic crown pocket (1/16 in deep, 4 in wide)
- Notch feature array: 10 × (1 mm wide × 1 mm deep slot), 8 mm spacing, centered on length

---

## Files to Create (when CAD is initiated)

```
cad/
  NGO_MasterLayout.SLDPRT     ← global equations + bowl profile sketch
  NGO_BowlRevolved.SLDPRT     ← turned bowl solid
  NGO_BowlSegment.SLDPRT      ← single segment
  NGO_Neck.SLDPRT             ← neck body
  NGO_Bridge.SLDPRT           ← bridge with notches
  NGO_Assembly.SLDASM         ← full assembly
  sw-design-table.xlsx        ← SolidWorks design table (3 configs)
```

---

## sw-reference/ Folder

Per Tony's shop standard (`references/solidworks-integration.md`), maintain a `sw-reference/` folder with:
- Extracted dimension CSV from `Extract_Dimensions.swp` macro
- Round-trip validation report (once CAD is built)
- Any STEP exports for CNC CAM import

---

## OpenSCAD Alternative

If SolidWorks is not available, the bowl can be generated in OpenSCAD:

```openscad
// Ngoni bowl — parametric OpenSCAD starter
bowl_OD = 12.6 * 25.4;  // mm
bowl_depth = 6.5 * 25.4;
wall = 0.375 * 25.4;
seg_count = 10;

module bowl_profile() {
  difference() {
    cylinder(h=bowl_depth, r1=bowl_OD/2*0.56, r2=bowl_OD/2, center=false);
    translate([0,0,wall])
      cylinder(h=bowl_depth, r1=bowl_OD/2*0.56-wall, r2=bowl_OD/2-wall, center=false);
  }
}
bowl_profile();
```

This is a first-order frustum approximation only. Replace with a proper lathe-profile revolved solid for manufacturing drawings.
