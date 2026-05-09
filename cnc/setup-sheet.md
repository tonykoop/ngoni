# Ngoni — CNC Operation / Setup Sheet

**Instrument:** Ngoni (Kamele N'goni) — Kamele 10  
**Date:** 2026-05-08  
**Note:** The ngoni is primarily a lathe + hand-tool build. CNC use is limited to the bridge notch profiling and the optional neck rough-profile pass. This sheet covers both operations.

---

## Pre-CAM Checklist (read before opening CAM software)

- [ ] Design.md reviewed and ring cut list confirmed
- [ ] Bridge blank machined to final outer dimensions (4 × 2 × 0.75 in) before CNC
- [ ] Bridge notch layout template verified (8 mm spacing, 10 notches)
- [ ] Neck blank jointed/planed to 1.5 × 1.5 in before CNC rough pass
- [ ] Workholding strategy confirmed (bridge: double-stick tape on spoilboard; neck: V-block fixture)
- [ ] Tool availability verified: 1/8 in ball-end mill; 1/4 in end mill; 1/4 in straight bit

---

## Operation 1 — Bridge Notch Profile (CNC Router)

| Field | Value |
|---|---|
| Part | Bridge (NGO-BR01) |
| Stock size | 4.0 in × 2.0 in × 0.75 in Hard Maple |
| Machine | CNC router (Maker Nexus or shop router) |
| Fixture | Double-stick tape on spoilboard; clamp if slipping |
| Datum | Bottom-left corner of bridge stock (X0 Y0 at corner) |
| Z zero | Top of bridge crown after crown pass |

### Operations

| Step | Operation | Tool | Depth/Pass | Feed | Speed | Notes |
|---|---|---|---|---|---|---|
| 1a | Crown arch pass (top surface) | 1/4 in ball-end mill | 0.0625 in total depth, 1 pass | 80 ipm | 18,000 RPM | Profile: parabolic arc from edge (Z=0) to center (Z = −0.0625 in); single pass |
| 1b | Notch pockets (10×) | 1/8 in ball-end mill (or 1/8 in end mill) | 1 mm deep (0.040 in) × 1 mm wide | 30 ipm | 20,000 RPM | X positions: 0.177, 0.492, 0.807, 1.122, 1.437, 1.752, 2.067, 2.382, 2.697, 3.012 in from datum X; Y centered on bridge width (1.0 in); do not cut through bottom |
| 1c | Profile cleanup pass (optional) | 1/4 in end mill | Perimeter only, 0.010 in radial cleanup | 60 ipm | 18,000 RPM | Clean up any fuzz from notch pass |

**Pre-CAM assumptions:**
- Bridge stock is already at final outer dimensions before mounting
- Crown profile is shallow enough that one pass is safe (maple at 1/4 in ball-end)
- Notch spacing: 8 mm = 0.3150 in c/c; 10 notches span 81 mm (3.189 in) centered on 4 in bridge

**Release check:** Dry-fit one string in each notch before gluing bridge. String should seat in notch without binding; should not fall out freely.

---

## Operation 2 — Neck Rough Profile (CNC Router, optional)

| Field | Value |
|---|---|
| Part | Neck blank (NGO-N01) |
| Stock size | 1.5 in × 1.5 in × 32 in Hard Maple |
| Machine | CNC router with long-travel Y (need ≥ 32 in Y travel) |
| Fixture | V-block fixture clamped to table; toe clamps at both ends |
| Datum | Top centerline of neck blank (X0 at centerline, Y0 at headstock end) |
| Z zero | Top of 1.5 in blank |

### Operations

| Step | Operation | Tool | Depth/Pass | Feed | Speed | Notes |
|---|---|---|---|---|---|---|
| 2a | Top profile — knock corners | 1/4 in ball-end mill | 3 passes: 0.15, 0.15, 0.10 in depth | 80 ipm | 18,000 RPM | Remove top two corners to approximate round; 3 passes per side |
| 2b | Side profile — round profile | 1/4 in ball-end mill | 2 passes per side | 80 ipm | 18,000 RPM | Bring OD to ~1.1 in rough; finish by hand with spokeshave |
| 2c | Headstock taper (if CNC'd) | 1/4 in end mill | Profile headstock region last 4 in | 60 ipm | 16,000 RPM | Optional; many builders prefer spokeshave for this |

**Pre-CAM assumptions:**
- Router table travel must be ≥ 32 in (otherwise do this operation by hand — spokeshave is the recommended path)
- V-block fixture must be confirmed before operation; toe clamps 1 in from each end
- Final neck diameter is achieved by hand (spokeshave + rasp + sandpaper); CNC only for rough stock removal

**Alternative (preferred for most shops):** Skip CNC on neck entirely. Use bandsaw to knock off corners, spokeshave to profile, sandpaper to finish. Typical time: 60–90 minutes. No fixture or program required.

---

## Operation 3 — Segment Miter Cuts (Table Saw — not CNC)

This operation is explicitly handled on the table saw with a miter sled, not the CNC router. See jig-decision.md for setup details.

---

## Release Gates (both CNC operations)

- [ ] Test cut on scrap material before running production parts
- [ ] Bridge: verify notch spacing with calipers after Op 1b (target 8.0 ± 0.3 mm)
- [ ] Bridge: verify no chatter or tear-out in crown surface before declaring done
- [ ] Neck: verify OD after rough pass is ≥ 1.05 in (leave enough for spokeshave)
- [ ] All clamps and tape checked before spindle start
- [ ] Emergency stop location confirmed

---

## Tools Required

| Tool | Size | Purpose |
|---|---|---|
| Ball-end mill | 1/4 in, 2-flute, carbide | Bridge crown arch; neck rough profile |
| End mill | 1/8 in, 2-flute, carbide | Bridge notch pockets |
| End mill | 1/4 in, 2-flute, carbide | Bridge profile cleanup |
| Collet | 1/4 in and 1/8 in | Match to router |
| V-block | Fits 1.5 in square stock | Neck holding |
| Double-stick tape | — | Bridge holding |
