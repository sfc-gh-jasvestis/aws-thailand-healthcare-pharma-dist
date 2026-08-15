-- ============================================================================
-- 03_STAGING.SQL — Generate synthetic data for Pharmaceutical Distribution
-- Country: THAILAND | Currency: THB
-- ============================================================================
USE DATABASE PHARMA_DISTRIBUTION;
USE SCHEMA RAW;

-- Data generation scripts are demo-specific.
-- See the handcrafted SQL in the aws-malaysia-semiconductor-yield demo for
-- the full pattern: GENERATOR + UNIFORM + LATERAL for distribution,
-- Cortex Complete for text generation, engineered key demo numbers.

-- Target row counts:
-- DISTRIBUTION_CENTERS: 9 rows — Bangkok central DC + 8 regional distribution centers
-- PRODUCTS: 5,000 rows — Pharmaceutical SKUs (ethical, OTC, medical devices)
-- ORDERS: 450,000 rows — Hospital and pharmacy orders (12 months)
-- INVENTORY: 45,000 rows — Current inventory levels by SKU and DC (5000 × 9)
-- DEMAND_HISTORY: 1,800,000 rows — Daily demand by SKU and region (5000 × 9 × ~40 weeks)
-- HOSPITAL_TENDERS: 500 rows — Government and private hospital tender pipeline
-- SUPPLIER_LEAD_TIMES: 800 rows — Supplier lead time data by product and origin
-- THAI_PHARMA_MARKET: 10 rows — Thailand pharmaceutical market statistics
