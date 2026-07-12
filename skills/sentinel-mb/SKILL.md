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

3. **Initialize `active-session.json` (Atomic Operation)**
   - **CRITICAL LOCK RULE:** Before proceeding, check for `.memory-bank/.session.lock`. If present, halt and wait. Create `.session.lock` before starting file operations.
   - If `.memory-bank/active-session.json` does not exist, create it via a temporary file `active-session.tmp.json` first, then rename it to overwrite:
      ```json
      {
        "schema_version": "1.1.0",
        "session_id": "<generate-uuid-v4>",
        "status": "INITIALIZATION",
        "mode": "Interactive",
        "preferred_language": "Unconfirmed",
        "timestamp": "<current-ISO-8601-timestamp>",
        "active_branch": null,
        "last_commit": null,
        "git_history_available": false,
        "worktree_status": "clean",
        "concurrency_lock": {
          "is_locked": false,
          "locked_by": null,
          "lock_acquired_at": null
        },
        "current_sprint": {
          "sprint_id": "v0.1.0-alpha",
          "active_tasks": []
        },
        "tracked_memory_areas": {
          "adr": ".memory-bank/adr/",
          "changelog": ".memory-bank/changelog/",
          "audits": ".memory-bank/audits/",
          "bugs": ".memory-bank/bugs/",
          "tasks": ".tasks/",
          "archive": ".archive/docs-migration/"
        }
      }
      ```
   - If it does exist, read it, update the `timestamp` to the current ISO-8601 time, write to `active-session.tmp.json`, and perform an atomic rename/move to `active-session.json`.
   - Delete `.memory-bank/.session.lock`.

4. **Completion Report**
   - Confirm to the user that the memory bank is initialized and synced successfully.
