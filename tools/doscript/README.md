# DoScript Contributor Toolkit for Blinker

This directory contains **optional developer helper scripts** written for the DoScript automation environment.
They are intended to make common contributor tasks—such as running tests, linting code, cleaning build artifacts, and building distributions—faster and easier.

## Important Notes

* **This toolkit does not modify Blinker’s source code or behavior.**
* **It is completely optional** and not required for contributing.
* The scripts exist purely as **convenience tooling for contributors who choose to use DoScript**.
* If removed, **Blinker continues to function exactly the same**.

The goal is to provide a lightweight, beginner-friendly workflow without adding maintenance burden to the core project.

## Included Scripts

| Script     | Purpose                                                            |
| ---------- | ------------------------------------------------------------------ |
| `test.do`  | Runs the full test suite                                           |
| `lint.do`  | Checks formatting and linting                                      |
| `clean.do` | Removes caches and build artifacts                                 |
| `build.do` | Builds source and wheel distributions                              |
| `all.do`   | Runs the full contributor workflow (install → lint → test → build) |

Each script is intentionally **small, transparent, and easy to ignore**.

## Why This Exists

Some contributors prefer simple, single-command automation when working on Python projects.
DoScript provides a readable scripting style that can help:

* new contributors understand the development workflow
* reduce repetitive terminal commands
* keep contributor onboarding simple

This toolkit explores that idea **without impacting the core library**.

## Scope and Maintenance

* This folder is **not part of Blinker’s runtime or public API**.
* Changes here should remain **minimal, self-contained, and low-maintenance**.
* If the toolkit becomes unhelpful, it can be **safely removed with no side effects**.

## Contributing

Improvements are welcome if they:

* keep scripts **simple and optional**
* avoid introducing **new dependencies for Blinker itself**
* remain **clearly separated from core source code**

Please avoid expanding this toolkit beyond **basic contributor convenience**.

## License

Unless stated otherwise, the contents of this directory follow the same license as the surrounding repository.
