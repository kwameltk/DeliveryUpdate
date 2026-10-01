create table if not exists public.orders (
    id text primary key,
    initial text not null,
    contact text not null,
    meal text not null,
    coordinates text not null,
    area text not null,
    order_date date not null default current_date,
    time_start time not null default current_time,
    time_end time not null default current_time,
    status text not null default 'Pending',
    rider text not null default 'KFD Delivery',
    entry_source text not null default 'external',
    created_at timestamptz not null default now()
);

alter table public.orders add column if not exists initial text;
alter table public.orders add column if not exists contact text;
alter table public.orders add column if not exists meal text;
alter table public.orders add column if not exists coordinates text;
alter table public.orders add column if not exists area text;
alter table public.orders add column if not exists order_date date not null default current_date;
alter table public.orders add column if not exists time_start time not null default current_time;
alter table public.orders add column if not exists time_end time not null default current_time;
alter table public.orders add column if not exists status text default 'Pending';
alter table public.orders add column if not exists rider text default 'KFD Delivery';
alter table public.orders add column if not exists entry_source text not null default 'external';
alter table public.orders add column if not exists created_at timestamptz not null default now();

alter table public.orders alter column order_date set default current_date;
alter table public.orders alter column time_start set default current_time;
alter table public.orders alter column time_end set default current_time;
alter table public.orders alter column created_at set default now();

alter table public.orders enable row level security;

drop policy if exists "Public order access" on public.orders;
create policy "Public order access"
on public.orders
for all
to anon, authenticated
using (true)
with check (true);