# Review Evidence

- Mode: instrument-maker v4.3 root-mode packet.
- Source reviewed: existing packet files plus `ngoni-design-table.xlsx`.
- Packet readiness: L2/L2+ documentation packet. CAD model, prototype photos, measured tuning data, and capstone deck remain pending; README and `validation-report.md` already state those limits.
- Local checks to run before PR: `git diff --check` and `python /home/tony/.codex/skills/instrument-maker-v4/scripts/validate_packet.py --mode root .`.
- Review focus: string schedule uses Mersenne-Taylor without unrelated NAF or beam corrections, cultural note is present, and prototype-dependent gates remain open.
