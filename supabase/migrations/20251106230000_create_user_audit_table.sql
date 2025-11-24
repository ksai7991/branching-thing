-- 20251106230000_create_user_audit_table.sql
-- Migration to create a user audit table for testing

BEGIN;

CREATE TABLE IF NOT EXISTS public.user_audit_log (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now(),
  user_id uuid NOT NULL,
  action text NOT NULL,
  metadata jsonb,
  ip_address inet,
  CONSTRAINT fk_user
    FOREIGN KEY (user_id)
    REFERENCES auth.users (id)
    ON DELETE CASCADE
);

COMMENT ON TABLE public.user_audit_log IS 'Tracks user actions for audit and debugging purposes.';

COMMIT;
