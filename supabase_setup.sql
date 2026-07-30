-- ==========================================
-- SCRIPT DE CONFIGURACIÓN DE SUPABASE
-- Ejecutar en el SQL Editor de Supabase
-- ==========================================

-- 1. Creación de la Tabla de Leads de Contacto
create table if not exists public.contacts_leads (
    id uuid default gen_random_uuid() primary key,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null,
    name text not null,
    email text not null,
    message text not null,
    demo_id text,
    status text default 'nuevo' not null
);

-- Habilitar RLS en contacts_leads
alter table public.contacts_leads enable row level security;

-- Política RLS: Permitir que cualquiera inserte un formulario (Público / Anon)
create policy "Permitir inserción pública anónima de leads"
on public.contacts_leads
for insert
with check (true);

-- Política RLS: Permitir lectura/escritura total solo a usuarios autenticados (Admin)
create policy "Permitir acceso total a administradores autenticados"
on public.contacts_leads
for all
to authenticated
using (true)
with check (true);


-- 2. Creación de la Tabla de Eventos de Interacción de las Demos
create table if not exists public.demo_events (
    id uuid default gen_random_uuid() primary key,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null,
    demo_name text not null,
    event_type text not null, -- Ej: 'click', 'play', 'completed', 'open'
    user_agent text,
    metadata jsonb default '{}'::jsonb not null
);

-- Habilitar RLS en demo_events
alter table public.demo_events enable row level security;

-- Política RLS: Permitir inserción pública anónima de eventos
create policy "Permitir inserción pública anónima de eventos"
on public.demo_events
for insert
with check (true);

-- Política RLS: Permitir lectura/escritura total solo a usuarios autenticados (Admin)
create policy "Permitir acceso total de eventos a administradores autenticados"
on public.demo_events
for all
to authenticated
using (true)
with check (true);


-- 3. Índices para Optimización de Consultas en el Dashboard
create index if not exists idx_contacts_leads_created_at on public.contacts_leads(created_at desc);
create index if not exists idx_demo_events_demo_name on public.demo_events(demo_name);
create index if not exists idx_demo_events_event_type on public.demo_events(event_type);
create index if not exists idx_demo_events_created_at on public.demo_events(created_at desc);
