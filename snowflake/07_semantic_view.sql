-- ============================================================================
-- 07_SEMANTIC_VIEW.SQL — Semantic View for Pharmaceutical Distribution
-- ============================================================================
USE DATABASE PHARMA_DISTRIBUTION;
USE SCHEMA APP;

CREATE OR REPLACE SEMANTIC VIEW APP.PHARMA_DISTRIBUTION_ANALYTICS
  COMMENT = 'Pharmaceutical demand forecasting, inventory optimization, and distribution analytics'
AS
  TABLES (
    CURATED.STOCKOUT_RISK AS stockout_risk,CURATED.DEMAND_TIMESERIES AS demand_timeseries,CURATED.SERVICE_LEVEL_METRICS AS service_level_metrics,CURATED.REPLENISHMENT_SIGNALS AS replenishment_signals
  );
