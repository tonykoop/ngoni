# Ngoni — Claims and Boundaries

**Purpose:** single, deep-linkable summary of what this packet does and does
not claim. Sibling repos, the instrument-maker skill, and external readers
should link here when they need to know the authority boundary of the ngoni
packet without reading every supporting document.

**Date:** 2026-05-19
**Packet stage:** L2 / L2+ — packet-ready, pre-prototype.

---

## Cultural provenance boundary

The ngoni is a plucked-string lute of the **Mande peoples** of West Africa
(Mali, Guinea, Senegal, Burkina Faso, The Gambia). This repo documents two
variants — Donso (6-string hunter's ngoni) and Kamele (10–14-string modern
form, popularized in the 1950s–60s, credited to Allata Brulaye Sidibé). Full
attribution and bibliography live in [`resources.md`](resources.md).

What this repo claims:

- Engineering documentation derived from the published builder-reference
  and ethnomusicology sources named in `resources.md`.
- Original physics work (Mersenne–Taylor string schedule, first-order
  Helmholtz bowl estimate, Euler-beam neck deflection) by the repo author.
- Cultural context named explicitly with attribution.

What this repo does **not** claim:

- Authority over the ngoni's musical tradition, repertoire, or ceremonial
  context. The Donso ngoni in particular sits inside a living social
  institution; builders from outside that tradition should approach its
  ceremonial forms with appropriate awareness.
- That any specific instrument built from this packet is "authentic",
  "traditional", or sanctioned by any cultural authority.
- Permission to reproduce traditional repertoire, tablature, or
  transcriptions. None are included in this repo.

## Luthier-adaptation boundary

The bowl in this packet is a **segmented lathe-turned hardwood bowl**. This
is a luthier adaptation; it is not the traditional calabash gourd form.

What changes when you swap gourd for wood:

- Wall thickness and material damping differ; bowl acts as a broadband
  radiator rather than a sharply tuned cavity. See [`design.md`](design.md)
  §7 and [`validation-report.md`](validation-report.md) §Bowl Resonator.
- Bowl mass and stiffness are higher than a gourd of similar volume.
  Acoustic equivalence to a traditional ngoni is not claimed and has not
  been measured.
- Bowl-ring construction, ring count, miter angle, and lathe-turning steps
  are all repo-original engineering work; they are not borrowed from a
  traditional construction recipe.

If you want a gourd-bodied build, this packet is not the right starting
point — the bowl portion of the design will not apply.

## Measured-authority boundary

Every authority-bearing claim in this packet sits in one of three states:

| Authority claim | State | Canonical detail |
|---|---|---|
| String schedule (Mersenne–Taylor) for Donso 6, Kamele 10, Kamele 14 | **Predicted only** — no measured tuning data yet | [`design.md`](design.md) §1.1, [`validation-report.md`](validation-report.md) §String Model |
| Bowl Helmholtz first-order resonance (~97 Hz, Kamele 10) | **Predicted only** — skin compliance dominates; not corrected into the string schedule | [`design.md`](design.md) §7, [`validation-report.md`](validation-report.md) §Bowl Resonator |
| Neck deflection ≤ 0.050 in at 120 lbf total string load | **Predicted only** — Euler-beam first-order; classical-guitar reference load case differs | [`design.md`](design.md) §1.3, [`validation-report.md`](validation-report.md) §Neck Deflection |
| Ring cut list (11 rings, 18° miter, Kamele 10) | **Predicted geometry** — not built or measured | [`cut-list.csv`](cut-list.csv) |
| BOM costs and supplier prices | **Public-range estimates** — not commercial quotes | [`bom.csv`](bom.csv), [`sourcing.csv`](sourcing.csv), [`supplier-rfq.md`](supplier-rfq.md) |
| SolidWorks CAD model | **Not built** | [`cad/cad-notes.md`](cad/cad-notes.md) — strategy only |
| Physical prototype + measured tuning + measured deflection | **Not built** | `images/` and `data/` — empty placeholders to be populated when the prototype is built |
| Wolfram Manipulate model | **Predicted exploration tool** — driven by the same Mersenne–Taylor formulas | [`wolfram/ngoni-model.wl`](wolfram/ngoni-model.wl), [`ngoni-starter.wl`](ngoni-starter.wl) |

For the full risk register (16 risks across 5 categories, each paired with a
specific test) see [`risks.md`](risks.md). For the formal predictive-vs-
measured walk-through see [`validation-report.md`](validation-report.md). For
the public-release / cultural-sensitivity rating ("B — needs polish, not
blocked") see [`public-release-triage.md`](public-release-triage.md).

## Animal-material posture (goatskin head)

The Kamele variant uses a goatskin head soaked, stretched, tacked, and dried
over the bowl rim.

What this repo claims:

- The geometry of the head opening, the wetting/stretching/drying sequence,
  and the tack/lacing strategy as a shop procedure
  ([`assembly-manual.md`](assembly-manual.md) Phase 4).

What this repo does **not** claim:

- Authority on goatskin sourcing, animal-welfare provenance, tanning, or
  rawhide vs salt-cured trade-offs. Builders source goatskin from
  established suppliers and follow the supplier's handling, hygiene, and
  storage instructions.
- Synthetic-head substitution guidance. A synthetic head will change the
  resonator behavior; that variant is not yet documented.

## What this repo intentionally does not include

- Traditional ngoni repertoire, tablature, transcriptions, or recordings.
- Copyrighted photographs of traditional ngonis.
- Donso ceremonial-context guidance or hunter-society practice.
- Commercial supplier quotes (only public price-range estimates appear in
  `sourcing.csv` and `supplier-rfq.md`).
- CNC G-code that has been verified on a specific machine. The
  [`cnc/setup-sheet.md`](cnc/setup-sheet.md) describes operations; toolpaths
  have not been cut.
- Skin-handling or animal-welfare instructions beyond pointing at the
  supplier.

## Residual gates (issue #1 stays open until these close)

- SolidWorks CAD model per [`cad/cad-notes.md`](cad/cad-notes.md).
- Drawings DWG-NGO-002 through 006 per [`drawing-brief.md`](drawing-brief.md)
  (DWG-NGO-001 assembly + bridge detail already present in
  [`drawings/`](drawings/)).
- Physical prototype build per [`assembly-manual.md`](assembly-manual.md).
- Measured tuning, deflection, and bowl-response data in the future `data/`
  directory, plus prototype photos per
  [`photo-shotlist.md`](photo-shotlist.md) in the future `images/` directory.

This document does not certify any of those gates; it names them so a reader
can see what authority the packet currently lacks and what would have to
land before closing them.
