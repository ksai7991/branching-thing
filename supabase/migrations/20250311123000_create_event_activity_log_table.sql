-- 20250311123000_create_event_activity_log_table.sql
-- Migration to create an event activity log table for testing

BEGIN;

CREATE TABLE IF NOT EXISTS public.event_activity_log (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now(),
  event_name text NOT NULL,
  description text,
  user_id uuid,
  metadata jsonb,
  ip_address inet,
  CONSTRAINT fk_event_user
    FOREIGN KEY (user_id)
    REFERENCES auth.users (id)
    ON DELETE SET NULL
);

COMMENT ON TABLE public.event_activity_log IS 'Logs various system or user-triggered events for auditing and debugging.';

COMMIT;
