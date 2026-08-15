-- ============================================================================
-- 05_SEARCH.SQL — Cortex Search for Pharmaceutical Distribution
-- ============================================================================
USE DATABASE PHARMA_DISTRIBUTION;
USE SCHEMA SEARCH;

CREATE OR REPLACE CORTEX SEARCH SERVICE SEARCH.TENDER_SEARCH
  ON TENDER_DESCRIPTION
  ATTRIBUTES HOSPITAL, PRODUCT_CATEGORY, CLOSE_DATE
  WAREHOUSE = PHARMA_WH
  TARGET_LAG = '1 hour'
AS (
  SELECT * FROM RAW.HOSPITAL_TENDERS
);
