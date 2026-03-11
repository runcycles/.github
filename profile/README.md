# RunCycles ⚡️

**Runtime enforcement for the Cycles Protocol.**

RunCycles is the execution and control layer for systems governed by **Cycles** — an open protocol for deterministic exposure accounting in autonomous software.

It helps teams prevent runaway spend, uncontrolled retries, unsafe tool loops, and unbounded side effects by requiring exposure to be **reserved before execution** and **committed or released afterward**.

## Start here

New to Cycles? Start with the protocol, then pick the implementation surface you need.

- **Specification:** [cycles-protocol](https://github.com/runcycles/cycles-protocol) — protocol definitions, semantics, and API contract
- **Runtime server:** [cycles-server](https://github.com/runcycles/cycles-server) — reference enforcement server for reservations, commits, releases, and balances
- **Admin plane:** [cycles-server-admin](https://github.com/runcycles/cycles-server-admin) — tenant, budget, API key, funding, and audit management
- **Spring integration:** [cycles-spring-boot-starter](https://github.com/runcycles/cycles-spring-boot-starter) — easiest way to integrate Cycles into Spring AI / JVM applications

## Why RunCycles exists

Autonomous systems do not fail like traditional software.

They loop.  
They retry.  
They fan out across tools and models.  
They keep running after partial failure.  
They create costs and side effects that are hard to predict in advance.

Traditional controls such as rate limits, timeouts, and quotas help manage **velocity**.

They do not reliably bound **total exposure**.

RunCycles exists to enforce bounded execution under real production conditions.

## What is Cycles?

**Cycles** is a protocol for deterministic exposure accounting in autonomous systems.

It defines:

- reserve → commit / release semantics for actions
- hierarchical scopes for budgets and policy inheritance
- idempotent behavior under retries and concurrency
- shadow evaluation before hard enforcement
- portable invariants across runtimes and languages

Cycles is protocol-first and runtime-agnostic.

## What is RunCycles?

RunCycles is a production runtime that enforces Cycles semantics.

It is designed for:

- long-running agent loops
- tool-calling workflows
- multi-step decision systems
- JVM-based applications
- environments where retries, crashes, and concurrency are normal

RunCycles turns Cycles from a specification into something you can deploy.

## How it works

At a high level, RunCycles enforces a simple execution pattern:

1. **Declare intent**
2. **Reserve exposure**
3. **Execute**
4. **Commit actual usage or release the remainder**

This model makes it possible to:

- stop work before budgets are exceeded
- avoid double-spend under retries
- account for actual vs estimated usage
- apply limits across parent and child scopes
- observe and tune policies before blocking production traffic

## What RunCycles enforces

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

A request can be evaluated against local limits and inherited parent limits.

### Idempotency under retries and concurrency

RunCycles is built for real failure modes:

- duplicate requests
- worker crashes
- partial retries
- concurrent execution
- delayed commits

### Shadow mode and progressive rollout

Observe, simulate, and tune policies before turning on hard enforcement.

### Production-grade runtime behavior

RunCycles is built for systems where execution is stateful, side effects matter, and correctness under load matters more than happy-path demos.

## Typical use cases

RunCycles is useful when you need deterministic control over systems that:

- call LLMs repeatedly or recursively
- invoke tools with external cost or side effects
- execute background jobs or long-lived workflows
- operate across tenants with separate budgets
- need hard boundaries around autonomous execution
- must distinguish observation from enforcement

## Quick mental model

Think of RunCycles as a **budget authority for autonomous execution**.

Not a billing dashboard.  
Not a workflow engine.  
Not a rate limiter.

It is the runtime layer that decides whether an action may proceed, how much exposure is reserved for it, and how that usage is reconciled afterward.

## The ecosystem

### Cycles Protocol
The open, language-agnostic specification for exposure accounting, reservations, commits, releases, scopes, and invariants.

### RunCycles Runtime
A production implementation that enforces Cycles semantics efficiently.

### SDKs and clients
Client libraries for integrating Cycles into applications and runtimes.

Current focus includes:

- Java / Spring Boot
- Python

Additional language support can be added without changing the protocol model.

## Where RunCycles fits

RunCycles integrates with systems that produce cost, risk, or irreversible side effects, including:

- LLM and inference calls
- external APIs
- database writes
- message dispatch
- payments
- deployments
- workflow fan-out
- EVM and other blockchain transactions

Web3 is one surface area, not a requirement.

## What RunCycles is not

RunCycles is not:

- a billing system
- a token or rewards engine
- an observability-only dashboard
- an agent framework
- a generic workflow scheduler
- an AI safety silver bullet

Its purpose is narrower and more operational:

**make autonomous exposure explicit, bounded, and enforceable.**

## When to use RunCycles

Use RunCycles when your system needs:

- hard spend boundaries
- pre-execution budget checks
- retry-safe accounting
- tenant-aware limits
- hierarchical policy control
- progressive rollout from shadow mode to enforcement

If all you need is request throttling or simple usage analytics, RunCycles is probably not the right tool.

## Design principles

RunCycles is built around a few core ideas:

- **account before enforce**
- **reserve before execute**
- **commit actuals, release remainder**
- **make retries safe**
- **keep the protocol independent of the runtime**
- **support shadow mode before hard stops**
- **treat side effects as governable exposure**

## Status

RunCycles is under active development.

The protocol is stabilizing through real implementation work and is intended to evolve with strong compatibility discipline as it moves toward v1.

## Learn more

- [Cycles Manifesto](./MANIFESTO.md)

If you are building autonomous systems and need deterministic control over their exposure, RunCycles is the runtime layer for that job.
