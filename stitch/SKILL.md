---
name: stitch-mcp
description: Guides and utilities for effectively using the Stitch MCP (Multi-Component Processor) within Antigravity workflows.
---

# Stitch MCP Skill

This skill provides documentation, example snippets, and helper commands for working with **Stitch MCP** – the modular, composable pipeline system used in Antigravity projects.

## Overview
- **What is Stitch MCP?**
  - A lightweight framework for defining data‑processing pipelines ("stitches") that can be assembled at runtime.
  - Supports plug‑in components, parallel execution, and automatic error handling.
- **When to use it**
  - When you need to stitch together multiple processing stages (e.g., data ingestion → transformation → export) without writing boilerplate glue code.

## Key Concepts
1. **Stitch Definition** – a YAML/JSON file describing the pipeline steps and their connections.
2. **Components** – reusable processing units that expose a standard `run(input)` interface.
3. **MCP Runtime** – the command‑line tool `stitch-mcp run <stitch-file>` that orchestrates execution.

## Quick Start
```bash
# Install the Stitch MCP package (if not already installed)
pnpm add -g stitch-mcp

# Create a new stitch definition
stitch-mcp init my-data-pipeline

# Edit `my-data-pipeline/stitch.yaml` to add components
# Example component reference:
# - name: fetch-data
#   type: npm:my-fetch-component
# - name: transform
#   type: npm:my-transform-component
#   dependsOn: [fetch-data]

# Run the pipeline
stitch-mcp run my-data-pipeline/stitch.yaml
```

## Advanced Usage
- **Parallel Stages** – declare multiple components in the same `dependsOn` array.
- **Error Policies** – set `onError: continue|fail|retry` per component.
- **Environment Injection** – use the `env:` block to pass secrets without committing them to the stitch file.

## Helper Scripts (provided by this skill)
- `scripts/generate-stitch.ps1` – scaffolds a new stitch YAML with common boilerplate.
- `scripts/validate-stitch.ps1` – validates a stitch file against the schema.

## Contributing
If you add new components or improve the runtime, update the `README.md` in this skill and bump the version in `package.json`.

---

For more detailed API docs, see the official [Stitch MCP documentation](https://github.com/google/stitch-mcp).