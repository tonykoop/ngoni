# Ngoni Issue #1 V5 Starter

## Known and inferred

Observed inputs:

- `ngoni-design-table.xlsx` provides historical and derived string geometry, but many values are candidate inputs for early planning.
- Existing root files (`validation.csv`, `design.md`, `cut-list.csv`, `assembly-manual.md`) document a prior repo stage and are retained as historical context.

Inferred/Starter scope:

- This starter does **not** assert final speaking length, stringing, bridge mass, or tuning prescriptions.
- The active scope is a **string-family boundary register + validation gate plan**.
- Authority is intentionally conservative: `not_authoritative_until_measured` is retained in all packet-authority rows.

## V5 authority rules for this lane

- `family-spec.csv` is the governing hypothesis register for string-family scope.
- `validation-loop.csv` drives the first capture order and must be updated before any branch promotion.
- `visual-output-register.csv` must retain non-build-ready status for design/table artifacts until measurements are attached.
- `validation.csv` remains blocked until speaking-length, boundary transfer, and source assumptions are captured.

## Gate order (starter)

1. Complete the `family-spec.csv` rows for the active string course families and boundary assumptions.
2. Capture a basic measurement plan for speaking length and bridge/body transfer behavior.
3. Add measurement evidence IDs and tool notes in `validation-loop.csv`.
4. Reclassify `validation.csv` gates only after evidence rows pass and are linked.
