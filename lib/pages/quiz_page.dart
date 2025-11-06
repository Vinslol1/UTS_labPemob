import 'package:flutter/material.dart';

// --- Model Data untuk Pertanyaan ---
class Question {
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswerIndex,
  });
}

// --- Widget Kuis ---
class Quiz extends StatelessWidget {
  final Question currentQuestion;
  final int currentQuestionIndex;
  final int totalQuestions;
  final Function(int) onAnswerSelected;

  const Quiz({
    super.key,
    required this.currentQuestion,
    required this.currentQuestionIndex,
    required this.totalQuestions,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis (Soal ${currentQuestionIndex + 1}/$totalQuestions)'),
        backgroundColor: Colors.transparent, // Samakan dengan home
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center( // Kita bungkus dengan Center
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // HAPUS: crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.questionText,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Gunakan Column untuk jawaban agar bisa diatur
              Column(
                // Ini akan membuat tombol-tombolnya memiliki lebar yang sama
                // tapi tidak selebar layar
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < currentQuestion.answers.length; i++)
                    Padding(
                      // Beri jarak antar tombol
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () => onAnswerSelected(i),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                          foregroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          // Atur lebar minimum agar rapi
                          minimumSize: const Size(250, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Bulat
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: Text(currentQuestion.answers[i]),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Widget Halaman Hasil ---
// (Tetap sama seperti sebelumnya)
class ResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onResetQuiz;

  const ResultPage({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.onResetQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Kuis'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Anda Benar!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '$score / $totalQuestions',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // 1. Reset kuis
                onResetQuiz();
                // 2. Tutup halaman ini (kembali ke navigation_widget)
                Navigator.pop(context);
              },
              child: const Text('Ulangi Kuis'),
            ),
          ],
        ),
      ),
    );
  }
}