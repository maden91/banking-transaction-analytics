# Project 1 — Banking Transaction Analytics Dashboard

**Business question:** How can an operations analyst understand payment activity, transaction outcomes, and potential review workload?

## Deliverables
- `data/transactions.csv`: 1,200 reproducible fictional records (seed 42).
- `data/banking_analytics.db`: ready-to-query SQLite database.
- `sql/analysis.sql`: six analytical queries.
- `dashboard/index.html`: browser-ready dashboard (no installation).
- `dashboard/metrics.json`: audit-friendly snapshot metrics.
- `docs/business_findings.md`: business interpretation and recommendations.

## How to run
1. Double-click `dashboard/index.html` in any browser.
2. Open `data/banking_analytics.db` in DB Browser for SQLite or run `sqlite3 data/banking_analytics.db < sql/analysis.sql`.
3. Validate dashboard values against SQL results. Only completed transactions count toward spend.

## Scope and limitations
The synthetic review flag is a simple amount/category rule, **not** a validated fraud model. No actual customers, bank systems, or private data are used. The dashboard is static rather than a live database connection.

## Interview narrative
'I translated an operations question into measurable KPIs, created a reproducible SQL dataset, visualized completed transaction value and trends, and documented follow-up questions for stakeholders.'
