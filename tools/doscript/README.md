# DoScript Contributor Toolkit for Blinker

A small, **optional** collection of contributor helper scripts written in DoScript.
Purpose: make common developer tasks (lint, tests, cleanup, build, release archive) easy for contributors **without touching library source or build configuration**.

---

## Important philosophy

This folder is intentionally designed to be:

* **Optional** – the project works perfectly without it
* **Isolated** – lives only inside `tools/doscript/`
* **Non‑invasive** – never edits library source code
* **Easy to remove** – maintainers can delete the folder with zero impact

These principles are critical for maintainer acceptance in conservative open‑source projects.

---

## Folder structure

```
tools/doscript/
  README.md
  cleanup.do
  dev-check.do
  make-release-zip.do
  all.do
  requirements-dev.txt   (optional)
```

---

## What these scripts do

### cleanup.do

Safely removes common development artifacts:

* `__pycache__`
* `.pyc` files
* `.pytest_cache`
* `build/`, `dist/`
* temporary logs

Never touches real source files.

---

### dev-check.do

Performs quick sanity checks for contributors:

* verifies expected repo structure
* warns about missing tests or tools
* exits early on serious problems

Useful before opening a pull request.

---

### make-release-zip.do

Creates a simple archive of the `src/` directory for:

* quick sharing
* manual testing
* lightweight release previews

Does **not** replace official packaging or CI.

---

### all.do

Runs a full contributor workflow:

1. installs optional dev dependencies (if present)
2. runs lint + formatting checks
3. runs tests
4. builds the package
5. creates a quick release archive

Designed as a **one‑command contributor experience**.

---

## Usage examples

Run a single script from repository root:

```bash
python doscript.py tools/doscript/cleanup.do
```

Preview actions safely (dry‑run):

```bash
python doscript.py tools/doscript/cleanup.do --dry-run
```

Run the full contributor workflow:

```bash
python doscript.py tools/doscript/all.do
```

---

## Safety guarantees

This toolkit follows strict safety rules:

* **No source modification** – only reads, validates, cleans generated files, or archives
* **Graceful failure** – missing tools produce warnings, not crashes
* **Minimal dependencies** – only common Python dev tools
* **Clear documentation** – behavior is obvious without executing scripts

---

## How to propose this upstream

When opening a discussion or pull request, keep the message short and respectful:

> I created a small optional DoScript toolkit (`tools/doscript/`) that helps contributors run cleanup, lint, tests, and build with one command.
> It is fully optional, documented, and does not modify Blinker source.
> Happy to adjust placement or remove anything if not useful. Thanks!

Suggested branch name:

```
tools/doscript-add
```

Suggested commit message:

```
Add optional DoScript contributor toolkit under tools/doscript/
```

---

## Acceptance checklist

Before proposing upstream, ensure:

* Scripts live only inside `tools/doscript/`
* README clearly states the toolkit is optional
* No unrelated code changes in the same commit
* CI configuration is untouched
* Dev dependencies are optional
* Pull request description is concise and respectful

---

## Maintenance policy

To keep maintainer trust:

* keep scripts **small and simple**
* avoid duplicating CI functionality
* prefer readability over clever automation
* accept that maintainers may decline or remove the folder

This mindset is essential for long‑term open‑source collaboration.

---

## License

Follows the repository’s existing license.

If separated into its own project later, **MIT** is recommended for zero friction reuse.

---

## Final note

This toolkit is intentionally **helpful, harmless, and removable**.

That design — not the scripts themselves — is what gives it the best chance of being accepted in a real production open‑source repository.
