import 'package:flutter/material.dart';
import '../main.dart'; // Impor main.dart untuk akses fungsi toggle

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    // Cek state tema saat ini dari MyApp
    final themeMode = MyApp.of(context).currentThemeMode;

    // Tentukan apakah switch harus 'on'
    // 'on' jika mode Dark, atau jika mode System & HP-nya mode Dark
    final isDarkMode = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
      // Tambahkan AppBar agar terlihat rapi
      appBar: AppBar(
        title: const Text('Pengaturan'),
        elevation: 0,
        // Gunakan warna AppBar dari Tema
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      // Gunakan warna background dari Tema
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Baris untuk 'Mode Gelap'
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                // Gunakan warna surface container dari tema
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mode Gelap',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      // Panggil fungsi toggleTheme dari main.dart
                      MyApp.of(context).toggleTheme(value);
                    },
                    // Gunakan warna primary dari Tema
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
            // Anda bisa tambahkan item pengaturan lain di sini
          ],
        ),
      ),
    );
  }
}
