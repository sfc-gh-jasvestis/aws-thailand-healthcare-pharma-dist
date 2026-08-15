-- ============================================================================
-- 10_ALERTS_NOTIFICATIONS.SQL — Alerts for Pharmaceutical Distribution
-- ============================================================================
USE DATABASE PHARMA_DISTRIBUTION;
USE SCHEMA APP;

-- Notification integration (email)
CREATE OR REPLACE NOTIFICATION INTEGRATION aws_thailand_healthcare_pharma_dist_EMAIL_INT
  TYPE = EMAIL
  ENABLED = TRUE
  ALLOWED_RECIPIENTS = ('jonathan.asvestis@snowflake.com');

-- Alert: STOCKOUT_7DAY_ALERT
CREATE OR REPLACE ALERT APP.STOCKOUT_7DAY_ALERT
  WAREHOUSE = PHARMA_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Critical SKU stockout risk within 7 days — replenishment needed'
IF (EXISTS (
  SELECT 1 FROM CURATED.STOCKOUT_RISK
  WHERE 1=1 -- Condition: DAYS_OF_SUPPLY < 7 for any critical SKU
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_thailand_healthcare_pharma_dist_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Pharmaceutical Distribution: Critical SKU stockout risk within 7 days — replenishment needed',
    'Critical SKU stockout risk within 7 days — replenishment needed'
  );

ALTER ALERT APP.STOCKOUT_7DAY_ALERT RESUME;

-- Alert: DEMAND_SPIKE_ALERT
CREATE OR REPLACE ALERT APP.DEMAND_SPIKE_ALERT
  WAREHOUSE = PHARMA_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Unexpected demand spike detected — investigate and replenish'
IF (EXISTS (
  SELECT 1 FROM CURATED.STOCKOUT_RISK
  WHERE 1=1 -- Condition: DEMAND > 200% of forecast for any SKU-region
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_thailand_healthcare_pharma_dist_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Pharmaceutical Distribution: Unexpected demand spike detected — investigate and replenish',
    'Unexpected demand spike detected — investigate and replenish'
  );

ALTER ALERT APP.DEMAND_SPIKE_ALERT RESUME;

