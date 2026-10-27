# Focused Remediation Phase Tracker — TEMPLATE

Use this tracker for confirmed findings and their regression coverage. Broad source, dependency, and configuration scans belong to Semgrep and Trivy; this tracker does not maintain a candidate queue.

| # | Name | Status | Owner | Exit criteria |
| --- | --- | --- | --- | --- |
| 1 | Remediation process docs | _Pending / In progress / Done_ | _agent_ | Severity/confidence, sibling-search, negative-space, and behavior-pinning guidance reflects the repository. |
| 2 | Behavior-pinned regression tests | _Pending / In progress / Done_ | _agent_ | Each confirmed fix has a focused test that pins the expected runtime behavior. |
| 3 | Adversarial regression corpus | _Pending / In progress / Done_ | _agent_ | Known hostile inputs and deterministic regression cases are covered by the existing test suite. |
| 4 | All-regressions runner | _Pending / In progress / Done_ | _agent_ | `scripts/run-bug-council-all-phases.sh` runs the remediation baseline, focused regression checks, and pending-phase check in one command. |
| 5 | _project-specific regression phase_ | _Pending_ | _agent_ | _exit criteria_ |

## How to resume

1. Read recent product/fix commits and the ledger to see what landed.
2. Read this table and pick the first unfinished regression phase.
3. Run the focused regression command documented for the repository.
4. Update this tracker when a phase is completed.

If a phase has been partially completed by another agent, treat the on-disk artifacts as the source of truth and reconcile the tracker against them rather than re-doing work.
