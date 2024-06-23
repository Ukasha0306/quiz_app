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

    return SafeArea(
      child: Scaffold(
        body: Consumer<ViewProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text('Quiz Score : ${value.quizScore}')),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Question no : ${value.questionNo}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text('Time Left : ${value.seconds} seconds'),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    SampleData.quizQuestionList[value.currentIndex].question
                        .toString(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Column(
                    children: List.generate(
                      SampleData
                          .quizQuestionList[value.currentIndex].options.length,
                      (index) {
                        final option = SampleData
                            .quizQuestionList[value.currentIndex]
                            .options[index];
                        final isCorrect = index ==
                            SampleData.quizQuestionList[value.currentIndex]
                                .answerIndex;
                        return TQuizOptionTiles(
                          option: option,
                          isCorrect: isCorrect,
                          isSelected: index == value.selectedIndex,
                          onTap: () {
                            value.updateSelectedIndex(index);
                            if (!isCorrect) {
                              value.updateSelectedIndex(SampleData
                                  .quizQuestionList[value.currentIndex]
                                  .answerIndex);
                            } else {
                              value.updateQuizScore();
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
                        if (value.currentIndex ==
                            SampleData.quizQuestionList.length - 1) {
                          value.showEndDialog(context);
                          value.timer!.cancel();
                        } else {
                          value.nextQuestion(context);
                        }
                      },
                      child: value.currentIndex ==
                              SampleData.quizQuestionList.length - 1
                          ? const Text('Submit')
                          : const Text('Next'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
