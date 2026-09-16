create table if not exists public.orders (
    id text primary key,
    initial text not null,
    contact text not null,
    meal text not null,
    coordinates text not null,
    area text not null,
    status text not null default 'Pending',
    rider text not null default 'KFD Delivery'
);

alter table public.orders add column if not exists initial text;
alter table public.orders add column if not exists contact text;
alter table public.orders add column if not exists meal text;
alter table public.orders add column if not exists coordinates text;
alter table public.orders add column if not exists area text;
alter table public.orders add column if not exists status text default 'Pending';
alter table public.orders add column if not exists rider text default 'KFD Delivery';

alter table public.orders enable row level security;

drop policy if exists "Public order access" on public.orders;
create policy "Public order access"
on public.orders
for all
to anon, authenticated
using (true)
with check (true);