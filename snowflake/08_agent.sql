-- ============================================================================
-- 08_AGENT.SQL — Cortex Agent for Pharmaceutical Distribution
-- ============================================================================
USE DATABASE PHARMA_DISTRIBUTION;
USE SCHEMA APP;

CREATE OR REPLACE CORTEX AGENT APP.PHARMA_SUPPLY_CHAIN_AGENT
  COMMENT = 'Pharmaceutical Distribution AI Assistant'
  MODEL = 'claude-opus-4-8'
  TOOLS = (
    SEMANTIC_VIEW_TOOL(SEMANTIC_VIEW => 'PHARMA_DISTRIBUTION.APP.PHARMA_DISTRIBUTION_ANALYTICS'),    CORTEX_SEARCH_TOOL(CORTEX_SEARCH_SERVICE => 'PHARMA_DISTRIBUTION.SEARCH.TENDER_SEARCH', TOOL_DESCRIPTION => 'Search documents for Healthcare & Medical Tourism information')
  )
  SYSTEM_PROMPT = 'You are the Pharmaceutical Supply Chain Agent for Thailand''s distribution network with 9 DCs serving 5,000 SKUs to hospitals and pharmacies nationwide.';
