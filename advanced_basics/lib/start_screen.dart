import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
              'assets/images/quiz-logo.png'),
              const SizedBox(height: 80),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(color: Colors.grey, fontSize: 24),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white
            ),
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
