-- Generated from generator/demo_specs/aws-thailand-healthcare-pharma-dist.json
-- Regenerate with: python3 generator/gen_repo_docs.py aws-thailand-healthcare-pharma-dist
-- This is the schema that is actually deployed for THAILAND_HEALTHCARE_PHARMA_DIST.

-- THAILAND_HEALTHCARE_PHARMA_DIST  (Pharmaceutical Distribution)
-- generated from generator/demo_specs/aws-thailand-healthcare-pharma-dist.json - do not hand-edit
CREATE DATABASE IF NOT EXISTS THAILAND_HEALTHCARE_PHARMA_DIST;
CREATE SCHEMA IF NOT EXISTS THAILAND_HEALTHCARE_PHARMA_DIST.RAW;
CREATE SCHEMA IF NOT EXISTS THAILAND_HEALTHCARE_PHARMA_DIST.CURATED;
CREATE SCHEMA IF NOT EXISTS THAILAND_HEALTHCARE_PHARMA_DIST.APP;
USE DATABASE THAILAND_HEALTHCARE_PHARMA_DIST;

-- 5 real regions; entity names carry their region so the two always agree
