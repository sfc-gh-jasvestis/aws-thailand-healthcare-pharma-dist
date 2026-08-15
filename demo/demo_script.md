# Demo Script: Pharmaceutical Distribution
## ~4-Minute Recorded Walkthrough
**Format**: Screen recording with voiceover
**Target**: Customer meeting / booth loop / social share
**Narrative**: "Snowflake forecasts pharmaceutical demand by SKU and region, automates replenishment via event-driven Tasks, and alerts distribution teams on stockout risk — replacing reactive ordering with predictive supply chain management"
**Demo Mode**: Open app with `?demo=true` for presenter notes

---

## Two Personas

| Persona | Role | Tool | What they care about |
|---|---|---|---|
| **Preecha Vorapongchai** | VP Supply Chain (Pharma) | React App (SPCS) | Service levels, stockout frequency, working capital in inventory, distribution cost |
| **Achara Boonprakob** | Demand Planning Manager | Amazon QuickSight | Forecast accuracy, seasonal demand patterns, new product launches, tender pipeline |

---

## What's Built

| Layer | Component | Detail |
|---|---|---|
| **RAW** | 8 tables | DISTRIBUTION_CENTERS (9), PRODUCTS (5000), ORDERS (450000), INVENTORY (45000), DEMAND_HISTORY (1800000), HOSPITAL_TENDERS (500), SUPPLIER_LEAD_TIMES (800), THAI_PHARMA_MARKET (10) |
| **CURATED** | 4 Dynamic Tables | STOCKOUT_RISK, DEMAND_TIMESERIES, SERVICE_LEVEL_METRICS, REPLENISHMENT_SIGNALS |
| **ML** | ML.FORECAST + ML.ANOMALY_DETECTION | Forecasting + anomaly detection |
| **AI** | COMPLETE, AI_CLASSIFY, AI_EXTRACT | Classification + extraction |
| **Search** | Cortex Search | 500 documents indexed |
| **Agent** | PHARMA_SUPPLY_CHAIN_AGENT | Semantic View + Search tools |


---

## The Story

Thailand's pharmaceutical distribution network serves 5,000 SKUs to hospitals and pharmacies through 9 distribution centers. Reactive ordering creates ฿340M in annual stockout losses while tying up ฿4.8B in excess inventory. ML-powered demand forecasting and event-driven replenishment optimize both service levels and working capital.

---

## Script

### [0:00–0:45] EXECUTIVE COCKPIT

**Show**: Executive Cockpit tab

> "Network service level at 96.8% (target: 99.2%) — ฿340M in lost sales from stockouts."

**Action**: Point at service level gauge

### [0:45–1:30] DEMAND FORECASTING

**Show**: Demand Forecasting tab

> "ML.FORECAST generates daily predictions for 45,000 SKU-region combinations."

**Action**: Show demand forecast dashboard by product category

### [1:30–2:15] SMART REPLENISHMENT

**Show**: Smart Replenishment tab

> "Event-driven replenishment: Tasks + Streams trigger orders when inventory crosses threshold."

**Action**: Show event-driven pipeline diagram

### [2:15–3:00] ASK AI

**Show**: Ask AI tab

> "Preecha asks: 'Which SKUs should we expedite orders for this week?'"

**Action**: Type: 'SKUs requiring expedited orders this week'

### [3:00–3:45] ARCHITECTURE & DATA

**Show**: Architecture & Data tab

> "Seven Snowflake capabilities, six AWS services."

**Action**: Walk through architecture diagram


---

## Key Demo Differentiators

1. **ML.FORECAST for 45,000 SKU-region pairs** — Only demo forecasting pharmaceutical demand at SKU × distribution center granularity
2. **EventBridge → Tasks + Streams for replenishment** — Event-driven replenishment triggering on inventory and demand threshold events
3. **ML.ANOMALY_DETECTION for demand spikes** — Early detection of unusual demand patterns (epidemic, tender wins, seasonal)
4. **Thai pharmaceutical context** — 5,000 SKUs across ethical, OTC, and device categories with Thai hospital tender pipeline
5. **Tender pipeline integration** — AI_EXTRACT on hospital tender documents to predict demand impact
6. **Working capital optimization** — ML-driven safety stock recommendations balancing service level vs inventory cost


---

## Demo Prep Checklist

### Data Verification
- [ ] `SELECT COUNT(*) FROM PHARMA_DISTRIBUTION.RAW.ORDERS` → 450000
- [ ] `SELECT COUNT(*) FROM PHARMA_DISTRIBUTION.RAW.DEMAND_HISTORY` → 1800000
- [ ] `SELECT COUNT(*) FROM PHARMA_DISTRIBUTION.CURATED.STOCKOUT_RISK WHERE DAYS_OF_SUPPLY < 7` → ~47

### ML Model Verification
- [ ] `SELECT COUNT(*) FROM PHARMA_DISTRIBUTION.ML.PHARMA_DEMAND_FORECAST_RESULTS` → >0
- [ ] `SELECT SUM(CASE WHEN IS_ANOMALY THEN 1 ELSE 0 END) FROM PHARMA_DISTRIBUTION.ML.DEMAND_SPIKE_RESULTS` → >=10

### AI/Agent Verification
- [ ] `SELECT COUNT(*) FROM PHARMA_DISTRIBUTION.AI.DEMAND_PATTERN_CLASSIFICATIONS` → >40000

