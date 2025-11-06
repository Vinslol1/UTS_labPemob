import 'package:flutter/material.dart';
import 'package:tes/pages/home_page.dart';
// Impor 'quiz_page.dart' untuk class Question, Quiz, dan ResultPage
import 'package:tes/pages/quiz_page.dart';
// Ini untuk tab ke-3 Anda (Result)
import 'package:tes/pages/switch.dart';

class navigation_widget extends StatefulWidget {
  const navigation_widget({super.key});

  @override
  State<navigation_widget> createState() => _navigation_widgetState();
}

class _navigation_widgetState extends State<navigation_widget> {
  // State lama Anda
  int _counter = 0;
  int currentPageIndex = 0;

  // --- STATE KUIS DIMULAI (DIPERBARUI MENJADI 10 SOAL) ---
  final List<Question> _questions = [
    Question(
      questionText: 'Apa ibukota Indonesia?',
      answers: ['Jakarta', 'Bandung', 'Surabaya', 'Medan'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Siapa presiden pertama Indonesia?',
      answers: ['Soeharto', 'BJ. Habibie', 'Soekarno', 'Joko Widodo'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Flutter dikembangkan oleh...',
      answers: ['Apple', 'Microsoft', 'Google', 'Facebook'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Apa bahasa resmi Indonesia?',
      answers: ['Bahasa Jawa', 'Bahasa Sunda', 'Bahasa Indonesia', 'Bahasa Melayu'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Pulau terbesar di Indonesia adalah...',
      answers: ['Sumatra', 'Jawa', 'Kalimantan', 'Papua'],
      correctAnswerIndex: 2, // Secara teknis Papua, tapi Kalimantan juga besar
    ),
    Question(
      questionText: 'Gunung tertinggi di Indonesia adalah...',
      answers: ['Gunung Rinjani', 'Gunung Semeru', 'Gunung Kerinci', 'Puncak Jaya'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'Apa judul lagu kebangsaan Indonesia?',
      answers: ['Indonesia Raya', 'Garuda Pancasila', 'Maju Tak Gentar', 'Hari Merdeka'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Apa semboyan negara Indonesia?',
      answers: ['Pancasila', 'Tut Wuri Handayani', 'Bhinneka Tunggal Ika', 'Gotong Royong'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Kapan Hari Kemerdekaan Indonesia diperingati?',
      answers: ['17 Agustus 1945', '20 Mei 1908', '28 Oktober 1928', '1 Juni 1945'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Apa warna bendera Indonesia?',
      answers: ['Merah Biru', 'Merah Putih', 'Putih Merah', 'Hijau Kuning'],
      correctAnswerIndex: 1,
    ),
  ];
  int _currentQuestionIndex = 0;
  int _score = 0;
  // --- STATE KUIS SELESAI ---


  // --- LOGIKA KUIS DIMULAI (PINDAHAN DARI QUIZ_PAGE) ---
  void _answerQuestion(int selectedIndex) {
    // Cek jawaban hanya jika kuis masih berlangsung
    if (_currentQuestionIndex < _questions.length) {
      if (selectedIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
        _score++;
      }

      // Cek apakah ini pertanyaan terakhir
      if (_currentQuestionIndex < _questions.length - 1) {
        // Jika BUKAN terakhir, lanjut ke soal berikutnya
        setState(() {
          _currentQuestionIndex++;
        });
      } else {
        // Jika YA terakhir, tampilkan ResultPage sebagai halaman baru (pop-up)
        // Kita tidak mengubah tab, kita mendorong halaman baru
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              score: _score,
              totalQuestions: _questions.length,
              onResetQuiz: _resetQuiz, // Berikan fungsi reset
            ),
          ),
        );
      }
    }
  }

  // Fungsi untuk mereset kuis (dipanggil dari ResultPage)
  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      // Kembali ke tab Home (index 0) setelah kuis selesai
      currentPageIndex = 0;
    });
  }
  // --- LOGIKA KUIS SELESAI ---

  @override
  Widget build(BuildContext context) {

    // 3. Buat daftar "Isi" (diperbarui)
    final List<Widget> pages = [
      // Halaman 1: Home
      HomePage(
        counterValue: _counter,
        onStartQuiz: () {
          // Cek jika kuis sudah selesai, reset dulu
          if (_currentQuestionIndex >= _questions.length - 1) {
            _resetQuiz(); // Reset skor dan soal
          }
          setState(() {
            currentPageIndex = 1; // Pindah ke tab Kuis
          });
        },
      ),

      // Halaman 2: Quiz (TIDAK LAGI const)
      // Berikan state kuis ke widget Quiz
      Quiz(
        currentQuestion: _questions[_currentQuestionIndex],
        currentQuestionIndex: _currentQuestionIndex,
        totalQuestions: _questions.length,
        onAnswerSelected: _answerQuestion,
      ),

      // Halaman 3: Result (Tab ke-3 Anda)
      const Result(),
    ];

    // 4. Seluruh Scaffold tetap di sini
    return Scaffold(
      // 5. Body sekarang memanggil 'pages'
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.transparent,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Image.asset(
              'assets/images/Dashboard_logo.png',
              width: 24,
              height: 24,
              // HAPUS INI: color: const Color(0xFF137FEC),
            ),
            icon: Image.asset(
              'assets/images/Dashboard_logo.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Image.asset(
              'assets/images/My_Goal_Logo.png',
              width: 24,
              height: 24,
              // HAPUS INI: color: const Color(0xFF137FEC),
            ),
            icon: Image.asset(
              'assets/images/My_Goal_Logo.png',
              width: 24,
              height: 24,
            ),
            label: 'Quiz',
          ),
        ],
      ),
    );
  }
}