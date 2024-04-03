import 'package:advanced_basics/questions_screen.dart';
import 'package:advanced_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 49, 5, 107),
                Color.fromARGB(255, 58, 3, 86)
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
