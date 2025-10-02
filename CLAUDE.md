# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a GitHub Actions (GHA) playground repository used for testing and experimenting with GitHub Actions workflows. The repository contains no application code - only workflow definitions.

## Architecture

The repository consists entirely of GitHub Actions workflow files located in `.github/workflows/`. Each workflow demonstrates different GHA patterns:

- **delayed_result.yml**: Multi-job workflow demonstrating job dependencies and output passing between jobs. Jobs `result_1` and `result_2` run in parallel and pass outputs to an `evaluate` job that validates both succeeded.
- **dependency.yml**: Demonstrates `workflow_run` trigger pattern - runs automatically when "GitHub Actions Demo" workflow completes.
- **playground.yml**: Simple workflow for testing environment variable interpolation and basic workflow syntax.
- **variables.yml**: Demonstrates creating dynamic variables using `$GITHUB_ENV` and using them in artifact names.
- **new_env_dir.yml**: Shows job output passing and dynamic path construction using GitHub variables and context expressions.

## Common Commands

This repository has no build, test, or lint commands as it contains only workflow definitions.

### Testing Workflows

Workflows can be triggered via:
- Push to branches (where configured)
- Manual dispatch: Use GitHub UI Actions tab and click "Run workflow"
- GitHub CLI: `gh workflow run <workflow-name>`

### Viewing Workflow Results

- Check workflow status: `gh run list`
- View specific run: `gh run view <run-id>`
- Watch a running workflow: `gh run watch`

## Key Patterns

**Job Dependencies**: Use `needs: [job1, job2]` to control execution order and access outputs via `${{ needs.job1.outputs.key }}`.

**Dynamic Outputs**: Set job outputs using `echo "key=value" >> $GITHUB_OUTPUT` in a step with an `id`, then reference in job outputs.

**Environment Variables**: Set runtime env vars with `echo "VAR=value" >> $GITHUB_ENV` - available in subsequent steps.

**Artifact Naming**: Use context expressions like `${{ env.FETCH_TIME }}` in artifact names for unique identifiers.
