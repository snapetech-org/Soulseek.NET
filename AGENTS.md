## Runner and delivery policy — current owner directive

Use compatible GitHub-hosted runners by default for build, test, scan,
packaging and release jobs (owner directive, 2026-11-13). Preserve native OS and
architecture. Use private ephemeral JIT only when a job needs private network,
storage, hardware or tooling that hosted runners lack; missing private capacity
is not a blocker when a compatible hosted runner exists. Keep public
pull-request code secret-free with minimal permissions on disposable hosted
runners.
Do not widen trusted runner access. Preserve active builds and other agents'
work; never restart a broker owning guests. For a job that genuinely needs
private JIT, the shared pool inventory in the organization's packer repository
is authoritative.

Exception (owner directive, 2026-11-21): the Semgrep and Trivy scan workflows
run only on private ephemeral JIT runners, never on hosted runners. All other
build, test, packaging and release jobs use compatible hosted runners.

CodeQL is allowed (owner directive, 2026-11-21); the 2026-10-30 disable is
withdrawn.

Standing authorization applies to focused task commits and prompt pushes to the
remote default main/master branch. Stage only task changes, preserve unrelated
work, omit secrets, and never force-push or rewrite published history.

