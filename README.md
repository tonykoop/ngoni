# Ngoni

Engineering documentation and parametric design packet for the ngoni — the West African traditional plucked-string lute, ancestor to the banjo.

Part of the [Heifer Zephyr Instrument Works](https://github.com/tonykoop/instrument-maker) instrument catalogue.

---

## What Is the Ngoni?

The ngoni is a bowl-lute of the **Mande peoples** of West Africa (Mali, Guinea, Senegal, Burkina Faso). Two principal forms exist:

- **Donso ngoni** — 6-string hunter's harp, ancient; tied to the donso brotherhoods
- **Kamele ngoni** — 10–12 string modern form; popularized 1950s–60s; today's performance instrument

The ngoni belongs to the same family as the kora (21-string harp-lute) and the akonting, and is considered a probable ancestor of the American banjo. See [resources.md](resources.md) for full cultural provenance and bibliography.

---

## This Repository

A complete v4.3 instrument-maker build packet for a shop-built ngoni — **segmented lathe-turned bowl** replacing the traditional calabash gourd, goatskin head, Hard Maple neck, and plain nylon strings.

**Three variants documented:** Donso 6-string · Kamele 10-string (primary) · Kamele 14-string

**Key engineering challenge:** string/resonator hybrid — Mersenne–Taylor strings over a skin-headed segmented bowl with first-order Helmholtz resonance.

---

## String Schedule Highlights (Kamele 10)

| String | Note | Freq (Hz) | Gauge (mm) | % Breaking |
|---|---|---|---|---|
| 1 | D5 | 587.3 | 0.887 | 14.1% ✓ |
| 5 | F4 | 349.2 | 0.933 | 16.9% ✓ |
| 10 | F3 | 174.6 | 1.246 | 14.2% ✓ |

All 10 strings: 14–17% breaking — well within safe range for plain nylon. Full schedule in [design.md](design.md).

---

## Packet Files

| File | Contents |
|---|---|
| [design.md](design.md) | Parametric design — string schedules, bowl ring cut list, neck deflection, bridge notes, resonator assumptions |
| [bom.csv](bom.csv) | Bill of materials (all 3 variants) |
| [sourcing.csv](sourcing.csv) | Suppliers, prices, lead times |
| [cut-list.csv](cut-list.csv) | Ring segment miter dimensions per ring |
| [validation.csv](validation.csv) | 20 tuning and structural validation checks |
| [assembly-manual.md](assembly-manual.md) | 19-step shop build guide with checkboxes |
| [supplier-rfq.md](supplier-rfq.md) | RFQ templates for 5 key materials |
| [risks.md](risks.md) | Red-team risk register (5 categories, 16 risks) |
| [resources.md](resources.md) | Cultural provenance and bibliography |
| [jig-decision.md](jig-decision.md) | Jig decisions for each build step |
| [drawing-brief.md](drawing-brief.md) | Drawing specifications (DWG-NGO-001 through 006) |
| [drawings/ngoni-assembly.svg](drawings/ngoni-assembly.svg) | Assembly side elevation drawing |
| [drawings/ngoni-bridge-detail.svg](drawings/ngoni-bridge-detail.svg) | Bridge detail drawing (2:1) |
| [cad/cad-notes.md](cad/cad-notes.md) | SolidWorks strategy + OpenSCAD starter |
| [cnc/setup-sheet.md](cnc/setup-sheet.md) | CNC operation plan (bridge notch + neck rough) |
| [wolfram/ngoni-model.wl](wolfram/ngoni-model.wl) | Wolfram package — string schedule, bowl resonance, Manipulate, audio |
| [site/index.html](site/index.html) | Build-log site |
| [photo-shotlist.md](photo-shotlist.md) | In-progress and finished-instrument shot list |
| [review-evidence.md](review-evidence.md) | PR review evidence, local checks, and readiness summary |
| [ngoni-design-table.xlsx](ngoni-design-table.xlsx) | Original parametric design table (Excel) |

---

## Build Overview

```
Phase 1 — Bowl:      Cut 121 segments at 18° miter → glue 11 rings → lathe-turn to 3/8" wall
Phase 2 — Neck:      Shape Hard Maple round or D-profile → fit into bowl entry hole
Phase 3 — Bridge:    Carve Hard Maple with 10 notches @ 8 mm spacing → test break angle ≥ 10°
Phase 4 — Head:      Soak goatskin → stretch → tack → dry 24-48 h
Phase 5 — Assembly:  String anchor rod → neck glue-up → string up → tune → settle 48 h
Phase 6 — Finish:    Sand to 400 grit → tung oil (avoid skin)
```

**Estimated material cost:** $91–$214 (acoustic only)  
**Estimated jig build time:** 35–40 min (V-block cradle + bridge template only)

---

## Physics Models

**Strings:** Mersenne–Taylor — `f = (1/2L) × √(T/μ)` with ρ = 0.04155 lb/in³ (nylon)  
**Bowl resonator:** Helmholtz first-order estimate — `f_H ≈ (c/2π) × √(A_port / (V_bowl × L_eff))`. Kamele 10 first-order: ~97 Hz. Skin compliance dominates; bowl acts as broadband radiator.  
**Neck deflection:** Euler beam, Hard Maple E = 1.83 Mpsi. At 120 lbf total string load: 0.048 in (✓ < 0.050 in limit).

---

## Top Risks

1. **Bridge stability (B-05)** — verify break angle ≥ 10° before mounting skin
2. **Kamele 14 fine strings (A-02)** — strings 1–7 at 48–54% breaking; verify on prototype
3. **Bowl joint humidity (B-01)** — use Titebond III; kiln-dry stock; full cure before stringing

Full risk register: [risks.md](risks.md)

---

## Design Stage

**Packet-ready · CAD pending · Prototype not yet built**

- [x] Parametric string schedule computed for all 3 variants
- [x] Segmented bowl ring cut list (Kamele 10)
- [x] Assembly manual with shop checkboxes
- [x] Manufacturing drawings (assembly + bridge)
- [x] CNC setup sheet (bridge notch + neck rough pass)
- [x] Wolfram model package
- [x] Risk register + validation checklist
- [ ] SolidWorks CAD model
- [ ] Physical prototype
- [ ] Measured validation data

---

## License

[CC BY 4.0](LICENSE) — Attribution required. See LICENSE for details.

---

## Cultural Note

The ngoni's origins and living tradition belong to Mande griot musicians and the donso hunting brotherhoods. This engineering documentation is offered with respect and does not claim cultural authority over the instrument's musical or ceremonial forms. For context on the tradition, see [resources.md](resources.md).

---

*Heifer Zephyr Instrument Works · Tony Koop · 2026-05-08*
