# AssetBox 

Aplikasi mobile interaktif untuk menampilkan dan mengelola katalog aset 3D (Furniture & Dev Assets) secara langsung dari genggaman. Proyek ini dikembangkan sebagai pemenuhan tugas Ujian Akhir Semester (UAS).

## Fitur Utama

* **Interactive 3D Viewer:** Memutar dan melihat detail model 3D (format `.glb` dan `.gltf`) secara langsung di dalam aplikasi.
* **Real-time Search Filter:** Pencarian katalog aset 3D yang cepat dan responsif berdasarkan nama.
* **Local Download:** Unduh langsung aset 3D ke penyimpanan internal perangkat (khusus Android) untuk digunakan lebih lanjut di perangkat lunak *3D modeling* atau *game engine*.
* **Clean & Adaptive UI:** Antarmuka yang modern, minimalis, dan mudah dinavigasi.

## Teknologi yang Digunakan

* **Framework:** [Flutter](https://flutter.dev/)
* **Language:** Dart
* **Key Packages:**
  * `model_viewer_plus` (Rendering 3D)
  * `dio` (HTTP Client untuk unduhan)
  * `path_provider` (Manajemen direktori lokal Android)

## Cara Menjalankan Aplikasi

1. Pastikan Flutter SDK sudah terinstal dengan baik di perangkatmu.
2. Clone repositori ini ke komputer lokal:
   ```bash
   git clone [https://github.com/fikimlro95-ops/AssetBox.git](https://github.com/fikimlro95-ops/AssetBox.git)