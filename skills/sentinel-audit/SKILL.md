---
name: sentinel-audit
description: Scans source files for security violations against the project's security standards. Report-only.
triggers:
  - /sentinel-audit
---

# `sentinel-audit` Skill

## Overview
This skill performs a lightweight security audit based on the rules defined in `.specs/boundary-conditions.md`. It evaluates the source code and produces an audit report. It will **never** modify, delete, or rewrite any source files.

## Execution Steps

### 1. Load Security Standards
- Read `.specs/boundary-conditions.md` to understand the project's specific security contract (e.g., escaping rules, banned functions, required sanitization, architecture constraints).

### 2. Scan Source Code
- Scan relevant source files (PHP, JS, Python, etc., depending on the stack) for potential violations against the loaded constraints.
- Look for common issues like unescaped output, hardcoded secrets, missing sanitization, and outdated packages.

### 3. Generate Audit Report
- Categorize findings by severity: Critical, High, Medium, Low.
- For each finding, list the file path, line number, and a brief description of the violation.

### 4. Save and Output Report
- Automatically create a timestamped markdown file inside the `.memory-bank/audits/` directory (e.g., `2026-07-08-audit.md`) and save the complete report there.
- Present the prioritized audit report to the user in the chat.
- **Important:** Explicitly state that this is a report-only operation, no source code has been changed, and the report has been saved to the memory bank.
