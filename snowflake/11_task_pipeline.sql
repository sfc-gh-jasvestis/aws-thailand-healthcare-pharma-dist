-- ============================================================================
-- 11_TASK_PIPELINE.SQL — Task DAG for Pharmaceutical Distribution
-- ============================================================================
USE DATABASE PHARMA_DISTRIBUTION;
USE SCHEMA APP;

CREATE OR REPLACE TASK APP.TASK_INGEST_ORDERS
  WAREHOUSE = PHARMA_WH
  SCHEDULE = 'USING CRON 0 */2 * * * UTC'
  COMMENT = 'Ingest latest order data and update inventory positions'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_GENERATE_REPLENISHMENT
  WAREHOUSE = PHARMA_WH
  AFTER APP.TASK_INGEST_ORDERS
  COMMENT = 'Calculate replenishment requirements based on forecast + inventory'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_REFRESH_FORECASTS
  WAREHOUSE = PHARMA_WH
  SCHEDULE = 'USING CRON 0 4 * * * UTC'
  COMMENT = 'Refresh daily demand forecasts for all SKU-region pairs'
AS
  SELECT 1; -- Replace with actual refresh logic

ALTER TASK APP.TASK_REFRESH_FORECASTS RESUME;
ALTER TASK APP.TASK_GENERATE_REPLENISHMENT RESUME;
ALTER TASK APP.TASK_INGEST_ORDERS RESUME;
