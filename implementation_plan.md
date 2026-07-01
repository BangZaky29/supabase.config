# Nuansa Legal Career Hub - MVP Implementation Plan

Berdasarkan dokumen `bluePrintPlanning.md` dan `blueprint-StepByStepDevelop.md`, ini adalah rencana implementasi langkah demi langkah untuk membangun sistem Loker Nuansa Legal. Sistem ini menggunakan **Next.js (App Router), React, TypeScript, Tailwind CSS**, dan **Supabase (PostgreSQL, Auth, Storage)**. 

Karena folder `nuansa-career` saat ini masih kosong, kita akan memulainya dari awal (Setup Project).

> [!NOTE]
> Sistem ini difokuskan pada **Admin-managed Job Board** di mana hanya Admin yang memiliki akses dashboard untuk menginput data Perusahaan dan Lowongan. Pelamar tidak memerlukan akun dan akan apply langsung melalui WhatsApp.

## Open Questions

> [!IMPORTANT]
> 1. Apakah Anda setuju untuk menginisialisasi project Next.js di dalam folder `C:\codingVibes\nuansasolution\.mainweb\lokerNuansaLegal-v2\nuansa-career`?
> 2. Kredensial Supabase sudah saya baca dari `supabaseSecret.md`. Apakah saya bisa langsung membuat tabel (skema) di database Supabase Anda melalui SQL query atau Prisma/Supabase Client nantinya?
> 3. Apakah kita bisa langsung memulai eksekusi **Phase 1** setelah Anda menyetujui plan ini?

---

## Urutan Eksekusi (Roadmap Pengerjaan)

Kita akan mengeksekusi project ini secara berurutan per fase, tidak melompat-lompat. 

### Phase 1 — Fondasi Project (Akan Dikerjakan Pertama)
1. **Setup Project**: Inisialisasi Next.js App Router, Tailwind CSS, struktur folder yang rapi (`app/`, `components/`, `lib/`, `types/`), dan environment variables (`.env.local`).
2. **Setup Supabase**: Konfigurasi koneksi Next.js ke Supabase menggunakan `@supabase/supabase-js` dan `@supabase/ssr`. Membuat tabel utama (`admin_users`, `companies`, `job_categories`, `jobs`, `job_apply_clicks`, `admin_logs`).
3. **Setup Auth Admin**: Membuat halaman `/admin/login`, integrasi Supabase Auth (Email/Password), dan middleware untuk memproteksi rute `/admin/*` dan `/api/admin/*`.

### Phase 2 — Admin Dashboard Core
1. **Layout Admin**: Membuat Sidebar, Header, Overview Dashboard.
2. **CRUD Kategori**: Fitur tambah, edit, hapus, dan list kategori lowongan.
3. **CRUD Perusahaan**: Fitur kelola data perusahaan penyedia lowongan dan upload logo ke Supabase Storage.
4. **CRUD Lowongan**: Core utama sistem. Fitur untuk menginput, preview, publish, close, dan duplicate lowongan kerja beserta status (draft, published, closed, expired).

### Phase 3 — Public Loker UI
1. **List Loker (`/loker`)**: Halaman publik untuk melihat lowongan yang berstatus *published*. Terdapat fitur pencarian dan filter (kategori, lokasi).
2. **Detail Lowongan (`/loker/[slug]`)**: Menampilkan deskripsi pekerjaan, kualifikasi, benefit, dan peringatan anti-penipuan.
3. **Fitur Apply via WhatsApp**: Integrasi endpoint `/api/jobs/[slug]/apply` untuk mencatat metrik klik (apply clicks) sebelum me-redirect pelamar ke nomor WhatsApp HR/Perusahaan dengan template pesan otomatis.

### Phase 4 — Statistik & Admin Utility
1. **Statistik Dashboard**: Menampilkan total lowongan aktif, draft, closed, dan total klik apply di dashboard Admin.
2. **Admin Log**: Mencatat setiap aktivitas admin (tambah lowongan, edit perusahaan, dll) ke tabel `admin_logs`.

### Phase 5 s.d Phase 9 (Testing, Polishing & Deployment)
- Melakukan Testing flow (dari admin post loker sampai user apply).
- Polishing UI (Loading state, Error state, Empty state, Mobile Responsive).
- SEO Basic (Meta tags, Open Graph, Sitemap).
- Deployment ke Vercel/VPS dan Final QA.

---

## Verification Plan

Untuk **Phase 1**, verifikasi akan dilakukan dengan:
- Aplikasi Next.js berjalan lancar secara lokal ( `npm run dev` ).
- Tabel-tabel berhasil terbuat di database Supabase.
- Fitur Login Admin berfungsi dan Middleware berhasil memblokir akses jika user belum login atau bukan terdaftar di `admin_users`.


Open Questions : 
1. iyh langsung buatkan project next.js d folder tersebut 
2. gunakan SQL query an berikan kode sql ny supaya saya bisa langusng implementasikan manual d terminal sql supabase nya 
3. ok langsungexecute ke phase 1 dulu, dan berikut ny lanjut setelah saya izinkan lanjut ke pahe 2 dan seterus ny