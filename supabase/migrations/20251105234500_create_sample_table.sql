-- 20251105234500_create_sample_table.sql
-- Migration to create a sample table for testing

BEGIN;

CREATE TABLE IF NOT EXISTS public.sample_data (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now(),
  name text NOT NULL,
  description text,
  is_active boolean DEFAULT true
);

COMMENT ON TABLE public.sample_data IS 'A test table created to simulate a migration.';

COMMIT;
