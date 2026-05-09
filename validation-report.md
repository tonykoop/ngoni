# Ngoni — Validation Report

**Instrument:** Ngoni (Kamele N'goni)  
**Validator:** instrument-maker-v4.3 — verifier specialist  
**Date:** 2026-05-08  
**Mode:** Root-mode (Mode A repo)  
**Status:** Pre-prototype · All checks are predictive

---

## Packet Completeness Check

### Required Files (v4.3 root-mode)

| File / Folder | Required | Present | Notes |
|---|---|---|---|
| README.md | ✅ | ✅ | Updated with full packet overview |
| design.md | ✅ | ✅ | Parametric; all string schedules computed |
| bom.csv | ✅ | ✅ | 22 line items, 3 variants |
| sourcing.csv | ✅ | ✅ | 5 key materials with supplier options |
| cut-list.csv | ✅ | ✅ | 11 rings + neck + bridge + anchor rod |
| validation.csv | ✅ | ✅ | 20 checks (V-01 through V-20) |
| assembly-manual.md | ✅ | ✅ | 19 steps with checkboxes |
| supplier-rfq.md | ✅ | ✅ | 5 RFQ templates |
| visual-bom-brief.md | ✅ | ✅ | Photo direction for 10 parts |
| drawing-brief.md | ✅ | ✅ | Spec for DWG-NGO-001 through 006 |
| photo-shotlist.md | ✅ | ✅ | 16 in-progress + 7 finished shots |
| risks.md | ✅ | ✅ | 5 categories, 16 risks, each with test |
| resources.md | ✅ | ✅ | Cultural context + bibliography |
| jig-decision.md | ✅ | ✅ | 8 steps, jig decisions each |
| drawings/ (≥1 SVG) | ✅ | ✅ | ngoni-assembly.svg + ngoni-bridge-detail.svg |
| cad/ (notes or model) | ✅ | ✅ | cad-notes.md with SW + OpenSCAD strategy |
| cnc/setup-sheet.md | ✅ | ✅ | 3 operations (bridge, neck, segments) |
| wolfram/*.wl | ✅ | ✅ | ngoni-model.wl — 8 sections |
| site/index.html | ✅ | ✅ | Full build-log site with all tables |
| Ngoni-Capstone.pptx | ✅ | ⚠ PENDING | Shell unavailable; script written at outputs/gen_ngoni_deck.js — run when shell recovers |
| Ngoni-Print-Packet.html | ✅ | ✅ | Print-to-PDF from browser |
| ngoni-design-table.xlsx | context | ✅ | Pre-existing; referenced in design.md |
| images/ folder | placeholder | ✅ | Folder exists; photos pending prototype |
| data/ folder | placeholder | ✅ | Folder exists; measurements pending |

**Packet completeness: 21 / 22 required files present. 1 pending (pptx, shell issue).**

---

## Physics Validation

### String Model (Mersenne–Taylor)

| Check | Result |
|---|---|
| A4 = 440.00 Hz sanity (String 3, 9.0 in, 6 lbf, 0.0337 in gauge) | f = (1/18.0) × √(6 × 386.4 / (0.04155 × π × 0.0169²)) ≈ 440 Hz ✓ |
| D4 = 293.66 Hz (String 6, 14.0 in, 10 lbf) | Formula predicts 293.66 Hz with 0.0418 in gauge ✓ |
| % breaking range — Kamele 10 | 14.1–16.9% → safe (target: <70%) ✓ |
| % breaking range — Donso 6 | 16.3–26.9% → safe ✓ |
| % breaking range — Kamele 14 str 1–7 | 47.9–54.0% → ⚠ high but within classical treble range (50–70%); flagged in risks.md A-02 |
| NAF K2 corrections applied? | ✗ None applied — correct; model is Mersenne–Taylor only |
| Beam K-constants applied? | ✗ None applied — correct |

### Bowl Resonator (Helmholtz)

| Check | Result |
|---|---|
| First-order estimate formula correct | f_H = (c/2π) × √(A/VL) ✓ |
| Kamele 10 estimate: ~97 Hz | Below lowest string F3 = 174.6 Hz ✓ (broadband, not sharp resonator) |
| Skin compliance noted as dominant factor | ✓ (documented in design.md §7) |
| No string tuning correction applied from bowl resonance | ✓ Correct |

### Neck Deflection

| Check | Result |
|---|---|
| Formula: δ = FL³/(3EI) | ✓ Standard cantilever beam formula |
| Hard Maple E = 1.83 Mpsi | ✓ Within range (12.6 GPa) |
| I = π×d⁴/64 = 0.049 in⁴ (1.0 in Ø) | ✓ |
| δ at 120 lbf: 0.048 in | ✓ < 0.050 in limit |
| Classical guitar spec: ≤ 0.5 mm (0.020 in) under string tension | ⚠ Note: guitar spec is for a different load case (perpendicular to strings at saddle); ngoni neck load is roughly along neck axis; deflection is a shear/bending hybrid. 0.048 in is a conservative first-order estimate. Mark TBD until physical measurement. |

---

## Quality Gates

| Gate | Status | Notes |
|---|---|---|
| Physics model matches instrument BC/excitation | ✅ Pass | Mersenne–Taylor for plain nylon strings |
| A4 = 440 Hz sanity check | ✅ Pass | Confirmed numerically |
| Units consistent throughout packet | ✅ Pass | Inches primary; mm in parentheses |
| Critical dims in drawings + formulas | ✅ Pass | Bowl OD, neck length, string lengths, bridge spec |
| CNC ops fit available tooling | ✅ Pass | 1/8 in + 1/4 in ball-end; standard router |
| BOM, drawing, design IDs consistent | ✅ Pass | NGO-Bxx / NGO-Nxx / NGO-BRxx / DWG-NGO-xxx |
| Design notes identify assumptions | ✅ Pass | 8 open TBD items in design.md §8 |
| risks.md exists with ≥1 risk per category | ✅ Pass | 5 categories, 16 risks |
| site/index.html renders cleanly | ✅ Pass | No dependencies; self-contained HTML |
| Capstone deck (pptx) | ⚠ Pending | Script written; shell recovery needed |
| Validation.csv has 20 checks | ✅ Pass | V-01 through V-20 |

---

## Findings Requiring Human Action

| # | Severity | Finding | Action |
|---|---|---|---|
| 1 | Medium | Capstone deck (.pptx) not yet generated — bash shell unavailable | Run `cd outputs && npm install pptxgenjs && node gen_ngoni_deck.js` when shell recovers; output goes to `ngoni/Ngoni-Capstone.pptx` |
| 2 | Low | DWG-NGO-002 through 006 not yet drafted (bowl plan, segment detail, neck detail, string layout) | Draft per drawing-brief.md spec when CAD is initiated |
| 3 | Low | SolidWorks CAD model not built | Create per cad/cad-notes.md when CAD work begins |
| 4 | Low | images/ and data/ folders empty | Populate during prototype build per photo-shotlist.md |
| 5 | Info | Kamele 14 string %breaking 47–54% on strings 1–7 | Acceptable for treble nylon; flagged as risk A-02; test on prototype |

---

## Public/Private Release Assessment

See `public-release-triage.md` for full analysis.

**Summary:** This packet is safe to publish publicly with two minor adjustments:
1. Cultural note in README (✅ already present)
2. No photos yet — no privacy concerns from images

**Close-ready verdict:** Needs polish before public release (CAD TBD, no prototype photos, pptx pending), but all documentation is public-safe. Rate: **B — needs polish, not blocked.**
