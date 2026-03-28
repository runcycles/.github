# Runcycles — Rein in autonomous chaos ⚡️

**The production runtime for the Cycles protocol.**

**Cycles** defines how agents reserve budget, commit spend, and release unused reservations. 

**Runcycles** enforces those rules in production — atomically, under concurrency, across retries.

>Think: **Cycles** is an open protocol. **Runcycles** is your server.

Runcycles enforces one rule:

**reserve exposure before execution, then commit actual usage or release the remainder afterward.**

👉 **Start with [Cycles Docs](https://runcycles.github.io/docs)**  
👉 **Experience Cycles with [Runaway Demo](https://github.com/runcycles/cycles-runaway-demo)**

👉 **Read the [Protocol](https://github.com/runcycles/cycles-protocol)**  
👉 **Deploy the [Reference Server](https://github.com/runcycles/cycles-server)**

## Start here

New to Cycles? Start with the protocol, then choose the implementation surface you need.

- [cycles-protocol](https://github.com/runcycles/cycles-protocol) — protocol definitions, semantics, and API contract
- [cycles-server](https://github.com/runcycles/cycles-server) — reference enforcement server for reservations, commits, releases, and balances
- [cycles-server-admin](https://github.com/runcycles/cycles-server-admin) — tenant, budget, API key, funding, and audit management
- [cycles-spring-boot-starter](https://github.com/runcycles/cycles-spring-boot-starter) — easiest way to integrate Cycles into Spring AI / Java apps
- [cycles-client-python](https://github.com/runcycles/cycles-client-python) — integrate Cycles budget and risk control into Python apps
- [cycles-client-typescript](https://github.com/runcycles/cycles-client-typescript) — budget and risk control for Node.js / Vercel AI / LangChain/ OpenAI
- [cycles-mcp-server](https://github.com/runcycles/cycles-mcp-server) — MCP server that gives AI agents runtime budget control — reserve, commit, and release
- [cycles-openai-agents](https://github.com/runcycles/cycles-openai-agents) — Budget, risk runtime authority for the OpenAI Agents SDK, powered by Cycles
- [cycles-openclaw-budget-guard](https://github.com/runcycles/cycles-openclaw-budget-guard) — OpenClaw plugin for budget-aware model and tool execution using Cycles
- [cycles-runaway-demo](https://github.com/runcycles/cycles-runaway-demo) — self-contained demo showing a runaway agent failure mode and Runcycles stopping it
- [cycles-agent-action-authority-demo](https://github.com/runcycles/cycles-agent-action-authority-demo) — self-contained demo showing Cycles stopping agent performing next email, CRM action

👉 Learn more: **[Cycles Docs](https://runcycles.github.io/docs)**

## Why Runcycles exists

Autonomous systems do not fail like traditional software.

They loop.  
They retry.  
They fan out across tools and models.  
They continue after partial failure.  
They create costs and side effects that are difficult to predict in advance.

Traditional controls like rate limits, timeouts, and quotas help manage **velocity**.

They do not reliably bound **total exposure**.

Runcycles exists to enforce bounded execution under real production conditions.

## What is Cycles?

**Cycles** is a protocol for deterministic exposure accounting in autonomous systems.

It defines:

- reserve → commit / release semantics
- hierarchical scopes for budgets and policy inheritance
- idempotent behavior under retries and concurrency
- shadow evaluation before hard enforcement
- portable invariants across runtimes and languages

Cycles is protocol-first and runtime-agnostic.

## What is Runcycles?

Runcycles is a production runtime that enforces Cycles semantics.

It is built for systems with:

- long-running agent loops
- tool-calling workflows
- multi-step decision systems
- normal retries, crashes, and concurrency

Runcycles turns Cycles from a specification into something you can deploy.

## How it works

At a high level, Runcycles enforces a simple pattern:

1. **Declare intent**
2. **Reserve exposure**
3. **Execute**
4. **Commit actual usage or release the remainder**

This makes it possible to:

- stop work before budgets are exceeded
- avoid double-spend under retries
- reconcile actual vs estimated usage
- enforce limits across parent and child scopes
- observe and tune policies before blocking production traffic

## What Runcycles enforces

### Deterministic reserve → commit control

Reserve exposure before execution.  
Commit actual usage after execution.  
Release unused reservation when work is canceled or costs less than expected.

### Hierarchical budgeting

Apply budgets across scopes such as:

- tenant
- environment
- application
- workflow
- agent
- tool
- run

A request can be evaluated against both local limits and inherited parent limits.

### Idempotency under retries and concurrency

Runcycles is built for real failure modes:

- duplicate requests
- worker crashes
- partial retries
- concurrent execution
- delayed commits

### Shadow mode and progressive rollout

Simulate, observe, and tune policies before turning on hard enforcement.

### Failure-aware enforcement

Runcycles is designed for systems where retries, crashes, partial completion, and concurrency are normal operating conditions.

## Typical use cases

Runcycles is useful when you need deterministic control over systems that:

- call LLMs repeatedly or recursively
- invoke tools with external cost or side effects
- execute background jobs or long-lived workflows
- operate across tenants with separate budgets
- need hard boundaries around autonomous execution
- must distinguish observation from enforcement

## Who Runcycles is for

Runcycles is for teams building autonomous systems that can create meaningful cost, side effects, or operational risk.

Typical users include:

- **AI platform teams** enforcing tenant and workload budgets
- **Agent developers** building looped or tool-calling workflows
- **Spring AI / JVM teams** adding hard budget limits to production systems
- **SaaS teams** needing multi-tenant usage isolation and controls
- **Infrastructure engineers** handling retries, concurrency, and partial failure safely
- **Gateway builders** adding reservation and commit semantics to AI traffic

Runcycles is most useful when you need more than rate limits or dashboards — you need **pre-execution budget enforcement**.

## Quick mental model

Think of Runcycles as a **budget authority for autonomous execution**.

Not a billing dashboard.  
Not a workflow engine.  
Not a rate limiter.

It is the runtime layer that decides whether an action may proceed, how much exposure is reserved for it, and how that usage is reconciled afterward.

## The ecosystem

### Cycles Protocol
The open, language-agnostic specification for exposure accounting, reservations, commits, releases, scopes, and invariants.

### Runcycles Runtime
A production implementation that enforces Cycles semantics efficiently.

### SDKs and clients
Client libraries for integrating Cycles into applications and runtimes.

Current implementation focus includes:

- [Python](https://github.com/runcycles/cycles-client-python)
- [TypeScript Node.js / Next.js](https://github.com/runcycles/cycles-client-typescript)
- [Java / Spring Boot](https://github.com/runcycles/cycles-spring-boot-starter)

Additional language clients can be added without changing the protocol.

## Where Runcycles fits

Runcycles integrates with systems that produce cost, risk, or irreversible side effects, including:

- LLM and inference calls
- external APIs
- database writes
- message dispatch
- payments
- deployments
- workflow fan-out
- EVM and other blockchain transactions

Web3 is one surface area, not a requirement.

## What Runcycles is not

Runcycles is not:

- a billing system
- a token or rewards engine
- an observability-only dashboard
- an agent framework
- a generic workflow scheduler
- an AI safety silver bullet

Its purpose is specific:

**make autonomous exposure explicit, bounded, and enforceable.**

## When to use Runcycles

Use Runcycles when your system needs:

- hard spend boundaries
- pre-execution budget checks
- retry-safe accounting
- tenant-aware limits
- hierarchical policy control
- progressive rollout from shadow mode to enforcement

If all you need is request throttling or simple usage analytics, Runcycles is probably not the right tool.

## Design principles

Runcycles is built around a few core ideas:

- **account before enforce**
- **reserve before execute**
- **commit actuals, release remainder**
- **make retries safe**
- **keep the protocol independent of the runtime**
- **support shadow mode before hard stops**
- **treat side effects as governable exposure**

## Status

Runcycles is under active development.

The protocol is stabilizing through real implementation work and will evolve with strong compatibility discipline as it moves toward v1.

## Learn more

- [Cycles Manifesto](./MANIFESTO.md)
- [Cycles Docs and API Reference](https://runcycles.github.io/docs)

If you are building autonomous systems and need deterministic control over exposure, Runcycles is the runtime layer for that job.
