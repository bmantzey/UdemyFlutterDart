import 'package:advanced_basics/data/questions.dart';
import 'package:advanced_basics/questions_screen.dart';
import 'package:advanced_basics/start_screen.dart';
import 'package:advanced_basics/results_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
      setState(()  {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
      setState(()  {
        selectedAnswers.clear();
        activeScreen = 'questions-screen';
      });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, restartQuizButtonPressed: restartQuiz);
    }

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
          child: screenWidget,
        ),
      ),
    );
  }
}
