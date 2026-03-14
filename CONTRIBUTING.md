# Contributing to RunCycles

## Where Changes Belong

**cycles-protocol** — Spec changes go here first. The protocol definition (`cycles-protocol-v0.yaml`) is the authority for all client and server behavior. If you're proposing new semantics, a new lifecycle phase, or changes to how cycles are reserved or committed, start with a spec PR in this repo.

**cycles-server** — Reference implementation bugs and Lua script behavior. If the Redis-backed server isn't enforcing the protocol correctly, or a Lua script has a race condition or logic error, file issues and PRs here.

**cycles-server-admin** — Administrative API for budget governance. Changes to budget CRUD operations, tenant/workspace/app hierarchy management, Redis key structure, or the admin OpenAPI spec belong here.

**cycles-spring-boot-starter** — The `@Cycles` annotation, lifecycle management, and Spring Boot auto-configuration. Changes to how the starter intercepts methods via AOP, evaluates SpEL expressions, or manages reservation context belong here.

**cycles-client-python** — The `@cycles` decorator, async client, and lifecycle management. Changes to how the Python SDK decorates functions, manages async reservation flows, or handles cycle commit/release belong here.

**cycles-client-typescript** — The `withCycles()` wrapper and streaming adapter. Changes to how the TypeScript SDK wraps tool calls, adapts streaming responses, or manages the cycle lifecycle belong here.

**docs** — Guides, quickstarts, and how-to pages. If you're improving explanations, adding tutorials, or fixing broken links in the documentation site, contribute here.

**cycles-runaway-demo** — Demo improvements and GIF re-recording. If the runaway-agent demo needs updated scenarios, better output formatting, or refreshed terminal recordings, this is the repo.

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

**Docs (docs):**
```
npm ci && npm run build
```
Converts the OpenAPI spec to markdown and builds the VitePress site. Use `npm run dev` for local preview.

**Demo (cycles-runaway-demo):**
```
pip install -r agent/requirements.txt && ./demo.sh guarded
```

## Protocol Authority

`cycles-protocol-v0.yaml` is the source of truth. Client behavior follows the spec, not the other way around. Any change to protocol semantics requires a spec change first — implementations then update to match. `AUDIT.md` files in client repos (where present) document conformance against the spec and should be kept current as the protocol evolves.

## PR Expectations

- Include unit tests for any new behavior.
- Update `AUDIT.md` if the change touches protocol surface (new fields, changed lifecycle steps, altered semantics).
- Update `README.md` if the public API changed (new exports, renamed functions, changed signatures).
- Run the full lint and test suite for your repo before opening a PR — CI will gate on it.
