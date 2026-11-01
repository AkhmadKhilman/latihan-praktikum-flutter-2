## Riwayat Perubahan (Evolusi Kode)

Berikut adalah urutan pengembangan aplikasi dari _commit_ pertama hingga terakhir:

1. **Inisiasi Aplikasi (`feat: creating MaterialApp...`)**
   - Membuat struktur dasar `MyApp` menggunakan `MaterialApp`.
   - Menambahkan judul aplikasi dan menetapkan tema dasar.

2. **Pembuatan Halaman Utama (`feat: adding scaffold and appbar`)**
   - Menambahkan widget `Scaffold` sebagai kerangka halaman.
   - Membuat `AppBar` sederhana dengan judul "Profile Page".

3. **Penyesuaian Tema (`refactor: changing the app bar style...`)**
   - Mengaktifkan `useMaterial3: true` dan mengubah mode aplikasi menjadi `ThemeMode.dark`.
   - Menambahkan gaya (styling) pada teks di dalam `AppBar`.

4. **Penambahan Avatar (`feat: adding a body and profile avatar`)**
   - Menambahkan `SingleChildScrollView` untuk mencegah layar _overflow_.
   - Menambahkan `CircleAvatar` dengan ikon `Icons.person_3` sebagai foto profil pengguna.

5. **Injeksi Data Profil (`feat: create a profile data`)**
   - Mendeklarasikan variabel data dummy (nama, status/peran, dan daftar proyek) ke dalam kelas untuk ditampilkan ke layar nantinya.

6. **Perbaikan Tata Letak (`refactor: adjusting the column layout`)**
   - Membungkus komponen utama menggunakan `Column` dengan `MainAxisAlignment.center` agar elemen-elemen tersusun rapi secara vertikal di tengah layar.

7. **Menampilkan Nama & Status (`refactor: extract the profile username...` & `eextract profile status...`)**
   - Memasukkan variabel `name` dan `status` ke dalam widget `Text` sehingga muncul di bawah avatar profil.

8. **Tombol Edit Profil (`feat: create edit profile button...`)**
   - Menambahkan `ElevatedButton` bersimbol pensil (Edit).
   - Karena belum terhubung dengan fungsi edit sungguhan, ditambahkan `ScaffoldMessenger` (SnackBar) sebagai indikator bahwa tombol ditekan.

9. **Perombakan Skema Warna (`refactor: change color theme` & `fix: theme of content...`)**
   - Mengubah skema warna keseluruhan menjadi nuansa biru tua dan biru muda (`Color.fromRGBO`).
   - Memperbaiki warna teks dan _background_ pada SnackBar agar kontras dan mudah dibaca.

10. **Penambahan Statistik & Widget Kustom (`feat: adding informasion profile...`)**
    - Membuat desain _box_ melengkung (`Container` dengan `BoxDecoration`) untuk menampung data statistik pengguna.
    - Membuat widget modular/terpisah bernama `Stats` (sebelumnya `stats`) untuk menampilkan angka dan label (Projects, IPK, Skills) guna menghindari penulisan kode berulang.

11. **Migrasi ke StatefulWidget (`refactor: change class type from stateless...`)**
    - Mengubah kelas `ProfilePage` dari `StatelessWidget` menjadi `StatefulWidget`. Ini merupakan langkah krusial untuk mempersiapkan aplikasi agar nantinya bisa menerima pembaruan data secara dinamis (misalnya ketika fitur edit sudah berfungsi penuh).

12. **Menampilkan Daftar Proyek (`refactor: extrak data project to display apps`)**
    - Mengolah _array_ `projects` dan menampilkannya dalam bentuk daftar memanjang ke bawah.
    - Menggunakan `ListView.builder` yang dibungkus `Container` dengan properti `shrinkWrap: true` dan `NeverScrollableScrollPhysics` agar bisa menyatu dengan _scroll_ utama halaman.

13. **Tombol Kontak (`feat: adding contact me button...`)**
    - Menambahkan dua tombol baru di bagian paling bawah: "WhatsApp" (warna hijau) dan "Email" (warna merah).
    - Sama seperti tombol edit, tombol-tombol ini sementara akan memunculkan SnackBar ketika ditekan.

---

## Kode Final

Berikut adalah kode final aplikasi yang menggabungkan seluruh fitur dari riwayat _commit_ di atas dalam satu file:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Menu",
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(27, 54, 93, 1),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String name = "Akhmad Khilman Al Khafid";
  final String status = "Mahasiswa - Software Engineering";

  final List<String> projects = [
    "Nebulon - E-commerce application",
    "Jelajah Nusantara - Sales various modes of transport application",
    "Monk Notions - Recording summaries application, integrated with AI",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 90, 156, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(96, 193, 229, 1),
                  child: Icon(Icons.person_3, size: 30, color: Colors.black),
                ),
                const SizedBox(height: 15),
                Column(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      status,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 18),
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Fitur Edit belum dibuat",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Color.fromRGBO(0, 90, 156, 1),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text("Edit Profile"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(96, 193, 229, 1),
                        foregroundColor: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 21),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(160, 224, 239, 0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          stats(count: "3", label: "Projects"),
                          stats(count: "3.8", label: "IPK"),
                          stats(count: "5", label: "Skills"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(160, 224, 239, 0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Projects",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: const Icon(
                                  Icons.work,
                                  color: Color.fromRGBO(0, 90, 156, 1),
                                ),
                                title: Text(
                                  projects[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Contact Me:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Fitur WhatsApp belum dibuat",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Color.fromRGBO(0, 90, 156, 1),
                                ),
                              );
                            },
                            icon: const Icon(Icons.phone),
                            label: const Text("WhatsApp"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(72, 161, 17, 1),
                              foregroundColor: Colors.black,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Fitur Email belum dibuat",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Color.fromRGBO(0, 90, 156, 1),
                                ),
                              );
                            },
                            icon: const Icon(Icons.mail),
                            label: const Text("Email"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(225, 0, 0, 1),
                              foregroundColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget stats({required String count, required String label}) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
```
