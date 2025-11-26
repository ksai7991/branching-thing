-- 20250311130000_create_activity_metrics_table.sql
-- Migration to create a simple activity metrics table for testing

BEGIN;

CREATE TABLE IF NOT EXISTS public.activity_metrics (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now(),
  metric_name text NOT NULL,
  metric_value numeric,
  metadata jsonb
);

COMMENT ON TABLE public.activity_metrics IS 'Stores simple key-value metrics for testing or analytics purposes.';

COMMIT;
