# Business Findings and Recommendations

## Objective and stakeholder
Operations lead wants visibility into transaction throughput, spending mix, and manual review workload. Data covers 2026-01-01 through 2026-09-30, generated synthetically.

## KPI definitions
- **Completed volume:** count of transactions where `status = 'Completed'`.
- **Completed value:** sum of `amount_usd` for completed transactions only.
- **Decline rate:** declined transactions / all transactions (pending included in denominator).
- **Review flag rate:** flagged transactions / all transactions. Flags do not equal fraud.

## Observations (synthetic data)
- 1,200 transactions; 1,099 completed; $130,162.30 completed value.
- Largest completed-spend category: **Shopping**, $51,082.58.
- 71 declined and 30 pending transactions.
- 102 records meet the synthetic review-flag heuristic.

## Recommendations (hypotheses, not proven causal findings)
1. Segment declines by channel and merchant; interview payments operations before assuming causes.
2. Compare month-level totals with transaction counts to separate volume effects from ticket-size effects.
3. Sample flagged transactions and estimate false positives before changing review thresholds.
4. Define an agreed KPI owner, refresh cadence, and validation checklist before productionizing.

## Stakeholder questions
- Does a pending transaction belong in the decline-rate denominator?
- What is the source of truth for reversals, refunds, and chargebacks?
- Which review outcomes are available for measuring false positives?
- What thresholds trigger operational escalation?

## Acceptance criteria
- Dashboard completed value matches SQL aggregate within $0.01.
- Every displayed metric states its population and time range.
- No review flag is described as confirmed fraud.
