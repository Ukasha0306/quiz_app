import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/sample_data.dart';
import '../view/splash_screen.dart';

class ViewProvider extends ChangeNotifier {
  int quizScore = 0;
  int currentIndex = 0;
  int? selectedIndex;
  int questionNo = 1;
  int seconds = 10;
  Timer? timer;

  void startTimer(BuildContext context) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
      } else if (currentIndex == SampleData.quizQuestionList.length - 1) {
        showEndDialog(context);
        timer.cancel();
      } else {
        nextQuestion(context);
      }
      notifyListeners();
    });
  }

  void updateSelectedIndex(int newIndex) {
    selectedIndex = newIndex;

    notifyListeners();
  }

  void nextQuestion(BuildContext context) {
    currentIndex++;
    questionNo++;
    timer!.cancel();
    seconds = 10;
    startTimer(context);
    // for next question index not select
    selectedIndex = null;
    notifyListeners();
  }

  void questionNumber() {
    questionNo++;
    notifyListeners();
  }

  void updateQuizScore() {
    quizScore++;
    notifyListeners();
  }

  void resetQuiz() {
    quizScore = 0;
    currentIndex = 0;
    questionNo = 1;
    selectedIndex = null;
    timer!.cancel();
    notifyListeners();
  }

  void showEndDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('End of Quiz'),
        content: Text(
            'You have completed the quiz. Your score is $quizScore out of ${SampleData.quizQuestionList.length}.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              );
              resetQuiz();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
