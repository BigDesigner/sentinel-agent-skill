---
name: sentinel-mb
description: Initializes or syncs the `.memory-bank/` directory structure and active session state.
triggers:
  - /sentinel-mb
---

# `sentinel-mb` Skill

## Overview
This skill focuses solely on creating or updating the memory bank structural elements. It ensures `.memory-bank/` is present and correctly scaffolded with minimal overhead. It does NOT touch application source code or broader specs.

## Execution Steps

1. **Check Memory Bank Existence**
   - Look for `.memory-bank/` in the project root. If it doesn't exist, create it.

2. **Scaffold Subdirectories**
   - Ensure the following directories exist within `.memory-bank/`:
     - `.memory-bank/changelog/`
     - `.memory-bank/adr/`
     - `.memory-bank/audits/`
     - `.memory-bank/bugs/`

3. **Initialize `active-session.json`**
   - If `.memory-bank/active-session.json` does not exist, create it with:
     ```json
     {
       "session_id": "<generate-uuid-v4>",
       "last_active": "<current-ISO-8601-timestamp>",
       "agent": "<your-agent-name>",
       "status": "active"
     }
     ```
   - If it does exist, update the `last_active` timestamp to the current time.

4. **Completion Report**
   - Confirm to the user that the memory bank is initialized and synced successfully.
