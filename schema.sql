-- 1. Table admin_users
create table admin_users (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  name text not null,
  role text default 'admin',
  is_active boolean default true,
  created_at timestamptz default now()
);

-- 2. Table companies
create table companies (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text unique not null,
  logo_url text,
  industry text,
  description text,
  address text,
  city text,
  province text,
  website_url text,
  instagram_url text,
  linkedin_url text,
  email_hr text,
  whatsapp_hr text not null,
  is_active boolean default true,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- 3. Table job_categories
create table job_categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text unique not null,
  icon text,
  is_active boolean default true,
  created_at timestamptz default now()
);

-- 4. Table jobs
create table jobs (
  id uuid primary key default gen_random_uuid(),
  company_id uuid references companies(id) on delete cascade,
  category_id uuid references job_categories(id),

  title text not null,
  slug text unique not null,

  location text,
  city text,
  province text,

  employment_type text,
  work_arrangement text,
  experience_level text,

  salary_min numeric,
  salary_max numeric,
  show_salary boolean default false,

  description text not null,
  responsibilities text,
  requirements text,
  benefits text,

  apply_whatsapp_number text,
  apply_message_template text,

  status text default 'draft',
  is_featured boolean default false,

  published_at timestamptz,
  expired_at timestamptz,

  created_by uuid references auth.users(id),
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- 5. Table job_apply_clicks
create table job_apply_clicks (
  id uuid primary key default gen_random_uuid(),
  job_id uuid references jobs(id) on delete cascade,
  clicked_at timestamptz default now(),
  referrer text,
  user_agent text,
  ip_hash text
);

-- 6. Table admin_logs
create table admin_logs (
  id uuid primary key default gen_random_uuid(),
  admin_id uuid references auth.users(id),
  action text not null,
  target_type text,
  target_id uuid,
  description text,
  created_at timestamptz default now()
);

-- 7. Table job_views (optional, added just in case)
create table job_views (
  id uuid primary key default gen_random_uuid(),
  job_id uuid references jobs(id) on delete cascade,
  viewed_at timestamptz default now(),
  referrer text,
  user_agent text,
  ip_hash text
);
