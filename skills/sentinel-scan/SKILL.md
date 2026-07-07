---
name: sentinel-scan
description: Scans the repository for all markdown and text documentation, outputting a categorized inventory.
triggers:
  - /sentinel-scan
---

# `sentinel-scan` Skill

## Overview
This skill acts as a reconnaissance tool to find scattered documentation, ad-hoc notes, and official specs. It helps maintain the `migration-map.md` by identifying undocumented files.

## Execution Steps

1. **Scan Repository**
   - Recursively search the workspace for `*.md` and `*.txt` files.
   - Ignore `node_modules/`, `venv/`, `.git/`, and other standard ignored directories.

2. **Categorize Files**
   - Group findings into categories:
     - **Core Framework:** Files in `.agents/` and `.memory-bank/`.
     - **Project Specs:** Files in `.specs/` or `.tasks/`.
     - **Ad-hoc Documentation:** Miscellaneous `*.md` or `*.txt` found in source directories or root (e.g., `test.md`, `notes.txt`).

3. **Cross-reference `migration-map.md`**
   - If `.memory-bank/migration-map.md` exists, read it.
   - Flag any newly discovered ad-hoc files that are NOT listed in the migration map.

4. **Output Report**
   - Present a clear, formatted markdown table showing the categorized inventory.
   - Highlight unindexed files and recommend the user review them for migration to `.specs/`.
