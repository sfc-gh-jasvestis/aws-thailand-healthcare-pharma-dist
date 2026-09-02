# Pharmaceutical Distribution

**Thailand - Healthcare & Medical Tourism**
Use case: Pharma Distribution & Demand Planning

> Pharmaceutical distribution intelligence for Thailand's ฿200B market — Kinesis streams order data, EventBridge triggers replenishment via Tasks + Streams, ML.FORECAST predicts demand by SKU, and Alerts prevent stockouts.

## Why Snowflake

Snowflake forecasts pharmaceutical demand by SKU and region, automates replenishment via event-driven Tasks, and alerts distribution teams on stockout risk — replacing reactive ordering with predictive supply chain management

- **ML.FORECAST for 45,000 SKU-region pairs** - Only demo forecasting pharmaceutical demand at SKU × distribution center granularity
- **EventBridge → Tasks + Streams for replenishment** - Event-driven replenishment triggering on inventory and demand threshold events
- **ML.ANOMALY_DETECTION for demand spikes** - Early detection of unusual demand patterns (epidemic, tender wins, seasonal)
- **Thai pharmaceutical context** - 5,000 SKUs across ethical, OTC, and device categories with Thai hospital tender pipeline
- **Tender pipeline integration** - AI_EXTRACT on hospital tender documents to predict demand impact
- **Working capital optimization** - ML-driven safety stock recommendations balancing service level vs inventory cost

## What is deployed

| | |
|---|---|
| Database | `THAILAND_HEALTHCARE_PHARMA_DIST` |
| Service | `THAILAND_HEALTHCARE_PHARMA_DIST_APP` |
| Compute pool | `SEA_DEMOS_THAILAND_POOL` |
| Dimension table | `RAW.DISTRIBUTION_CENTERS` (20 rows) |
| Fact table | `RAW.DEMAND_HISTORY` (250,000 rows, 90 days) |
| Curated layer | `CURATED.PERFORMANCE_SUMMARY`, `CURATED.TREND_ANALYSIS`, `CURATED.KPI_SUMMARY` |
| Currency | THB (฿) |

Regions in play: Bangkok, Chonburi, Rayong, Chiang Mai, Songkhla
Segments: Cold Chain Vaccine, Controlled Substance, Generic Oral, Biologic

Dynamic tables are created suspended and refreshed on demand:

```bash
./refresh_demo_data.sh THAILAND_HEALTHCARE_PHARMA_DIST
```

## KPI cards

Every card below is served live from `CURATED.KPI_SUMMARY`. The app keeps the
original literal as a fallback, so it still renders if Snowflake is unreachable.

| Card | Value | Backed by |
|---|---|---|
| Delivery On-Time | `96.4%` | average per event |
| Stock-Out Risk | `14 SKUs` | average per event |
| Cold Chain Compliance | `99.2%` | average per event |
| Distribution Points | `2,847` | total across Distribution Centers |
| Forecast Accuracy | `91%` | average per event |
| Safety Stock Days | `18` | average per event |
| Expiry Risk (30d) | `฿4.2M` | total across Distribution Centers |


## Demo flow

1. Executive Cockpit
2. Demand Forecasting
3. Smart Replenishment
4. Ask AI
5. Architecture & Data

## Talking points

- **96.8%** - service level (target: 99.2%) — ฿340M in stockout losses
- **47 SKUs** - at critical stockout risk within 7 days
- **฿4.8B** - working capital in inventory (฿720M reduction opportunity)
- **45,000 forecasts** - SKU-region demand predictions updated daily
- **450K orders** - processed annually across 9 distribution centers
- **2-hour cycle** - from demand signal to replenishment PO generation

## Business impact

- Thailand's pharmaceutical market valued at ฿200B (US$5.7B) with 5% annual growth (Krungsri Research)
- ML-powered demand forecasting reduces pharmaceutical stockouts by 40-60% and excess inventory by 20-30% (McKinsey Pharma Operations)
- Event-driven replenishment reduces order-to-delivery cycle time by 50% vs batch processing (Gartner Supply Chain)
- Zuellig Pharma (Thailand) distributes to 30,000+ points of care across the country (Zuellig Pharma)

---
Generated from `generator/demo_specs/aws-thailand-healthcare-pharma-dist.json`. Do not hand-edit: run
`python3 generator/gen_repo_docs.py aws-thailand-healthcare-pharma-dist` instead.
