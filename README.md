# 📱 Aplikasi Pertama Gua — Flutter

Aplikasi chat sederhana berbasis Flutter yang dibuat untuk belajar konsep dasar Flutter seperti ListView, navigasi antar halaman, dialog, search, dan FAB Speed Dial.

---

## ✨ Fitur

- 📋 **ListView Kontak** — menampilkan daftar kontak dengan foto, nama, pesan, dan waktu
- 🔍 **Search** — filter kontak by nama secara real-time
- 💬 **Alert Dialog** — muncul saat kontak di-tap, menampilkan detail kontak
- 🔐 **Login Page** — form email & password dengan validasi dan show/hide password
- ⚙️ **Settings Page** — toggle notifikasi dan dark mode
- ℹ️ **About Page** — informasi aplikasi dengan foto profil bulat
- ➕ **FAB Speed Dial** — tombol aksi mengambang dengan menu Video Call, Telepon, dan Kontak Baru

---

## 🗂️ Struktur Project

```
lib/
├── main.dart                  # Entry point + HomePage + SearchDelegate
├── data/
│   └── data.dart              # Data kontak (list)
├── login/
│   └── login.dart             # Login page
├── setting/
│   └── settings.dart          # Settings page
└── about/
    └── about.dart             # About page
```

---

## 📸 Halaman

| Halaman | Deskripsi |
|---|---|
| `HomePage` | Daftar kontak dengan AppBar dan FAB |
| `LoginPage` | Form login dengan validasi |
| `SettingsPage` | Pengaturan notifikasi & tema |
| `AboutPage` | Info aplikasi dengan foto profil |

---

## 🚀 Cara Menjalankan

### Prasyarat
- Flutter SDK (versi terbaru)
- Dart SDK
- Android Studio / VS Code
- Emulator atau device fisik

### Langkah

```bash
# 1. Clone repository
git clone https://github.com/username/aplikasi_pertama_gua.git

# 2. Masuk ke folder project
cd aplikasi_pertama_gua

# 3. Install dependencies
flutter pub get

# 4. Jalankan aplikasi
flutter run
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
```

> Aplikasi ini hanya menggunakan package bawaan Flutter, tidak ada package tambahan.

---

## 🧠 Konsep Flutter yang Dipelajari

- `StatelessWidget` vs `StatefulWidget`
- `Scaffold`, `AppBar`, `ListView.builder`
- `Navigator.push` untuk navigasi antar halaman
- `showDialog` untuk Alert Dialog
- `showSearch` + `SearchDelegate` untuk fitur pencarian
- `AnimationController` + `AnimatedIcon` untuk FAB Speed Dial
- `CircleAvatar` + `NetworkImage` untuk foto bulat
- `ScaffoldMessenger.showSnackBar` untuk notifikasi singkat
- `TextEditingController` untuk input form

---

## 🌐 Sumber Gambar

Gambar placeholder menggunakan [Picsum Photos](https://picsum.photos) — layanan gambar random gratis.

```dart
NetworkImage('https://picsum.photos/seed/john/100')
```

---

## 👤 Author

**Nama Lo**  
📧 email@example.com  
🐙 [github.com/username](https://github.com/username)

---

## 📄 Lisensi

Project ini dibuat untuk keperluan belajar. Bebas digunakan dan dimodifikasi.