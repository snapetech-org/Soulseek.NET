# Bug Council Severity And Confidence Schema

Every confirmed finding gets a **severity** and a **confidence**. Severity says how serious the impact is; confidence records how strong the evidence is.

## Severity

| Tier | Meaning |
| --- | --- |
| Critical | Remote unauthenticated attacker can cause RCE, auth bypass, or unbounded resource consumption that takes the process down. |
| High | Remote attacker can cause denial of service, integrity violation, info leak across trust boundaries, or persistent state corruption. Includes most untrusted-input → unbounded-allocation findings. |
| Medium | Local correctness bug with observable user-visible failure: hang, wrong result, dropped event. Not exploitable by remote without prior compromise. |
| Low | Defensive-depth gap: code path is currently unreachable from untrusted input, but the absence of the guard is itself a hazard if a refactor exposes it. |
| Cosmetic | Style, naming, dead code, doc drift. Recorded only when it would otherwise be re-flagged on every sweep. |

Pick the **worst plausible** severity given current code paths. If the same code is reachable from two boundaries with different severities, take the higher.

## Confidence

| Tier | Meaning |
| --- | --- |
| Proven | A failing test exists or could be written from the rationale alone. The bug is reproducible. |
| Likely | The reasoning is sound and the call graph is short, but no test reproduces it yet. |
| Unverified | A scanner or report raised the issue, but the behavior is not yet reproduced or confirmed. Keep it out of the confirmed-finding ledger until triaged. |

Unverified reports should be triaged against the source and scanner evidence before they are added to the confirmed-finding ledger.

## Use in confirmed-finding records

When recording a confirmed issue, include its source and the evidence used to set severity and confidence:

```
| Finding | Severity | Confidence | Status | Source / issue | Rationale |
| --- | --- | --- | --- | --- | --- |
| `src/Foo.cs:42` | High | Proven | Fixed | Semgrep finding / PR #101 | Inbound length read flowed into new byte[N] without ProtocolCountReader. |
```

Keep the classification in the remediation ledger and link the focused regression test or fix.

## Promotion rules

- A row's severity can be raised at any time; lowering severity requires a written justification in the rationale.
- A row's confidence can move both directions and should be updated as evidence accumulates.
- The highest-severity confirmed issue still in progress belongs in the status summary so the team can prioritize remediation.

## Why two axes instead of one

A single "priority" tier collapses two independent things: how bad the impact is, and how strong the evidence is. Keeping the axes separate helps triage Semgrep and Trivy reports without treating every scanner match as a confirmed bug.
