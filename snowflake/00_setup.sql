-- ============================================================================
-- Pharmaceutical Distribution
-- Pharmaceutical distribution intelligence for Thailand's ฿200B market — Kinesis streams order data, EventBridge triggers replenishment via Tasks + Streams, ML.FORECAST predicts demand by SKU, and Alerts prevent stockouts.
-- ============================================================================
USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS PHARMA_DISTRIBUTION;
CREATE WAREHOUSE IF NOT EXISTS PHARMA_WH WAREHOUSE_SIZE = 'MEDIUM' AUTO_SUSPEND = 120 AUTO_RESUME = TRUE;
USE DATABASE PHARMA_DISTRIBUTION;
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS CURATED;
CREATE SCHEMA IF NOT EXISTS ML;
CREATE SCHEMA IF NOT EXISTS AI;
CREATE SCHEMA IF NOT EXISTS SEARCH;
CREATE SCHEMA IF NOT EXISTS APP;

USE WAREHOUSE PHARMA_WH;
