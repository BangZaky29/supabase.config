Siap bro. Ini **alur pengerjaan developer dari MVP sampai production-ready**, dibuat **singkat, step-by-step, dan urut prioritas** biar developer nggak loncat-loncat.

Target sistem:

```text
Admin Dashboard → input perusahaan & loker
Public Loker UI → tampil di nuansalegal.id / subdomain
Pelamar → apply via WhatsApp
```

---

# Roadmap Pengerjaan Developer

## Phase 1 — Fondasi Project

**Prioritas pertama, wajib beres dulu.**

### 1. Setup project Next.js + TypeScript

Yang dikerjakan:

```text
Setup Next.js App Router
Setup Tailwind CSS
Setup struktur folder
Setup environment .env
Setup Git repository
Setup basic layout
```

Output:

```text
Project bisa jalan local
Struktur awal rapi
Environment siap
```

---

### 2. Setup Supabase

Yang dikerjakan:

```text
Buat project Supabase
Buat database schema
Setup Supabase Auth
Setup Supabase Storage
Setup connection dari Next.js ke Supabase
```

Table awal:

```text
admin_users
companies
job_categories
jobs
job_apply_clicks
admin_logs
```

Output:

```text
Database siap
Auth siap
Storage siap
Next.js sudah connect ke Supabase
```

---

### 3. Setup Auth Admin

Yang dikerjakan:

```text
Buat halaman login admin
Integrasi Supabase Auth
Buat middleware proteksi /admin
Cek user hanya boleh masuk kalau ada di admin_users
```

Output:

```text
Admin bisa login
Route admin aman
User biasa tidak bisa akses dashboard
```

---

# Phase 2 — Admin Dashboard Core

Ini bagian paling penting, karena semua data loker berasal dari admin.

---

## 4. Buat Layout Admin Dashboard

Yang dikerjakan:

```text
Sidebar admin
Header admin
Dashboard overview
Card statistik
Table reusable
Form reusable
```

Menu awal:

```text
Dashboard
Perusahaan
Lowongan
Kategori
Statistik Apply
Pengaturan
```

Output:

```text
Dashboard admin sudah punya layout utama
```

---

## 5. CRUD Kategori Lowongan

Kerjakan kategori dulu karena dipakai saat input lowongan.

Yang dikerjakan:

```text
Tambah kategori
Edit kategori
Hapus/nonaktif kategori
List kategori
Slug kategori
```

Contoh kategori:

```text
Legal & Compliance
Admin
Finance
HR
Marketing
Sales
Operasional
IT
Customer Service
```

Output:

```text
Admin bisa kelola kategori lowongan
```

---

## 6. CRUD Perusahaan

Setelah kategori, lanjut perusahaan.

Yang dikerjakan:

```text
Tambah perusahaan
Edit perusahaan
Upload logo
Isi nomor WhatsApp HR
Isi alamat/lokasi
Isi deskripsi perusahaan
Aktif/nonaktif perusahaan
```

Field penting:

```text
Nama perusahaan
Slug
Logo
Industry
Deskripsi
Alamat
Kota
Email HR
WhatsApp HR
Status aktif
```

Output:

```text
Admin bisa input data perusahaan penyedia loker
```

---

## 7. CRUD Lowongan

Ini core utama sistem.

Yang dikerjakan:

```text
Tambah lowongan
Edit lowongan
Hapus lowongan
Preview lowongan
Publish lowongan
Close lowongan
Duplicate lowongan
Set expired date
```

Field lowongan:

```text
Judul lowongan
Perusahaan
Kategori
Lokasi
Tipe kerja
Sistem kerja
Level pengalaman
Gaji
Deskripsi
Tanggung jawab
Kualifikasi
Benefit
Nomor WhatsApp apply
Template pesan WhatsApp
Status
Expired date
Featured
```

Status lowongan:

```text
draft
published
closed
expired
archived
```

Output:

```text
Admin bisa input dan publish lowongan
```

---

# Phase 3 — Public Loker UI

Setelah admin bisa input data, baru bikin tampilan public.

---

## 8. Halaman List Loker Public

Yang dikerjakan:

```text
Halaman /loker
Tampilkan lowongan published
Tampilkan card lowongan
Search posisi
Filter lokasi
Filter kategori
Filter tipe kerja
Responsive mobile
```

Logic penting:

```text
Hanya tampilkan jobs.status = published
Hanya tampilkan lowongan yang belum expired
Perusahaan harus aktif
```

Output:

```text
User bisa lihat daftar lowongan public
```

---

## 9. Halaman Detail Lowongan

Yang dikerjakan:

```text
Halaman /loker/[slug]
Detail posisi
Detail perusahaan
Deskripsi pekerjaan
Kualifikasi
Benefit
Lokasi
Deadline
Tombol Lamar via WhatsApp
Warning anti-penipuan
```

Output:

```text
User bisa buka detail lowongan
```

---

## 10. Fitur Lamar via WhatsApp

Yang dikerjakan:

```text
Generate link WhatsApp otomatis
Template pesan otomatis
Endpoint redirect apply
Catat klik apply
Redirect ke WhatsApp perusahaan
```

Flow:

```text
User klik Lamar
↓
API cek lowongan aktif
↓
Simpan click ke job_apply_clicks
↓
Redirect ke WhatsApp perusahaan
```

Template pesan:

```text
Halo HR [Nama Perusahaan], saya tertarik melamar posisi [Nama Posisi] yang saya lihat di Nuansa Legal Career Hub.

Nama:
Domisili:
Pendidikan terakhir:
Pengalaman singkat:

Saya akan melampirkan CV saya melalui chat ini. Terima kasih.
```

Output:

```text
Pelamar bisa apply langsung via WhatsApp
Admin bisa lihat jumlah klik apply
```

---

# Phase 4 — Statistik & Admin Utility

Setelah flow utama jalan, baru tambah statistik.

---

## 11. Statistik Dashboard

Yang dikerjakan:

```text
Total perusahaan
Total lowongan
Lowongan aktif
Lowongan draft
Lowongan closed
Total klik apply
Lowongan paling banyak diklik
```

Output:

```text
Admin bisa lihat performa loker
```

---

## 12. Admin Log

Yang dikerjakan:

```text
Catat aktivitas admin
Create company
Update company
Create job
Publish job
Close job
Delete job
```

Output:

```text
Aktivitas admin bisa ditrack
```

---

# Phase 5 — MVP Testing

Di tahap ini sistem sudah MVP. Fokusnya bukan nambah fitur, tapi memastikan flow aman.

---

## 13. Testing Flow Utama

Test satu per satu:

```text
Admin login
Admin tambah kategori
Admin tambah perusahaan
Admin tambah lowongan draft
Admin publish lowongan
Lowongan tampil public
User buka detail lowongan
User klik Lamar via WhatsApp
Klik apply tercatat
Admin close lowongan
Lowongan tidak bisa dilamar
```

Output:

```text
Flow utama valid dari admin sampai pelamar
```

---

## 14. Testing Security

Yang dicek:

```text
/admin tidak bisa dibuka tanpa login
/api/admin tidak bisa diakses tanpa session
User non-admin tidak bisa akses dashboard
Service role key tidak bocor ke frontend
Input form tervalidasi
Upload logo tervalidasi
Lowongan draft tidak tampil public
Lowongan expired tidak tampil public
```

Output:

```text
Sistem cukup aman untuk MVP public
```

---

# Phase 6 — Polishing UI/UX

Setelah fitur utama aman, baru poles tampilan.

---

## 15. Polishing Public UI

Yang dikerjakan:

```text
Rapikan hero loker
Rapikan job card
Rapikan detail lowongan
Tambah empty state
Tambah loading state
Tambah error state
Responsive mobile
CTA WhatsApp lebih jelas
```

Output:

```text
Public loker terlihat profesional
```

---

## 16. Polishing Admin UI

Yang dikerjakan:

```text
Table lebih enak dibaca
Filter status di admin
Search lowongan di admin
Badge status
Preview sebelum publish
Konfirmasi sebelum delete
Toast notification
```

Output:

```text
Admin dashboard nyaman dipakai team Nuansa
```

---

# Phase 7 — SEO & Integrasi Website Utama

Ini penting supaya halaman loker bisa kebaca Google dan nyambung ke Nuansa Legal.

---

## 17. SEO Basic

Yang dikerjakan:

```text
Meta title halaman loker
Meta description
Open Graph image
Slug lowongan SEO-friendly
Sitemap
Robots.txt
Structured data JobPosting
```

Contoh title:

```text
Lowongan Kerja Terbaru | Nuansa Legal Career Hub
```

Output:

```text
Halaman loker lebih siap untuk SEO
```

---

## 18. Integrasi ke Website NuansaLegal.id

Yang dikerjakan:

```text
Tambah menu Loker di navbar utama
Tambah CTA dari homepage ke loker
Samakan footer
Samakan warna brand
Link balik dari loker ke website utama
```

Output:

```text
Loker terasa menyatu dengan website Nuansa Legal
```

---

# Phase 8 — Deployment Production

Setelah testing dan polishing, baru deploy.

---

## 19. Setup Production Environment

Yang dikerjakan:

```text
Setup domain/subdomain
Setup environment production
Setup Supabase production
Setup storage bucket
Setup SSL
Setup deployment Vercel/VPS
```

Rekomendasi URL:

```text
loker.nuansalegal.id
```

Atau kalau sudah siap reverse proxy:

```text
nuansalegal.id/loker
```

Output:

```text
Aplikasi live di production
```

---

## 20. Final QA Production

Test ulang di server live:

```text
Login admin production
Tambah perusahaan
Tambah lowongan
Publish
Cek halaman public
Klik WhatsApp
Cek responsive mobile
Cek speed
Cek SEO meta
Cek security route
```

Output:

```text
MVP siap dipakai publik
```

---

# Phase 9 — Production Ready Enhancement

Ini tahap setelah MVP live, supaya sistem makin matang.

---

## 21. Backup & Monitoring

Yang dikerjakan:

```text
Backup database Supabase
Monitoring error
Monitoring uptime
Log error API
Cek performa query
```

Output:

```text
Sistem lebih aman untuk jangka panjang
```

---

## 22. Enhancement Fitur

Fitur lanjutan yang bisa ditambah setelah MVP:

```text
Job view tracking
Featured job
Company page detail
Export data klik apply
Auto expired job by cron
Bulk upload lowongan
Rich text editor untuk deskripsi
Image banner lowongan
Multiple admin account
Role admin/editor
```

Output:

```text
Sistem naik level dari MVP ke production-ready
```

---

# Urutan Prioritas Final

Ini urutan paling aman yang harus dikerjakan developer:

```text
1. Setup Next.js + TypeScript
2. Setup Supabase
3. Buat schema database
4. Buat auth admin
5. Proteksi route admin
6. Buat layout admin dashboard
7. CRUD kategori
8. CRUD perusahaan
9. CRUD lowongan
10. Publish/close/expired status
11. Public list loker
12. Public detail lowongan
13. Apply via WhatsApp
14. Tracking klik apply
15. Statistik admin
16. Testing flow utama
17. Testing security
18. Polishing UI public
19. Polishing UI admin
20. SEO basic
21. Integrasi menu ke nuansalegal.id
22. Deploy production
23. Final QA
24. Backup & monitoring
25. Enhancement production-ready
```

---

# Timeline Singkat Realistis

| Tahap   | Fokus                            |            Estimasi |
| ------- | -------------------------------- | ------------------: |
| Phase 1 | Setup project, Supabase, auth    |            1 minggu |
| Phase 2 | Admin dashboard core             |          1–2 minggu |
| Phase 3 | Public loker UI + WhatsApp apply |          1–2 minggu |
| Phase 4 | Statistik & admin utility        |            3–5 hari |
| Phase 5 | Testing MVP                      |            3–5 hari |
| Phase 6 | UI polishing                     |            3–5 hari |
| Phase 7 | SEO & integrasi website utama    |            2–4 hari |
| Phase 8 | Deployment production            |            2–4 hari |
| Phase 9 | Production-ready enhancement     | 1–2 minggu tambahan |

Estimasi paling realistis:

```text
MVP basic        : 3–4 minggu
MVP rapi         : 5–6 minggu
Production-ready : 7–8 minggu
```

---

# Kesimpulan Bro

Alur paling benar adalah:

```text
Fondasi sistem dulu
↓
Admin dashboard dulu
↓
Input data perusahaan dan lowongan
↓
Public loker UI
↓
Apply via WhatsApp
↓
Testing security
↓
Polishing
↓
SEO
↓
Deploy
↓
Production-ready enhancement
```

Jangan mulai dari tampilan public dulu, bro. Karena sumber datanya dari admin. Jadi yang paling prioritas adalah:

> **Admin bisa login → input perusahaan → input lowongan → publish → baru tampil public.**

Dengan alur ini, development lebih rapi, minim bongkar ulang, dan lebih cepat sampai MVP live.
