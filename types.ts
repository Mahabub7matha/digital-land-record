export type LandRecord = {
  id: string; slug: string; record_no: string; owner_name: string; father_name: string | null;
  address: string | null; district: string | null; upazila: string | null; union_name: string | null;
  mouza: string | null; jl_no: string | null; khatian_cs: string | null; khatian_sa: string | null;
  khatian_rs: string | null; khatian_bs: string | null; dag_old: string | null; dag_new: string | null;
  land_amount: number | null; land_unit: string; land_class: string | null; deed_no: string | null;
  deed_date: string | null; sub_registry_office: string | null; boundary_north: string | null;
  boundary_south: string | null; boundary_east: string | null; boundary_west: string | null;
  notes: string | null; created_at: string;
};
export type LandDocument = { id: string; land_id: string; title: string; category: string; file_path: string; created_at: string };
