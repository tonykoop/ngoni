# Ngoni — Public Release Triage

**Date:** 2026-05-08  
**Tool:** instrument-maker-v4.3 close-ready triage  
**Verdict: B — Needs polish (not blocked, not close-ready)**

---

## Close-Ready Checklist

| Item | Status | Notes |
|---|---|---|
| README present and substantive | ✅ | Full packet overview, string schedule summary, build workflow |
| Cultural provenance / attribution | ✅ | resources.md + cultural note in README; appropriately respectful |
| No copyrighted content reproduced | ✅ | All computed values are original; references cited, not reproduced |
| Physics model documented and attributed | ✅ | Mersenne–Taylor formula cited; no uncredited corrections |
| No personally-identifying information | ✅ | Author name (Tony Koop) + email in RFQ — standard for open-source |
| No supplier pricing that constitutes a commercial claim | ⚠ | sourcing.csv and supplier-rfq.md include price ranges — these are estimates, not quotes. Clearly labeled as estimates. Acceptable. |
| No CAD/SolidWorks proprietary content | ✅ | cad-notes.md is strategy only; no SW model files present yet |
| Images free of third-party IP | ✅ | images/ folder empty (prototype not built); no risk |
| License file present | ✅ | CC BY 4.0 |
| Site renders self-contained | ✅ | site/index.html — no external dependencies |

---

## Public Safety Assessment

### What IS in this repo (public-safe)

- Original engineering calculations (Mersenne–Taylor string physics, Helmholtz estimate, neck deflection)
- Original build documentation derived from published reference dimensions with attribution
- Design philosophy and cultural context written with explicit attribution
- Shop instructions derived from established woodworking practice

### What is NOT in this repo (intentionally excluded)

- Traditional ngoni music notation or tablature (would require licensing)
- Copyrighted photographs of traditional instruments
- Recording or transcription of existing ngoni music
- Commercial pricing from specific supplier quotes (only public estimate ranges)

### Cultural Sensitivity Assessment

**Rating: Low risk, high care**

The repository:
- Names the Mande/Donso/Kamele distinction explicitly and correctly
- Attributes the Kamele ngoni modernization to Allata Brulaye Sidibé with dates
- Notes the Donso ngoni's ceremonial role without trivializing it
- Does NOT claim the design is "authentic" or "traditional" — it is explicitly a CNC/lathe adaptation
- Cites Charry (2000) and Coolen (1984) as authoritative references
- The README's cultural note is clear and not defensive

**Suggested addition before public release:** A brief statement in the README intro that the gourd replacement (segmented wood bowl) is a luthier adaptation, not a representation of the traditional form. This is already implicit in the copy but could be made more explicit.

---

## What Needs to Happen Before "Close-Ready"

### Blockers (none — this repo is not blocked)

The repo has no hard blockers. All documentation is public-safe and attribution is correct.

### Polish Items (needed before rating A)

| Priority | Item | Estimated Work |
|---|---|---|
| High | Generate Ngoni-Capstone.pptx | 5 min (run gen_ngoni_deck.js when shell available) |
| High | Prototype photos (images/) | After build |
| Medium | SolidWorks / OpenSCAD model | After CAD session |
| Medium | DWG-NGO-002 through 006 | After CAD |
| Low | Measured validation data in validation.csv | After build |
| Low | Wolfram notebook recording/video | After Wolfram session |

### Current Rating Breakdown

| Dimension | Rating | Notes |
|---|---|---|
| Documentation completeness | B+ | 21/22 required files; pptx pending |
| Physics accuracy | A | All models correct; guard rules respected |
| Cultural attribution | A | Explicit, appropriate, well-sourced |
| Build readiness | B | Pre-prototype; all docs present; CAD TBD |
| Public IP safety | A | No third-party IP reproduced |
| Site quality | B+ | Complete; no photos yet |

**Overall: B — Needs polish (CAD, prototype, pptx). Not blocked from publishing.**

---

## Recommended Next Commit Message

```
Add v4.3 root-mode packet: design, BOM, sourcing, cut-list, validation, assembly
manual, RFQs, risks, resources, jig decisions, 2 SVG drawings, CAD notes,
CNC setup, Wolfram model, build-log site, print packet HTML, validation report

Physics: Mersenne-Taylor string schedule (3 variants), Helmholtz bowl estimate,
neck deflection. String schedule: 14-17% breaking (Kamele 10), safe.
Bridge: stability flagged as top risk (B-05). Cultural: respectful Mande/
donso/kamele attribution, Charry + Coolen cited. CAD + prototype pending.
```
