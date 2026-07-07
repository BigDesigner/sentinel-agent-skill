---
name: sentinel-audit
description: Scans source files for security violations against the project's security standards. Report-only.
triggers:
  - /sentinel-audit
---

# `sentinel-audit` Skill

## Overview
This skill performs a lightweight security audit based on the rules defined in `.specs/security-standards.md`. It is strictly a reporting tool and will **never** modify, delete, or rewrite any source files.

## Execution Steps

1. **Load Security Standards**
   - Read `.specs/security-standards.md` to understand the project's specific security contract (e.g., escaping rules, banned functions, required sanitization).

2. **Scan Source Code**
   - Scan relevant source files (PHP, JS, Python, etc., depending on the stack) for potential violations.
   - Look for common issues like unescaped output, hardcoded secrets, missing sanitization, and outdated packages.

3. **Generate Audit Report**
   - Categorize findings by severity: Critical, High, Medium, Low.
   - For each finding, list the file path, line number, and a brief description of the violation.

4. **Output Report**
   - Present the prioritized audit report to the user.
   - **Important:** Explicitly state that this is a report-only operation and no code has been changed.
