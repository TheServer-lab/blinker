# lint.do
# Run lint + format checks (ruff and black); fail if issues found

log "== DoScript: Lint & format checks =="

rc = run "ruff check src tests"
if rc != 0
    error "❌ ruff found issues (exit {rc}). Run: ruff format src tests or fix problems."
    exit 1
end_if

rc = run "black --check src tests"
if rc != 0
    error "❌ black would reformat files (exit {rc}). Run: black src tests to format."
    exit 1
end_if

log "✅ Lint and format checks passed"
