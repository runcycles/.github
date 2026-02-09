# RunCycles ⚡️

RunCycles is a high-performance **execution engine** built to run systems governed by the **Cycles Protocol**.

Cycles defines *how risk and exposure are accounted for*.  
RunCycles provides *one concrete runtime* that enforces those rules efficiently in production.

---

## What Is Cycles?

**Cycles** is a protocol for deterministic exposure accounting in autonomous systems.

It introduces:
- reserve → commit semantics for agent actions
- hierarchical scopes for contextual budgets
- idempotent execution under retries and concurrency
- optional “shadow mode” evaluation before enforcement

Cycles is **protocol-first** and runtime-agnostic.  
RunCycles is an implementation—not the authority.

---

## What Is RunCycles?

RunCycles is the **execution layer** that makes Cycles practical at scale.

It is designed for:
- long-running autonomous agents
- high-throughput decision loops
- JVM-based production systems
- environments where retries, crashes, and concurrency are normal

RunCycles turns Cycles from a specification into something you can deploy.

---

## The Ecosystem

- **Cycles Protocol**  
  The open, language-agnostic protocol defining exposure accounting, reservations, commits, scopes, and invariants.

- **RunCycles Engine**  
  A production-grade execution runtime that enforces Cycles semantics efficiently.

- **SDKs (Open Source)**  
  Client libraries that make it easy to integrate Cycles into applications:
  - Java / Spring Boot
  - Python  
  (Rust, Go, and others planned)

SDKs are clients of the protocol—not special cases.

---

## Key Capabilities

- **Deterministic Execution Control**  
  Reserve exposure before execution, commit actual impact after—no double-spend, no runaway retries.

- **Stateful Agent Loops**  
  First-class support for long-running, persistent agent workflows.

- **Hierarchical Budgeting**  
  Account for exposure across tenants, apps, workflows, agents, tools, or custom dimensions.

- **Shadow Mode & Progressive Enforcement**  
  Evaluate and observe exposure without blocking execution. Turn enforcement on when ready.

- **Production-Grade Runtime**  
  Built for real systems: crashes happen, retries happen, concurrency happens.

---

## Web3 & External Systems

RunCycles integrates cleanly with:
- EVM-compatible networks (Ethereum, Base, others)
- external APIs and services
- irreversible side-effect systems (payments, deployments, writes)

Web3 is **a surface area**, not an assumption.

Cycles governs *risk*, not *where you execute*.

---

## What RunCycles Is *Not*

RunCycles is not:
- a billing system
- a token or rewards engine
- an AI safety silver bullet
- a speculative economic layer

It exists to make **autonomy safer by making exposure explicit**.

---

## Cycles Manifesto

If you want the philosophy behind the protocol:

📜 **[Read the Cycles Manifesto](https://github.com/runcycles/.github/blob/main/MANIFESTO.md)**

---

## Status

RunCycles is under active development.

The protocol is stabilizing at **v0**, with a strong backward-compatibility contract as it evolves toward v1.

If you’re building autonomous systems and want deterministic control over their blast radius—this is for you.
