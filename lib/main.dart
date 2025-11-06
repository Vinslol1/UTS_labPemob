import 'package:flutter/material.dart';
import 'package:tes/ReusableWidget/navigation_widget.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

// 1. Ubah dari StatelessWidget menjadi StatefulWidget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // 2. Buat "static helper" agar widget di bawahnya (seperti Result.dart)
  //    bisa memanggil fungsi di state ini
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

// 3. Buat class State-nya
class _MyAppState extends State<MyApp> {
  // 4. Simpan state theme mode di sini
  ThemeMode _themeMode = ThemeMode.system;

  // 5. Buat public getter agar Result.dart bisa cek mode saat ini
  ThemeMode get currentThemeMode => _themeMode;

  // 6. Buat fungsi untuk mengubah tema (ini akan dipanggil oleh Result.dart)
  void toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Tema saat mode terang
      darkTheme: AppTheme.darkTheme, // Tema saat mode gelap
      // 7. Gunakan state variable di sini
      themeMode: _themeMode,
      home: const navigation_widget(),
    );
  }
}