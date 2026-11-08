-- Run once in Supabase: SQL Editor > New query > paste > Run.
-- Two tables, each row owned by one signed-in user and invisible to everyone else.

create table if not exists public.wt_entries (
  user_id    uuid not null default auth.uid() references auth.users(id) on delete cascade,
  date       date not null,
  weight     numeric(4,1) check (weight is null or (weight >= 20 and weight <= 300)),
  gym        boolean,
  cardio     boolean,
  deficit    boolean,
  updated_at timestamptz not null default now(),
  primary key (user_id, date)
);

create table if not exists public.wt_settings (
  user_id    uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  goal       numeric(4,1),
  goal_date  date,
  updated_at timestamptz not null default now()
);

alter table public.wt_entries  enable row level security;
alter table public.wt_settings enable row level security;

create policy "wt own entries" on public.wt_entries
  for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "wt own settings" on public.wt_settings
  for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
