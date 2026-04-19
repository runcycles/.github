# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in any Runcycles repository, please report it responsibly.

**Do NOT open a public GitHub issue for security vulnerabilities.**

### How to report

Email **security@runcycles.io** with:

- Description of the vulnerability
- Steps to reproduce
- Affected repository and version
- Potential impact assessment

### What to expect

- **Acknowledgment** within 48 hours
- **Initial assessment** within 5 business days
- **Fix timeline** communicated within 10 business days
- **Credit** in the security advisory (unless you prefer anonymity)

### Supported versions

We provide security fixes for:

| Version | Supported |
|---------|-----------|
| Latest release | Yes |
| Previous minor release | Yes |
| Older versions | No |

### Scope

This policy covers all repositories in the [runcycles](https://github.com/runcycles) organization:

- `cycles-server` — enforcement server (Redis, Lua scripts, Spring Boot)
- `cycles-server-admin` — admin API (tenants, budgets, API keys)
- `cycles-server-events` — event ingestion + usage aggregation service
- `cycles-dashboard` — operator web UI (Vue 3 SPA served via nginx)
- `cycles-protocol` — protocol specification
- `cycles-client-python` — Python SDK
- `cycles-client-typescript` — TypeScript SDK
- `cycles-client-rust` — Rust SDK
- `cycles-spring-boot-starter` — Spring Boot starter
- `cycles-mcp-server` — MCP server
- `cycles-openai-agents` — OpenAI Agents SDK integration
- `cycles-openclaw-budget-guard` — OpenClaw plugin

### Out of scope

- Demo repositories (`cycles-runaway-demo`, `cycles-agent-action-authority-demo`)
- Documentation site (`docs`)
- Vulnerabilities in third-party dependencies (report to the upstream project, but let us know so we can update)

### Disclosure policy

We follow coordinated disclosure. Please allow us reasonable time to address the issue before any public disclosure. We aim to release fixes within 30 days of confirmed vulnerabilities.
