# Contributing to Runcycles

## Where Changes Belong

**cycles-protocol** — Spec changes go here first. The protocol definition (`cycles-protocol-v0.yaml`) is the authority for all client and server behavior. If you're proposing new semantics, a new lifecycle phase, or changes to how cycles are reserved or committed, start with a spec PR in this repo.

**cycles-server** — Reference enforcement server for reservations, commits, releases, and balances. If the Redis-backed server isn't enforcing the protocol correctly, or a Lua script has a race condition or logic error, file issues and PRs here.

**cycles-server-admin** — Tenant, budget, API key, funding, and audit management. Changes to budget CRUD operations, tenant/workspace/app hierarchy, Redis key structure, or the admin OpenAPI spec belong here.

**cycles-spring-boot-starter** — Integrate Cycles into Spring AI / Java apps. The `@Cycles` annotation, lifecycle management, and Spring Boot auto-configuration. Changes to how the starter intercepts methods via AOP, evaluates SpEL expressions, or manages reservation context belong here.

**cycles-client-python** — Budget and risk control for Python apps. The `@cycles` decorator, async client, and lifecycle management. Changes to how the Python SDK decorates functions, manages async reservation flows, or handles cycle commit/release belong here.

**cycles-client-typescript** — Budget and risk control for Node.js / Vercel AI / LangChain / OpenAI. The `withCycles()` wrapper and streaming adapter. Changes to how the TypeScript SDK wraps tool calls, adapts streaming responses, or manages the cycle lifecycle belong here.

**cycles-mcp-server** — MCP server giving AI agents runtime budget control (reserve, commit, release) via Claude Desktop, Claude Code, and Cursor. Changes to MCP tool definitions, transport handling, or Cycles client integration belong here.

**cycles-openclaw-budget-guard** — OpenClaw plugin for budget-aware model and tool execution using Cycles. Changes to hook registration, budget reservation around model/tool calls, or the OpenClaw plugin API belong here.

**cycles-runaway-demo** — Self-contained demo showing a runaway agent failure mode and Runcycles stopping it. If the demo needs updated scenarios, better output formatting, or refreshed terminal recordings, this is the repo.

**cycles-agent-action-authority-demo** — Demo showing Cycles blocking unauthorized agent actions (email, CRM). Updated scenarios, new action types, or refreshed recordings go here.

**docs** — Guides, quickstarts, and how-to pages. If you're improving explanations, adding tutorials, or fixing broken links in the documentation site, contribute here.

**.github** — Organization profile, manifesto, and this contributing guide. Changes to org-level documentation or the public profile belong here.

## Running Tests

**Protocol spec (cycles-protocol):**
```
npm ci && make validate
```
Runs Spectral linting against `cycles-protocol-v0.yaml` and fails on errors.

**Python (cycles-client-python):**
```
pip install -e ".[dev]"
ruff check .
mypy runcycles
pytest --cov runcycles --cov-fail-under=85
```
CI runs all three checks (ruff, mypy, pytest) on Python 3.10 and 3.12.

**TypeScript (cycles-client-typescript):**
```
npm ci
npm run typecheck
npm run lint
npm run test:coverage
```
CI runs typecheck, eslint, build, and vitest on Node 20 and 22. Coverage thresholds: 95% lines, 85% branches.

**Java server (cycles-server):**
```
cd cycles-protocol-service && mvn test
```
Tests require Docker — TestContainers starts Redis automatically. For the full integration suite: `mvn verify -P integration-tests`.

**Admin server (cycles-server-admin):**
```
cd cycles-admin-service && mvn test
```
Unit tests run without Docker. For integration tests (requires Docker/TestContainers for Redis): `mvn verify -P integration-tests`.

**Spring starter (cycles-spring-boot-starter):**
```
cd cycles-client-java-spring && mvn verify
```
All tests are mock-based — no Docker required. JaCoCo enforces 85% instruction coverage.

**MCP server (cycles-mcp-server):**
```
npm ci
npm run typecheck
npm run lint
npm run test:coverage
```
CI runs typecheck, eslint, build, and vitest on Node 20 and 22.

**OpenClaw plugin (cycles-openclaw-budget-guard):**
```
npm ci
npm run typecheck
npm run test:coverage
```
CI runs typecheck, vitest, and build on Node 20 and 22.

**Docs (docs):**
```
npm ci && npm run build
```
Converts the OpenAPI spec to markdown and builds the VitePress site. Use `npm run dev` for local preview.

**Runaway demo (cycles-runaway-demo):**
```
pip install -r agent/requirements.txt && ./demo.sh guarded
```

**Action authority demo (cycles-agent-action-authority-demo):**
```
python3 -m py_compile agent/*.py
bash -n demo.sh record.sh teardown.sh scripts/*.sh
pip install -r agent/requirements.txt && ./demo.sh guarded
```
CI checks Python syntax and shell script syntax. Running the full demo locally requires Docker for the Cycles stack.

## Protocol Authority

`cycles-protocol-v0.yaml` is the source of truth. Client behavior follows the spec, not the other way around. Any change to protocol semantics requires a spec change first — implementations then update to match. `AUDIT.md` files in each client repo document conformance against the spec and should be kept current as the protocol evolves.

## PR Expectations

- Include unit tests for any new behavior.
- Update `AUDIT.md` if the change touches protocol surface (new fields, changed lifecycle steps, altered semantics).
- Update `README.md` if the public API changed (new exports, renamed functions, changed signatures).
- Run the full lint and test suite for your repo before opening a PR — CI will gate on it.
