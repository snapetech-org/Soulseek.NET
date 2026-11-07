## Runner and delivery policy — current owner directive

All build, test, scan, packaging and release jobs use compatible private,
ephemeral JIT runners. Preserve native OS and architecture. Hosted runners and
fallbacks are prohibited; missing private capacity is a provisioning blocker.
Keep untrusted fork code in disposable VM-backed JIT guests with no secrets,
minimal read access and restricted egress. Do not widen trusted runner access.
Preserve active builds and other agents' work; never restart a broker owning
guests. Validate source routing, broker policy, runner-group access and live
capacity together. The shared pool inventory in the organization's packer
repository is authoritative.

CodeQL is disabled organization-wide. Do not restore or reroute it without a
new explicit owner instruction. Other jobs retain the private JIT requirement.

Standing authorization applies to focused task commits and prompt pushes to the
remote default main/master branch. Stage only task changes, preserve unrelated
work, omit secrets, and never force-push or rewrite published history.

