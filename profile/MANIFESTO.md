# The Cycles Manifesto

## Deterministic Exposure Governance for Autonomous Systems

### The shift

Software used to compute.  
Now it acts.

It writes to databases, calls models, invokes tools, triggers payments, places trades, deploys infrastructure, sends messages, and creates side effects that cannot be undone.

Once systems become actors, execution is no longer just a performance problem.

It becomes an **exposure problem**.

### The failure of current controls

Most autonomous systems today are governed with:

- rate limits
- retries
- timeouts
- quotas
- heuristics

These controls answer an important question:

**How fast can the system act?**

They do not answer the more important one:

**How much exposure is the system allowed to create?**

A read is not a write.  
A retry is not a trade.  
A suggestion is not a deployment.  
An LLM call is not the same as a payment instruction.

Treating all actions as equivalent is manageable in simple software. In autonomous systems, it is how small errors become unbounded outcomes.

### The missing primitive

Human institutions scale because they account before they enforce.

They establish budgets, approvals, limits, ledgers, and accountability.

Autonomous systems need the same discipline.

Before you can enforce exposure, you must account for it.  
Before you can budget it, you must name the unit.  
Before you can trust autonomy, you must make its downside legible.

### What Cycles are

**Cycles are operator-defined units of bounded autonomous exposure.**

A Cycle is not a token count.  
It is not latency.  
It is not compute time.  
It is not a cloud bill.

A Cycle is a normalized accounting unit used to govern actions that create cost, side effects, or irreversible consequences.

You decide what consumes Cycles. That may include:

- model usage
- external API calls
- database writes
- deletions
- workflow fan-out
- tool invocations
- payments
- trades
- deployments
- any action whose downside should be budgeted before execution

Cycles do not claim to measure truth. They provide a common unit for **declaring, reserving, consuming, and limiting exposure**.

### The core execution model

Cycles introduces a deterministic execution pattern:

1. **Declare intent**
2. **Reserve exposure**
3. **Execute**
4. **Commit actual usage or release the remainder**

This is the core invariant.

Autonomous systems should not discover their exposure only after execution. They should reserve bounded room to act before they act.

This model makes critical properties possible:

- bounded execution under concurrency
- safe retries without double-spend
- explicit attribution of consumption
- hierarchical enforcement across scopes
- visibility into what was allowed, used, denied, or exceeded

This is not a metaphor. It is an accounting discipline for agent runtimes.

### Why reserve/commit matters

Without reservation, budgets are advisory.

Without commit/release, estimates and actuals collapse into guesswork.

Without deterministic accounting, retries, loops, fan-out, and concurrency create hidden overages that are hard to attribute and impossible to govern cleanly.

Reserve/commit changes that.

It turns:

- “we hope this agent stays within bounds”

into:

- “this agent had this much exposure reserved, consumed this much, and returned the rest”

That is the difference between observability and control.

### Exposure is contextual

There is no single global budget that makes autonomous systems safe.

Exposure exists across scopes such as:

- tenant
- workspace
- environment
- application
- workflow
- agent
- tool
- run

A system may be safe at one level and dangerous at another.

Cycles is designed for **hierarchical exposure governance**. It allows limits to be reasoned about locally and enforced consistently across parent scopes, rather than hidden inside isolated services and ad hoc checks.

### Accounting first, enforcement next

Cycles begins with accounting.

Not every environment is ready for hard enforcement on day one.

So Cycles supports a progression:

**accounting → budgets → enforcement → settlement**

Some teams need visibility before denial.  
Some need shadow mode before rollout.  
Some need soft constraints before hard stops.

Durable governance systems do not begin with absolute control. They begin with legibility.

Cycles makes exposure visible first, so enforcement can become explicit later.

### Soft constraints matter

Not every violation should terminate execution.

Good governance is not only about blocking. It is about degrading safely.

That may mean:

- routing to smaller models
- disabling specific tools
- reducing concurrency
- shrinking scope
- enforcing cooldowns
- moving from write-capable to read-only behavior

Autonomous systems should fail with bounded consequence, not binary collapse.

### Shadow mode is essential

You do not learn autonomous exposure by debating it in the abstract.

You learn it by observing real workloads safely.

Cycles supports shadow evaluation so teams can:

- simulate reservations
- estimate budget needs
- compare expected versus actual usage
- validate policies before enforcement
- instrument production systems without immediate disruption

That makes governance adoptable.

### Protocol first

Cycles is protocol-first because the authority must be independent of the runtime.

Java, Python, Rust, TypeScript, and other SDKs are clients. They are not the source of truth.

The protocol defines the invariants:

- how exposure is declared
- how it is reserved
- how it is committed
- how it is released
- how it is attributed across scopes
- how retries remain safe

This is what makes Cycles portable across runtimes, frameworks, and agent architectures.

### What Cycles is not

Cycles is not:

- a billing dashboard
- a token
- a rewards scheme
- a speculation asset
- a vague AI safety claim
- a promise that autonomous systems will behave perfectly

Cycles does not eliminate risk.

Cycles makes risk **accountable, bounded, and enforceable**.

Its promise is not perfection.

Its promise is **bounded surprise**.

### Why this matters

Autonomy without accounting is unstable.  
Accounting without enforcement is incomplete.  
Enforcement without accounting is arbitrary.

As autonomous systems move from chat to action, they need more than retries and rate limits. They need a control layer that can budget consequence before execution and reconcile actual usage afterward.

That is what Cycles provides.

Cycles turns:

- hidden exposure into explicit budgets
- retries into safe accounting events
- concurrency into bounded execution
- runaway behavior into visible limit breaches
- autonomy into something institutions can actually operate

### The long view

If Cycles succeeds, it may evolve over time:

- from accounting to budgeting
- from budgeting to enforcement
- from enforcement to settlement
- from local controls to interoperable autonomous commerce

None of that is assumed.

It must be earned through use, clarity, and correctness.

The protocol should harden through real workloads, not hype.

### The principle

You cannot govern what you do not account for.  
You cannot scale autonomy without bounded exposure.  
You cannot make exposure enforceable without a unit.

**Cycles is that unit.**

### The commitment

We commit to keeping Cycles:

- neutral
- explicit
- implementation-independent
- operationally legible
- resistant to speculative distraction

If Cycles becomes opaque, arbitrary, or merely theatrical, it has failed.

### Closing

Autonomous systems are becoming economic and operational actors.

Actors require limits.  
Limits require accounting.  
Accounting requires a unit.

**Cycles is the accounting and governance layer for bounded autonomous execution.**
