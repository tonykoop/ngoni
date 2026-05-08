# Ngoni — Risk Register

**Instrument:** Ngoni (Kamele N'goni)  
**Author:** Red-team pass — Heifer Zephyr Instrument Works  
**Date:** 2026-05-08  
**Status:** Pre-prototype; all risks are predictive

---

## Risk Categories

### A. Acoustic Risks

| ID | Risk | Likelihood | Severity | Mitigation | Verification Test |
|---|---|---|---|---|---|
| A-01 | String intonation drifts > ±10 cents after initial 48-hour settle | High | Medium | Allow 48-hour minimum settle before final tuning; retune daily for 1 week | V-01 through V-10: re-measure at 48 h and 1 week |
| A-02 | Kamele 14 top strings (0.45–0.55 mm) break at playing tension | Medium | High | Run prototype with 7–8 lbf on strings 1–5 (adds gauge thickness); buy 2× string stock | Break test: bring strings 1–7 to 110% of playing tension before installing on instrument |
| A-03 | Skin damping reduces sustain below acceptable level | Medium | Medium | Higher skin pretension increases brightness; adjust tacking tension | Pluck test: time decay of D4 string from onset to -20 dB; compare with reference kora recording |
| A-04 | Helmholtz resonance of bowl couples to a string frequency causing wolf tone | Low | Medium | Bowl volume is large (~810 in³); coupling broadband — wolf tone unlikely | Pluck each string; listen for anomalous sustain or anomalous decay on any pitch; re-measure if found |
| A-05 | Pentatonic pattern does not repeat cleanly across octaves (octave string length halving not exact) | Low | Low | Vibrating length schedule is intentional, not halved — each string independently tuned | Tune each string to target ±5 cents; play octave pairs (D5–D4, C5–C4) and check beat frequency |

---

### B. Structural Risks

| ID | Risk | Likelihood | Severity | Mitigation | Verification Test |
|---|---|---|---|---|---|
| B-01 | Bowl ring joint fails under humidity cycle | Medium | High | Use Titebond III (waterproof); ensure < 8% MC in stock before glue-up; allow full cure | Soak assembled bowl in humid environment (bathroom) for 30 min; inspect joints under light |
| B-02 | Neck bows or warps under string load over time | Low | High | Hard Maple is stiff (E ≈ 1.83 Mpsi); 0.048 in predicted deflection is acceptable | Measure neck relief (gap at midpoint with capo at nut + finger at 22 in point) at 1 week and 1 month |
| B-03 | Neck-to-bowl glue joint fails under playing load | Medium | High | Protrude neck 1.5 in inside bowl; glue full length of entry; clamp 2 h | Stress test: apply 2× expected string load (lever-pull on neck at bridge position); check for movement |
| B-04 | Goatskin splits at tack holes under string load | Medium | Medium | Use 16 tacks minimum; space evenly (< 2.5 in between tacks); use large-head upholstery tacks | Inspect tack holes after stringing; add lacing cord reinforcement if tack holes elongate |
| B-05 | Bridge tips or slides under string tension (insufficient downbearing angle) | Medium | High | Ensure string break angle at bridge ≥ 10°; verify bridge footprint is wide enough (≥ 2 in) | Press-test bridge from above; check for rocking before stringing; measure string angle with protractor |
| B-06 | Segmented bowl wall too thin (< 5/16 in) after lathe turning | Medium | Medium | Start with 0.75 in wall (4/4 stock); turn conservatively to 3/8 in target | Caliper check at 4 equidistant points per ring zone after hollowing (V-12) |

---

### C. Ergonomic Risks

| ID | Risk | Likelihood | Severity | Mitigation | Verification Test |
|---|---|---|---|---|---|
| E-01 | Neck angle causes wrist strain in lap-playing position | Low | Medium | Traditional ngoni plays horizontally in lap; neck angle near 0° is standard | Test with intended player; measure wrist deviation with phone inclinometer |
| E-02 | Bowl edges too sharp for forearm rest | Low | Low | Sand bowl rim edge to > 3/32 in radius; test with forearm | Physical test: rest forearm on bowl rim for 5 min; note pressure points |
| E-03 | String spacing at bridge too narrow for index fingertip (< 6 mm) | Low | Medium | Current spec: 8 mm spacing = 80 mm total for 10 strings. Verify before carving bridge | Measure bridge notch spacing with calipers; test plucking middle strings individually |
| E-04 | Kamele 14 neck length (36 in) awkward for smaller players | Low | Low | This is a larger instrument; document the player ergonomic range | Test with 5th and 95th percentile arm-reach players if possible |

---

### D. Supply Risks

| ID | Risk | Likelihood | Severity | Mitigation | Verification Test |
|---|---|---|---|---|---|
| D-01 | Goatskin unavailable in required diameter locally | Medium | High | Order from Sioux Trading Post or Rocky Mountain Rawhide; 3-week lead time; order early | Check supplier site and confirm diameter before ordering; order 2 skins |
| D-02 | Nylon monofilament in 0.85–1.25 mm range unavailable as single spools | Low | Medium | Fishing line monofilament is the same polymer; buy bulk in appropriate lb test ratings | Verify breaking strength spec from supplier before ordering |
| D-03 | Hard Maple neck blank unavailable in straight grain | Low | Medium | Pre-order from Hearne Hardwoods; specify grain requirements explicitly | Inspect grain in person or request photo from supplier before shipping |

---

### E. Fit/Finish Risks

| ID | Risk | Likelihood | Severity | Mitigation | Verification Test |
|---|---|---|---|---|---|
| F-01 | Ring glue lines visible as dark gaps (cosmetically unacceptable) | Low | Low | Sand to 400 grit; fill hairline gaps with sanding dust + Titebond slurry before oil | Inspect under raking light before finish coat; open gaps require filler or re-turning |
| F-02 | Tung oil darkens goatskin accidentally (oil migration) | Medium | Medium | Mask skin before finishing; apply oil only to wood surfaces | Visual inspection; test oil on scrap skin before applying to instrument |
| F-03 | Lathe tool catch mars bowl exterior surface | Low | Low | Use sharp tools; approach with scraping cut at end | Inspect surface before sanding; deep tool marks may require additional thickness removal |

---

## Summary: Top 3 Risks to Address First

1. **B-05 Bridge stability** — most likely to cause playability failure; test with mockup before final skin
2. **A-02 Kamele 14 fine strings** — highest probability of breakage failure; validate on prototype before committing gauge
3. **B-01 Bowl ring joint under humidity** — highest severity structural risk; use waterproof glue and verify MC before glue-up
