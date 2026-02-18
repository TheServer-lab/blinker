# test.do
# Run the project's test suite (installs dev deps only if the file exists locally)

log "== DoScript: Running tests =="

if exists("tools/doscript/requirements-dev.txt")
    log "Installing dev dependencies..."
    rc = run "python -m pip install -r tools/doscript/requirements-dev.txt"
    if rc != 0
        warn "→ Could not install dev dependencies (rc: {rc}) — continuing without them."
    end_if
end_if

rc = run "python -m pytest -q"
if rc != 0
    error "❌ Tests failed (exit {rc})"
    exit 1
end_if

log "✅ Tests passed"
