# test.do
# Run the project's test suite (safe/forgiving dev-deps install)

say "== DoScript: Running tests =="

say "Installing dev dependencies (if requirements-dev.txt exists)..."
run "python -m pip install -r requirements-dev.txt"
if last_exit_code != 0
    say "→ requirements-dev.txt not found or install failed; continuing without installing dev deps."
end

say "Running pytest (quiet)..."
run "python -m pytest -q"
if last_exit_code != 0
    say "❌ Tests failed"
    stop
end

say "✅ Tests passed"
