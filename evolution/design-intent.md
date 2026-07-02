# Design Intent — ngoni rev A

- Master CAD: `cad/ngoni.scad` (sha256: ab49b74aca2741e1ebc12429e5a194fd297650e4a6480008d166325cb9a6d540), driven by `ngoni-design-table.xlsx` (sha256: 13ecf74265e412cd1b975115a1e41aa389117c7f589585df98a72e0aa6f25f42)
- Function: Ngoni (Kamele N'goni), a Mande bowl-lute. A segmented, lathe-turned walnut bowl with a goatskin head is a skin-radiator resonator; nylon monofilament strings (all on one side of a single neck, over one notched bridge plane) carry static tension in a pentatonic D-F-G-A-C tuning. Variant-aware: Donso (6), Kamele (10), Kamele (14).
- Environment: indoor instrument; solid-wood bowl + goatskin head move with humidity (soak/stretch skin per build method). String pull is a sustained load on the neck-through-bowl joint and the bridge bearing on the skin.
- Target qty: 1 (prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances) — Kamele 10 shown, variant-indexed in CAD

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Bowl outer Ø | 12.6 in (Donso 10 / K14 17.7) | turning gauge + lathe swing | resonance / fit | xlsx DESIGN INPUTS Bowl Outer Ø |
| Bowl depth | 6.5 in (Donso 5 / K14 8) | profile check | resonance / stiffness | xlsx DESIGN INPUTS Bowl Depth |
| Ring stack | 11 rings × 0.625 in, 10 seg/ring, 18° miter | miter-sled setup | segmented-bowl fabrication | xlsx SEGMENTED BOWL |
| Wall thickness | 0.375 in target | lathe deflection | tone vs. strength | cad-notes global equations |
| Neck length | 30 in (Donso 24 / K14 36) | straightedge | scale / reach | xlsx DESIGN INPUTS Neck Length |
| Neck-through-bowl hole | single (Ngoni not Kora) | dry-fit | neck load path | xlsx BUILD METHOD step 5 |
| String set | 10 nylon (Donso 6 / K14 14), D-F-G-A-C | tuner after settling | intonation | xlsx STRING SCHEDULES |
| String length envelope | 6.5–22 in (Donso 7–18 / K14 6–28) | measured vs. neck curve | intonation | xlsx DESIGN INPUTS Shortest/Longest String |
| Bridge | 4 × 2 × 0.5 in, notch count = string_count, crown 1/16 in | notch layout gate | string spacing / bearing | xlsx BOM + cad-notes |

## Incidental (free for DFM)

- Bowl exterior styling within the lathe profile, neck cross-section styling (round vs. D), cosmetic finish, tuning-ring vs. peg choice.

## Must-nots (DFM may never violate)

- Bowl segment geometry stays equation-driven (segments/ring, miter, ring thickness) — do not hand-fudge segment counts (xlsx SEGMENTED BOWL).
- Single neck-through-bowl hole only — do not add a second (Kora pattern) (xlsx BUILD METHOD step 5).
- Do not string before the bridge/skin bearing and neck joint are dry-fit; start middle strings out (xlsx BUILD METHOD step 8; risks.md).
- Do not thin the bowl wall below the turned 0.375 in target without deflection review.
- String vibrating lengths are starting points — adjust to the actual neck curve and bridge placement before final slotting (xlsx DESIGN NOTES 7).

## Material intent

- Preferred: Black Walnut bowl, Hard Maple neck + bridge, rawhide goatskin head, nylon monofilament strings, leather/wood tuning rings, optional under-bridge piezo (xlsx BOM, bom.csv).
- Acceptable subs: per sourcing.csv (spec-first; live prices unverified).
- Forbidden: wound strings (all plain nylon at these tensions/lengths — xlsx DESIGN NOTES 5).

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable.
