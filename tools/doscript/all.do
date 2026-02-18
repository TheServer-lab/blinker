# all.do
# Full contributor workflow: optional dev deps -> lint -> tests -> build -> quick zip

log "== DoScript: Full contributor workflow (all) =="

# 0. Optionally install dev dependencies (if the file exists in tools/doscript/)
if exists("tools/doscript/requirements-dev.txt")
    log "Installing dev dependencies from tools/doscript/requirements-dev.txt..."
    rc = run "python -m pip install -r tools/doscript/requirements-dev.txt"
    if rc != 0
        warn "Dev dependencies installation failed (rc: {rc}) — continuing where possible."
    end_if
end_if

# 1. Lint & format checks (warn on issues; do not abort immediately)
log "Step 1/5 — Lint & format checks"

# ruff
rc = run "ruff check src tests || true"
if rc != 0
    warn "ruff detected issues (exit {rc}). Consider running 'ruff format src tests' to auto-fix."
end_if

# black
rc = run "black --check src tests || true"
if rc != 0
    warn "black would reformat files (exit {rc}). Run 'black src tests' to apply formatting."
end_if

log "→ Lint checks complete"

# 2. Tests
log "Step 2/5 — Tests"
rc = run "python -m pytest -q"
if rc != 0
    error "Tests failed (rc: {rc}). Aborting full workflow."
    exit 1
end_if
log "→ Tests passed"

# 3. Build (sdist + wheel)
log "Step 3/5 — Build"
rc = run "python -m pip install --upgrade build"
if rc != 0
    error "Could not ensure build tool is installed (rc: {rc}). Aborting."
    exit 1
end_if

rc = run "python -m build"
if rc != 0
    error "Build failed (rc: {rc}). Aborting."
    exit 1
end_if
log "→ Build complete — artifacts in dist/"

# 4. Quick release zip (pack src into timestamped zip)
log "Step 4/5 — Packaging quick release zip"
global_variable = archive_name
archive_name = 'blinker_release_{today}.zip'
if exists(archive_name)
    delete archive_name
end_if
zip "src" to archive_name
log "→ Quick release zip created: {archive_name}"

log "🎉 All steps finished successfully"
