-- ডিজিটাল ভূমি তথ্য: Supabase SQL Editor-এ একবার চালান।
create extension if not exists pgcrypto;

create table if not exists public.land_records (
 id uuid primary key default gen_random_uuid(),
 slug text unique not null,
 record_no text unique not null,
 owner_name text not null,
 father_name text, address text, district text, upazila text, union_name text,
 mouza text, jl_no text, khatian_cs text, khatian_sa text, khatian_rs text, khatian_bs text,
 dag_old text, dag_new text, land_amount numeric(14,2), land_unit text not null default 'শতক',
 land_class text, deed_no text, deed_date date, sub_registry_office text,
 boundary_north text, boundary_south text, boundary_east text, boundary_west text,
 notes text, created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);

create table if not exists public.land_documents (
 id uuid primary key default gen_random_uuid(),
 land_id uuid not null references public.land_records(id) on delete cascade,
 title text not null, category text not null default 'অন্যান্য',
 file_path text not null, created_at timestamptz not null default now()
);

alter table public.land_records enable row level security;
alter table public.land_documents enable row level security;

-- Public QR page: everyone can read land records and document metadata.
create policy "Public can view land records" on public.land_records
 for select using (true);
create policy "Authenticated admins can insert land records" on public.land_records
 for insert to authenticated with check (true);
create policy "Authenticated admins can update land records" on public.land_records
 for update to authenticated using (true) with check (true);
create policy "Authenticated admins can delete land records" on public.land_records
 for delete to authenticated using (true);

create policy "Public can view document metadata" on public.land_documents
 for select using (true);
create policy "Authenticated admins can add document metadata" on public.land_documents
 for insert to authenticated with check (true);
create policy "Authenticated admins can delete document metadata" on public.land_documents
 for delete to authenticated using (true);

-- Public bucket: all uploaded files are publicly readable because QR scans show all documents.
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('land-documents','land-documents',true,20971520,array['application/pdf','image/jpeg','image/png','image/webp'])
on conflict (id) do update set public=true, file_size_limit=20971520;

create policy "Public read land documents" on storage.objects
 for select using (bucket_id = 'land-documents');
create policy "Authenticated admins upload land documents" on storage.objects
 for insert to authenticated with check (bucket_id = 'land-documents');
create policy "Authenticated admins delete land documents" on storage.objects
 for delete to authenticated using (bucket_id = 'land-documents');
