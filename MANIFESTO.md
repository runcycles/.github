# The Cycles Manifesto

### Risk Accounting for Autonomous Systems

---

## The Premise

Autonomous systems are crossing a threshold.

They no longer just compute.
They **act**.

They write to databases.
They trigger payments and trades.
They deploy infrastructure.
They send messages.
They create irreversible side effects.

Yet we still govern them as if all actions were equal.

They are not.

---

## The Problem

Today, autonomous agents are governed with:

* rate limits
* retries
* timeouts
* heuristics

These controls answer one question:

**How often can the system act?**

They do not answer the more important question:

**How much exposure does this action create?**

A read is not a write.
A retry is not a trade.
A suggestion is not a deployment.

Treating them as equivalent is how systems fail quietly—until they fail catastrophically.

---

## The Insight

Risk is not uniform.

Human organizations scale because they **account for exposure before enforcing control**:

* budgets
* approvals
* limits
* accountability

Before you can control risk, you must **measure** it.
Before you can enforce limits, you must **name the unit**.

Autonomous systems require the same discipline.

---

## Introducing Cycles

Cycles are **normalized units of execution risk**.

Cycles do **not** measure:

* compute
* latency
* tokens
* cost

Cycles measure **blast radius**.

You decide what consumes Cycles:

* database writes
* payments
* trades
* deletions
* deployments
* external API calls
* any irreversible or high-impact side effect

Cycles make risk:

* explicit
* comparable
* visible
* discussable

---

## Cycles Is an Accounting Layer First

Cycles begins with **deterministic risk accounting**, not control.

In v0, Cycles provides:

* a protocol for declaring intent
* a mechanism for reserving exposure
* a guarantee against double-spend under retries
* a consistent view of “what was allowed, what was consumed, and where”

This is not a policy engine.
This is not an AI safety system.

It is an **exposure ledger for autonomous execution**.

---

## Deterministic Exposure, Not Heuristics

Cycles introduces a simple but powerful model:

1. **Declare intent** (estimate risk)
2. **Reserve exposure** atomically across scopes
3. **Execute**
4. **Commit actual impact** or release unused exposure

This reserve → commit pattern ensures:

* no double-charging
* no race conditions
* no hidden overages
* no silent runaway behavior

Retries become safe.
Failures become bounded.
Concurrency becomes tractable.

---

## Scopes, Not Global Limits

Risk is contextual.

Cycles accounts for exposure across **hierarchical scopes**, such as:

* tenant
* workspace
* application
* workflow
* agent
* tool

These scopes are **derived, not guessed**.
They allow the same system to be safe at one level and constrained at another.

Cycles does not impose one taxonomy.
It provides a **common shape** for reasoning about exposure.

---

## Enforcement Is Progressive

Cycles does not assume total control on day one.

Instead:

* some actions are enforced
* some actions are observed
* all actions are accounted for

Where enforcement exists, Cycles can block execution.
Where it does not, Cycles still records the exposure.

The gap becomes visible.
Visibility drives discipline.

This mirrors how durable systems evolve:

**accounting → budgets → enforcement → markets**

Cycles starts where all durable systems start: **legibility**.

---

## Soft Landings, Not Hard Stops

Not every limit should be a wall.

Cycles supports **soft constraints**:

* caps
* cooldowns
* allowlists / denylists
* reduced capabilities

Instead of killing autonomy, systems can degrade gracefully:

* smaller models
* fewer tools
* reduced scope
* slower execution

This is how humans manage risk.
Autonomous systems deserve the same nuance.

---

## Shadow Mode Is a First-Class Concept

Cycles supports **shadow evaluation**.

Systems can:

* simulate reservations
* exercise full decision paths
* observe what *would* have been charged
* without moving real exposure

This enables:

* safe rollouts
* budget tuning
* production validation
* confidence before enforcement

You don’t learn risk by guessing.
You learn it by measuring safely.

---

## Cycles Is a Protocol Before It Is an SDK

Cycles is **protocol-first**.

It is designed to be:

* language-agnostic
* runtime-independent
* implementation-neutral

Java, Python, Rust, and others are **clients**, not authorities.

The protocol defines the invariants.
SDKs exist to make those invariants easy to use.

---

## Cycles Is a Language Before It Is a Market

Standards don’t spread by selling features.
They spread by changing how people **talk**.

When teams say:

* “this agent is cycle-heavy”
* “that workflow burned too much exposure”
* “we need a tighter cycle budget here”

A new mental model has formed.

Language precedes enforcement.
Enforcement precedes settlement.
Settlement precedes markets.

Cycles starts with language.

---

## What Cycles Is Not

Cycles is not:

* a billing system
* a token
* a rewards scheme
* a speculation asset
* an AI safety guarantee

Cycles does not promise perfect behavior.

Cycles promises **bounded surprise**.

---

## Why This Matters

Autonomy without accounting is unstable.
Accounting without enforcement is incomplete.
But enforcement without accounting is impossible.

Cycles turns:

* hope into limits
* surprises into dashboards
* chaos into budgets

It allows **more autonomy**, not less—
because the downside is visible, measurable, and bounded.

---

## The Long View

Over time, Cycles may evolve:

* from accounting → budgets
* from budgets → enforcement
* from enforcement → settlement
* from settlement → agent-to-agent commerce

None of this is assumed.
All of it must be earned.

---

## The Principle

You cannot control what you cannot account for.
You cannot scale autonomy without a unit of risk.

Cycles is that unit.

---

## The Commitment

We commit to:

* keep Cycles neutral
* keep enforcement explicit
* avoid premature economics
* let the protocol harden through use, not hype

If Cycles ever becomes opaque, arbitrary, or speculative—it has failed.

---

## The Closing

Autonomous systems are becoming actors.
Actors require limits.
Limits require accounting.

**Cycles is the accounting layer for agentic risk.**
