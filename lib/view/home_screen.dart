import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/view_provider.dart';
import 'package:quiz_app/utils/color.dart';
import 'package:quiz_app/utils/sample_data.dart';
import 'widgets/quiz_option_tiles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final provider = Provider.of<ViewProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text('Quiz Score : ${provider.quizScore}')),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question no : ${provider.questionNo}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text('Time Left : ${provider.seconds} seconds'),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                SampleData.quizQuestionList[provider.currentIndex].question
                    .toString(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Column(
                children: List.generate(
                  SampleData.quizQuestionList[provider.currentIndex].options.length,
                  (index) {
                    final option = SampleData.quizQuestionList[provider.currentIndex].options[index];
                    final isCorrect = index == SampleData.quizQuestionList[provider.currentIndex].answerIndex;
                    return TQuizOptionTiles(
                      option: option,
                      isCorrect: isCorrect,
                      isSelected: index == provider.selectedIndex,
                      onTap: () {
                         provider.updateSelectedIndex(index);
                        if (!isCorrect) {
                          provider.updateSelectedIndex(SampleData.quizQuestionList[provider.currentIndex].answerIndex);
                        } else {
                          provider.updateQuizScore();
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blackColor,
                    foregroundColor: whiteColor,
                  ),
                  onPressed: () {
                    if (provider.currentIndex == SampleData.quizQuestionList.length - 1) {
                      provider.showEndDialog(context);
                      provider.timer!.cancel();
                    } else {
                      provider.nextQuestion(context);
                    }
                  },
                  child:provider.currentIndex == SampleData.quizQuestionList.length-1 ? const Text('Submit') : const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
