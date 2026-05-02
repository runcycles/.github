# Runcycles — Full Architecture

This is the deep-dive companion to the minimal diagram on the [org profile README](./profile/README.md). It shows the full picture: enforcement path, state store, governance plane, and event bus.

For deployment topology, configuration, and component-level docs (ports, modules, Lua scripts, key provisioning), see the [Architecture Overview](https://runcycles.io/quickstart/architecture-overview-how-cycles-fits-together) on runcycles.io.

## Full system diagram

```mermaid
flowchart LR
  %% =========================
  %% Agent side
  %% =========================
  subgraph APP["Agent application / workflow runtime"]
    AGENT["AI agent"]
    SDK["Cycles SDK / middleware<br/>Python · TypeScript · Java · Rust · MCP"]
    AGENT -->|"intent: subject + action + estimate"| SDK
  end

  %% =========================
  %% Enforcement path
  %% =========================
  SDK -->|"1. reserve before execution<br/>POST /v1/reservations"| RUNTIME["Cycles Runtime Server<br/>pre-execution authority"]
  RUNTIME -->|"ALLOW + reservation_id<br/>or DENY + reason"| SDK
  SDK -.->|"on DENY: skip + surface reason"| AGENT

  SDK -->|"2. execute"| ACTIONS["Downstream actions<br/>LLMs · tools · APIs · email · DB writes · jobs"]
  ACTIONS -->|"actual usage / outcome"| SDK

  SDK -->|"3a. commit actual usage"| RUNTIME
  SDK -->|"3b. release on cancel / failure"| RUNTIME

  %% =========================
  %% State and governance
  %% =========================
  RUNTIME -->|"atomic reserve / commit / release"| STORE["State store<br/>budgets · reservations · balances · quota counters"]

  ADMIN["Cycles Admin Server<br/>tenants · budgets · policies · API keys"] --> STORE
  DASH["Cycles Dashboard<br/>operators / SaaS admins"] --> ADMIN

  RUNTIME -->|"events"| EVENTS["Events / webhooks<br/>denials · overages · thresholds · audit trail"]
  ADMIN -->|"governance events"| EVENTS

  %% =========================
  %% Styles
  %% =========================
  classDef primary fill:#eef6ff,stroke:#2563eb,stroke-width:1px,color:#111827;
  classDef runtime fill:#ecfdf5,stroke:#059669,stroke-width:1px,color:#111827;
  classDef state fill:#fff7ed,stroke:#ea580c,stroke-width:1px,color:#111827;
  classDef external fill:#f8fafc,stroke:#64748b,stroke-width:1px,color:#111827;

  class AGENT,SDK primary;
  class RUNTIME,ADMIN,DASH runtime;
  class STORE state;
  class ACTIONS,EVENTS external;
```

> Works with LangGraph, CrewAI, OpenAI Agents SDK, MCP clients (Claude Desktop, Cursor, Windsurf), and custom runtimes via the SDKs.

## The key idea

Cycles is not a proxy and not a workflow engine. It does not execute tools or inspect payloads. It provides a synchronous authority check around actions that create cost, risk, or side effects.

1. **Reserve** estimated exposure before the action runs.
2. **Execute** the LLM/tool/API call only if Cycles allows it.
3. **Commit** actual usage, or **release** the reservation if the action failed or was canceled.
4. **Enforce** budgets, action policies, tenant boundaries, retries, and concurrency from one runtime control point.

## Components shown above

| Component | Role | Repo |
|---|---|---|
| **AI agent** | Your application or agent loop | — |
| **Cycles SDK / middleware** | Wraps reserve/commit lifecycle around agent calls | [Python](https://github.com/runcycles/cycles-client-python) · [TypeScript](https://github.com/runcycles/cycles-client-typescript) · [Java](https://github.com/runcycles/cycles-spring-boot-starter) · [Rust](https://github.com/runcycles/cycles-client-rust) · [MCP](https://github.com/runcycles/cycles-mcp-server) |
| **Cycles Runtime Server** | Atomic reserve/commit/release on every request | [cycles-server](https://github.com/runcycles/cycles-server) |
| **Cycles Admin Server** | Tenants, budgets, policies, API keys | [cycles-server-admin](https://github.com/runcycles/cycles-server-admin) |
| **Cycles Dashboard** | Operator UI for the admin server | [cycles-dashboard](https://github.com/runcycles/cycles-dashboard) |
| **State store** | Redis (budgets, reservations, balances, quota counters) | — |
| **Events / webhooks** | Async delivery of denials, overages, audit events | [cycles-server-events](https://github.com/runcycles/cycles-server-events) |
| **Downstream actions** | The LLMs, tools, APIs, and writes Cycles governs | — |

## Where to go next

- **Get the protocol** — [cycles-protocol](https://github.com/runcycles/cycles-protocol) for the OpenAPI spec
- **Run it** — [Deploy the Full Stack](https://runcycles.io/quickstart/deploying-the-full-cycles-stack)
- **See it stop a runaway agent** — [cycles-runaway-demo](https://github.com/runcycles/cycles-runaway-demo)
- **Component-level deep dive** — [Architecture Overview on runcycles.io](https://runcycles.io/quickstart/architecture-overview-how-cycles-fits-together) (ports, Lua scripts, auth schemes, deployment topology)
