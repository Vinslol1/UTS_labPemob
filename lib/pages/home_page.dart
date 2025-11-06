import 'package:flutter/material.dart';
import '../main.dart'; // Impor main.dart untuk akses fungsi toggle
// Hapus import tema, karena kita akan gunakan Theme.of(context)

class HomePage extends StatelessWidget {
  // 1. Kita tetap terima counterValue agar widget navigasi tidak error
  //    Meskipun kita tidak akan menampilkannya lagi di sini.
  final int counterValue;

  // 2. BUAT SLOT BARU:
  //    Ini adalah "slot" untuk fungsi yang akan dijalankan
  //    saat tombol "Mulai Kuis" ditekan.
  final VoidCallback onStartQuiz;

  // 3. Perbarui constructor untuk menerima 'onStartQuiz'
  const HomePage({
    super.key,
    required this.counterValue,
    required this.onStartQuiz, // Tambahkan ini
  });

  @override
  Widget build(BuildContext context) {
    // --- Ambil status tema saat ini ---
    final themeMode = MyApp.of(context).currentThemeMode;
    final isDarkMode = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);
    // --- Selesai ---

    // 4. Kita bungkus dengan Scaffold untuk AppBar
    return Scaffold(
      // --- AppBar dengan tombol Switch ---
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Switch(
              value: isDarkMode,
              onChanged: (value) {
                MyApp.of(context).toggleTheme(value);
              },
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      // Setel background dari tema
      backgroundColor: Theme.of(context).colorScheme.background,

      // 5. Ganti UI lama (Center dengan counter) dengan UI baru
      //    Kita tetap pakai Center agar Column di tengah
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // Posisikan konten di tengah layar SECARA VERTIKAL
            mainAxisAlignment: MainAxisAlignment.center, // <-- DIPERBAIKI
            // Tidak ada crossAxisAlignment, agar tombol tidak stretch
            children: <Widget>[
              // --- Dekorasi ---
              Icon(
                Icons.school, // Ikon yang berhubungan dengan kuis/belajar
                size: 100,
                color: Theme.of(context).colorScheme.primary, // Gunakan warna tema
              ),
              const SizedBox(height: 24),

              // --- Teks Sambutan ---
              Text(
                'Selamat Datang di Kuis!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Uji pengetahuan Anda dengan menekan tombol di bawah ini.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // --- Tombol Mulai Kuis ---
              ElevatedButton(
                // 5. Panggil fungsi 'onStartQuiz' saat ditekan
                onPressed: onStartQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Tombol bulat
                  ),
                ),
                child: const Text('Mulai Kuis'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}