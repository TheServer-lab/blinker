# dev-check.do
# Quick repository sanity checks for contributors

log "== DoScript: Repo sanity checks =="

if exists("src") == false
    error "Missing 'src' folder. Expected repository layout: src/"
    exit 1
end_if

if exists("src/blinker") == false
    warn "Warning: 'src/blinker' not found — ensure you're running from repository root or layout differs."
end_if

if exists("tests") == false and exists("test") == false
    warn "No tests directory detected (tests/ or test/). Confirm whether tests exist."
end_if

# Check for common dev tools and warn if missing
rc = run "ruff --version"
if rc != 0
    warn "ruff not found on PATH — lint checks may fail. Consider installing dev tools or add requirements-dev.txt."
end_if

rc = run "black --version"
if rc != 0
    warn "black not found on PATH — formatting checks may fail."
end_if

rc = run "python -m pytest -q --version"
if rc != 0
    warn "pytest not found or not runnable via 'python -m pytest'."
end_if

log "Repo sanity checks complete"
