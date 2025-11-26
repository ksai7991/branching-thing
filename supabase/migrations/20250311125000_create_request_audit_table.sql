-- 20250311125000_create_request_audit_table.sql
-- Migration to create a simple request audit table for testing

BEGIN;

CREATE TABLE IF NOT EXISTS public.request_audit_log (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now(),
  endpoint text NOT NULL,
  method text NOT NULL,
  status_code integer,
  response_time_ms integer,
  metadata jsonb
);

COMMENT ON TABLE public.request_audit_log IS 'Logs HTTP requests for debugging and performance monitoring.';

COMMIT;
