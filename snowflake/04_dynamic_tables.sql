-- ============================================================================
-- 04_DYNAMIC_TABLES.SQL — Curated layer for Pharmaceutical Distribution
-- ============================================================================
USE DATABASE PHARMA_DISTRIBUTION;
USE SCHEMA CURATED;

-- STOCKOUT_RISK: SKUs at risk of stockout within 7/14/30 days by DC
-- Source: INVENTORY, DEMAND_HISTORY, SUPPLIER_LEAD_TIMES
CREATE OR REPLACE DYNAMIC TABLE CURATED.STOCKOUT_RISK
  TARGET_LAG = '5 minutes'
  WAREHOUSE = PHARMA_WH
AS
SELECT * FROM RAW.INVENTORY;
-- TODO: Replace with actual join/aggregation logic per demo

-- DEMAND_TIMESERIES: Daily demand timeseries by SKU-region for ML.FORECAST
-- Source: DEMAND_HISTORY
CREATE OR REPLACE DYNAMIC TABLE CURATED.DEMAND_TIMESERIES
  TARGET_LAG = '5 minutes'
  WAREHOUSE = PHARMA_WH
AS
SELECT * FROM RAW.DEMAND_HISTORY;
-- TODO: Replace with actual join/aggregation logic per demo

-- SERVICE_LEVEL_METRICS: Fill rate and service level KPIs by DC and product category
-- Source: ORDERS, INVENTORY
CREATE OR REPLACE DYNAMIC TABLE CURATED.SERVICE_LEVEL_METRICS
  TARGET_LAG = '5 minutes'
  WAREHOUSE = PHARMA_WH
AS
SELECT * FROM RAW.ORDERS;
-- TODO: Replace with actual join/aggregation logic per demo

-- REPLENISHMENT_SIGNALS: Event-driven replenishment triggers from demand + inventory
-- Source: INVENTORY, DEMAND_HISTORY, ORDERS
CREATE OR REPLACE DYNAMIC TABLE CURATED.REPLENISHMENT_SIGNALS
  TARGET_LAG = '5 minutes'
  WAREHOUSE = PHARMA_WH
AS
SELECT * FROM RAW.INVENTORY;
-- TODO: Replace with actual join/aggregation logic per demo

