#!/usr/bin/env bash
#
# Bug Council all-phases runner — TEMPLATE.
#
# This runner covers focused remediation and regression checks. Broad source,
# dependency, and configuration scans run through Semgrep and Trivy.

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

printf '\n==> Process and regression gates\n'
bash scripts/check-remediation-baseline.sh
bash scripts/check-council-negative-space.sh

printf '\n==> Adversarial regression corpus\n'
# Add repository-specific fuzz or hostile-input regression commands here.
# dotnet test tests/Project.Tests/Project.Tests.csproj --no-restore --filter Category=Fuzz
# cargo test adversarial_

printf '\n==> Pending remediation phases\n'
if rg -n '^\| [0-9]+ \| .* \| Pending \|' docs/dev/bug-council-phases.md; then
  printf '\nRemediation is not complete: pending phases remain. Pick the first pending row above.\n' >&2
  exit 2
fi

printf '\nAll registered regression phases passed.\n'
