# Ngoni — Parametric Design Document

**Instrument:** Ngoni (Kamele N'goni) — West African plucked-lute  
**Family:** Mande bowl-lute (strings + skin resonator)  
**Variants:** Donso 6-string · Kamele 10-string · Kamele 14-string  
**Scale:** Pentatonic D–F–G–A–C (repeating across octaves)  
**Construction:** Segmented lathe-turned bowl · goatskin head · maple neck · nylon strings  
**Design Stage:** Packet-ready (CAD/prototype pending)  
**Author:** Tony Koop — Heifer Zephyr Instrument Works  
**Date:** 2026-05-08

---

## 1. Governing Physics Model

### 1.1 Strings — Mersenne–Taylor

All strings are plain nylon monofilament. The governing formula is:

```
f = (1 / 2L) × √(T / μ)
```

Where:
- `f` = frequency (Hz)
- `L` = vibrating string length (in)
- `T` = string tension (lbf)
- `μ` = linear mass density = `ρ × π × (d/2)²` (lb/in)
- `ρ` = nylon density = **0.04155 lb/in³**
- `σ_break` = nylon breaking stress = **44,600 psi**
- `g` = **386.4 in/s²** (imperial gravity)

Solved for gauge diameter:
```
d = 2 × √(T × g / (ρ × π × 4 × L² × f²))
```

Percent-breaking (independent of diameter for ideal round string):
```
%break = ρ × 4 × L² × f² / (σ_break × g) × 100
```

**Empirical correction guard:** No NAF K2 or beam K-constant corrections apply here. This is a pure Mersenne–Taylor string model. Mark all tension assumptions as TBD until physical bridge/tuning-ring setup is measured.

### 1.2 Bowl Resonator — Helmholtz + Skin Radiator

The skin-headed bowl acts as a coupled Helmholtz + membrane radiator. Precise resonance tuning is empirical (skin tension and compliance dominate). A first-order estimate:

```
f_H = (c / 2π) × √(A_port / (V_bowl × L_eff_port))
```

- `c` = 13,552 in/s (speed of sound at 68°F)
- `A_port` = neck-entry hole area (π × (d_hole/2)²)
- `V_bowl` = approximate internal volume (cylindrical first-order)
- `L_eff_port` ≈ bowl wall thickness at neck entry hole

Kamele 10 first-order estimate: **≈ 97 Hz** (below F3 = 174.6 Hz fundamental string). Skin compliance will pull this lower. The bowl primarily amplifies by radiation area (skin) and cavity coupling, not sharp Helmholtz resonance. **No tuning correction applied to string schedule** — bowl resonance is treated as broadband amplifier.

---

## 2. Design Inputs (Blue Cells)

| Parameter | Donso 6 | Kamele 10 | Kamele 14 | Unit |
|---|---|---|---|---|
| String count | 6 | **10** | 14 | — |
| Bowl outer Ø | 10.0 | **12.6** | 17.7 | in |
| Bowl depth | 5.0 | **6.5** | 8.0 | in |
| Neck length | 24 | **30** | 36 | in |
| Shortest string (vib) | 7.0 | **6.5** | 6.0 | in |
| Longest string (vib) | 18.0 | **22.0** | 28.0 | in |
| Target tension — treble | 6 | **6** | 6 | lbf |
| Target tension — bass | 10 | **12** | 14 | lbf |
| Segments per ring | 10 | **10** | 12 | — |
| Ring thickness | 5/8 | **5/8** | 5/8 | in |
| Bowl wood | Black Walnut | **Black Walnut** | Black Walnut | — |
| Head material | Goatskin | **Goatskin** | Goatskin | — |
| Neck wood | Hard Maple | **Hard Maple** | Hard Maple | — |

*Kamele 10 is the primary design case. Donso 6 and Kamele 14 are scaling variants.*

---

## 3. String Schedules (Computed — Mersenne–Taylor)

### 3.1 Tension Ramp Convention

Tension increases from treble to bass to keep %breaking in a safe zone (target: 15–55% for all variants). The ramp used:

| Region | Donso 6 | Kamele 10 | Kamele 14 |
|---|---|---|---|
| Treble (high 2–3) | 6 lbf | 6 lbf | 6 lbf |
| Mid | 8 lbf | 8–10 lbf | 8–10 lbf |
| Bass | 10 lbf | 12 lbf | 14 lbf |

### 3.2 Donso 6-String

Pentatonic D5–D4 · Vibrating lengths 7.0–18.0 in

| # | Note | Freq (Hz) | Vib Len (in) | Tension (lbf) | Gauge (in) | Gauge (mm) | % Breaking | Status |
|---|---|---|---|---|---|---|---|---|
| 1 | D5 | 587.33 | 7.0 | 6 | 0.0324 | 0.823 | 16.3 | TBD — verify at bridge |
| 2 | C5 | 523.25 | 8.5 | 6 | 0.0300 | 0.761 | 19.1 | TBD |
| 3 | A4 | 440.00 | 10.0 | 8 | 0.0350 | 0.888 | 18.7 | TBD |
| 4 | G4 | 392.00 | 12.0 | 8 | 0.0327 | 0.831 | 21.3 | TBD |
| 5 | F4 | 349.23 | 14.5 | 10 | 0.0340 | 0.863 | 24.7 | TBD |
| 6 | D4 | 293.66 | 18.0 | 10 | 0.0325 | 0.827 | 26.9 | TBD |

All %breaking values 16–27%: **safe.** Traditional nylon classical guitar: 50–70% treble, 10–30% bass — ngoni runs well below breaking risk.

### 3.3 Kamele 10-String *(primary)*

Pentatonic D5–F3 · Vibrating lengths 6.5–22.0 in

| # | Note | Freq (Hz) | Vib Len (in) | Tension (lbf) | Gauge (in) | Gauge (mm) | % Breaking | Status |
|---|---|---|---|---|---|---|---|---|
| 1 | D5 | 587.33 | 6.5 | 6 | 0.0349 | 0.887 | 14.1 | TBD |
| 2 | C5 | 523.25 | 7.5 | 6 | 0.0340 | 0.863 | 14.9 | TBD |
| 3 | A4 | 440.00 | 9.0 | 6 | 0.0337 | 0.855 | 15.1 | TBD |
| 4 | G4 | 392.00 | 10.5 | 8 | 0.0374 | 0.950 | 16.3 | TBD |
| 5 | F4 | 349.23 | 12.0 | 8 | 0.0367 | 0.933 | 16.9 | TBD |
| 6 | D4 | 293.66 | 14.0 | 10 | 0.0418 | 1.063 | 16.3 | TBD |
| 7 | C4 | 261.63 | 16.0 | 10 | 0.0411 | 1.044 | 16.9 | TBD |
| 8 | A3 | 220.00 | 18.5 | 12 | 0.0463 | 1.176 | 16.0 | TBD |
| 9 | G3 | 196.00 | 20.5 | 12 | 0.0469 | 1.191 | 15.6 | TBD |
| 10 | F3 | 174.61 | 22.0 | 12 | 0.0491 | 1.246 | 14.2 | TBD |

%breaking range 14–17%: **very safe.** Tension range (60–120 lbf total) is well within bowl/neck structural limits. Gauge range 0.855–1.246 mm maps to standard nylon monofilament sizes (0.85, 0.90, 0.95, 1.05, 1.10, 1.20 mm).

### 3.4 Kamele 14-String

Pentatonic D6–G3 · Vibrating lengths 6.0–28.0 in

| # | Note | Freq (Hz) | Vib Len (in) | Tension (lbf) | Gauge (in) | Gauge (mm) | % Breaking | Status |
|---|---|---|---|---|---|---|---|---|
| 1 | D6 | 1174.66 | 6.0 | 6 | 0.0189 | 0.480 | 47.9 | ⚠ High — verify empirically |
| 2 | C6 | 1046.50 | 7.0 | 6 | 0.0182 | 0.462 | 51.8 | ⚠ High — verify empirically |
| 3 | A5 | 880.00 | 8.5 | 6 | 0.0178 | 0.453 | 54.0 | ⚠ High — acceptable for treble |
| 4 | G5 | 783.99 | 9.5 | 6 | 0.0179 | 0.454 | 53.5 | ⚠ High — acceptable for treble |
| 5 | F5 | 698.46 | 10.5 | 8 | 0.0210 | 0.533 | 51.9 | ⚠ High — acceptable |
| 6 | D5 | 587.33 | 12.0 | 8 | 0.0218 | 0.555 | 47.9 | OK |
| 7 | C5 | 523.25 | 14.0 | 8 | 0.0210 | 0.534 | 51.8 | ⚠ High — acceptable for treble |
| 8 | A4 | 440.00 | 16.0 | 10 | 0.0244 | 0.621 | 47.8 | OK |
| 9 | G4 | 392.00 | 18.0 | 10 | 0.0244 | 0.619 | 48.0 | OK |
| 10 | F4 | 349.23 | 20.0 | 12 | 0.0270 | 0.685 | 47.0 | OK |
| 11 | D4 | 293.66 | 22.0 | 12 | 0.0292 | 0.741 | 40.3 | OK |
| 12 | C4 | 261.63 | 24.0 | 14 | 0.0324 | 0.824 | 38.0 | OK |
| 13 | A3 | 220.00 | 26.0 | 14 | 0.0356 | 0.904 | 31.6 | OK |
| 14 | G3 | 196.00 | 28.0 | 14 | 0.0371 | 0.942 | 29.0 | OK |

⚠ Strings 1–7 are at 48–54% breaking — in range for treble nylon (classical guitar trebles run 50–70%), but this variant requires **fine nylon monofilament (0.45–0.55 mm)** which is fragile. Consider raising tension slightly to 7–8 lbf on strings 1–5 to allow a thicker gauge if breakage occurs on prototype.

---

## 4. Segmented Bowl — Ring Cut List (Kamele 10)

**Method:** 10 segments per ring · 18° miter angle · 5/8" ring height · lathe-turned exterior/interior

Bowl profile: parabolic interpolation from 7.0" Ø (base ring) to 12.6" Ø (head rim).  
Bottom: solid disc or closed-bowl lathe turning (separate base plug, optional).  
Wall target: 3/8" finished thickness.

| Ring | Height from base (in) | Outer Ø (in) | Inner Ø (in) | Wall (in) | Board W min (in) | Seg length (in) |
|---|---|---|---|---|---|---|
| 1 | 0.31 | 7.0 | 6.25 | 0.375 | 0.75 | 2.20 |
| 2 | 0.94 | 8.0 | 7.25 | 0.375 | 0.75 | 2.51 |
| 3 | 1.56 | 9.0 | 8.25 | 0.375 | 0.75 | 2.83 |
| 4 | 2.19 | 9.8 | 9.05 | 0.375 | 0.75 | 3.08 |
| 5 | 2.81 | 10.5 | 9.75 | 0.375 | 0.75 | 3.30 |
| 6 | 3.44 | 11.1 | 10.35 | 0.375 | 0.75 | 3.49 |
| 7 | 4.06 | 11.6 | 10.85 | 0.375 | 0.75 | 3.64 |
| 8 | 4.69 | 12.0 | 11.25 | 0.375 | 0.75 | 3.77 |
| 9 | 5.31 | 12.3 | 11.55 | 0.375 | 0.75 | 3.86 |
| 10 | 5.94 | 12.5 | 11.75 | 0.375 | 0.75 | 3.93 |
| 11 | 6.25 (trim) | 12.6 | 11.85 | 0.375 | 0.75 | 3.96 |
| **Total** | — | — | — | — | — | **110 segments** |

*Miter angle:* 18° (= 180°/10 segments). Set table-saw miter sled once; cut all segments.  
*Cut extras:* 10% buffer → cut **121 segments** total.  
*Board footage estimate:* ~3 board-feet of 4/4 Black Walnut (8/4 preferred for thicker initial walls).

---

## 5. Neck Geometry (Kamele 10)

| Parameter | Value | Notes |
|---|---|---|
| Total neck length | 30 in | From bowl entry to headstock |
| Vibrating scale (longest) | 22 in | String 10: F3 |
| Neck diameter / profile | 1.0" round or D-profile | Traditional ngoni neck is roughly round |
| Neck wood | Hard Maple, straight grain | High E modulus; resists bow under string load |
| Neck-through hole in bowl | 1.25" Ø | Drill at headstock end of bowl; single hole |
| Neck protrusion inside bowl | 1.5 in | Enough to wedge/glue securely |
| Bridge placement | ~1.5 in from skin edge | On skin, not on wood rim |
| Nut (string anchor) | 1 in from headstock end | Hardwood dowel or aluminum rod |

**Neck deflection estimate (first principles):** At 120 lbf total string load (Kamele 10 max), treating neck as a cantilevered beam of Hard Maple (E ≈ 12.6 GPa = 1,828,000 psi), 30" length, 1.0" diameter:

```
I = π × d⁴ / 64 = π × 1.0⁴ / 64 = 0.049 in⁴
δ_max = F × L³ / (3 × E × I) ≈ 120 × 30³ / (3 × 1,828,000 × 0.049) ≈ 0.048 in
```

≈ 0.048" = 1.2 mm tip deflection at full load. **Acceptable** (classical guitar neck spec is ≤ 0.5 mm under playing tension). Taper the neck toward headstock if thinner profile is desired.

---

## 6. Bridge Notes

The ngoni bridge sits on the skin under string tension — it is **not glued** to the bowl or neck. Bridge stability depends entirely on the downward component of string tension pressing it against the skin.

- All 10 strings on one side of the neck (unlike the Kora which splits to two banks)
- Bridge notch spacing: even, ~8 mm apart
- Bridge height: 0.5–0.75 in above skin plane (keeps string angle ≥ 10° over bridge)
- Bridge foot print: broad (2–3 in × 0.5 in) to distribute load on skin
- Material: Hard Maple; crown top, flat bottom
- **Risk:** bridge tipping if string angle is too shallow — ensure total bearing angle ≥ 10°

---

## 7. Resonator Assumptions

| Assumption | Value | Confidence |
|---|---|---|
| Bowl internal volume (Kamele 10) | ~810 in³ (~13.3 L) | Derived estimate — cylindrical approx |
| Helmholtz f (neck port, rigid walls) | ~97 Hz | First-order estimate only |
| Skin compliance effect | Shifts resonance lower, broadens Q | Qualitative |
| Goatskin thickness | 0.020–0.030 in (0.5–0.75 mm) | Typical; verify on purchased skin |
| Skin pretension after drying | TBD — measure with string tension gauge | Empirical required |
| Bowl volume vs skin area coupling | Primarily skin-radiator mode | Literature analogy (banjo, kora) |

---

## 8. Open Questions / TBD

| # | Item | Owner | Priority |
|---|---|---|---|
| 1 | Verify string gauge availability (0.85–1.25 mm nylon monofilament) | Sourcing | High |
| 2 | Confirm bridge tipping geometry with physical mockup | Build | High |
| 3 | Measure goatskin thickness and initial tension after drying | Build | High |
| 4 | Tune string tensions empirically (adjust blue T cells to match feel) | Build | Medium |
| 5 | Verify 12" lathe swing clears 12.6" bowl blank | Shop setup | Medium |
| 6 | Confirm neck-through hole positioning (bowl balance point) | CAD | Medium |
| 7 | 14-string variant: test fine strings (0.45–0.55 mm) for breakage | Prototype | Low |
| 8 | Wolfram notebook: validate membrane mode (0,1) prediction against measured skin | Wolfram | Low |
