# MCP / External-Tool Session Log

V5 provenance record for artifacts generated or modified by external tools.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
|---|---|---|---|---|---|---|---|
| cindy-r1-2026-05-29 | claude-code | ngoni-design-table.xlsx | cad/ngoni-placeholder.scad | cad_authoring | pending_measurement | self_checked | Bowl and neck scaffold from design-table baseline. Not reviewed against measured template. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | ngoni-design-table.xlsx, cad/cad-notes.md | cad/ngoni.scad | cad_authoring | pending_measurement | self_checked | Parametric variant-aware master (Donso 6 / Kamele 10 / Kamele 14): segmented bowl (11 rings, 10 seg/ring, 18 deg miter for Kamele10), neck with single bowl-entry hole, notched bridge (notch count = string_count), string band from xlsx shortest/longest envelope. OpenSCAD render check: pass (openscad -o STL, exit 0). Retires cad/ngoni-placeholder.scad. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | ngoni-design-table.xlsx | bom.csv, sourcing.csv, cut-list.csv, validation.csv | packet_refresh | fabrication | self_checked | V5 refresh pass: tabular packet data reviewed against ngoni-design-table.xlsx; no dimension changes made. Provenance rows added to satisfy V5 fabrication-artifact logging. |
