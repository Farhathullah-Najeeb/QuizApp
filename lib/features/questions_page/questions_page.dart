// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zealosh/const/colours.dart';
import 'package:zealosh/features/home_page/provider/question_provider.dart';
import 'package:zealosh/features/home_page/view/home_page.dart';
import 'package:zealosh/features/questions_page/provider/quiz_time_provider.dart';
import 'package:zealosh/features/result_page/result_page.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final quiz = Provider.of<QuizProvider>(context);

    return Consumer<TimerModelProvider>(builder: (context, timerModel, _) {
      if (timerModel.quizOver) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ResultPage()),
          );
        });
        timerModel.stopTimmer();
      }

      return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          timerModel.resetTimer();
          quiz.resetQuiz();
        },
        child: Scaffold(
          body: Column(
            children: [
              Column(children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      alignment: Alignment.topCenter,
                      height: 250.0,
                      decoration: const BoxDecoration(
                          color: backgroundcolor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(
                              25,
                            ),
                          )),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 28,
                          ),
                          Center(
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.menu)),
                                  Image.asset(
                                    "assets/logo.jpg",
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.notifications_none_sharp)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Consumer<QuizProvider>(
                                  builder: (context, quizProvider, child) {
                                    return Text(
                                      'Question ${quizProvider.questionIndex + 1}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    );
                                  },
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Time Left",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 9),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 20,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: Colors.black,
                                        ),
                                        child: Center(
                                          child: Consumer<TimerModelProvider>(
                                            builder: (context, timerProvider,
                                                child) {
                                              final remainingTime =
                                                  timerProvider.remainingTime;
                                              return Text(
                                                remainingTime.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Consumer<QuizProvider>(
                            builder: (context, quizProvider, child) {
                              return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                      "You Complete (${quizProvider.currentQuestionIndex + 1}0%)"));
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 175.0,
                      right: -10.0,
                      left: -10.0,
                      child: Container(
                          width: 400.0,
                          height: 400,
                          padding: const EdgeInsets.symmetric(
                              vertical: 45.0, horizontal: 60.0),
                          child: Container(
                            height: 300,
                            width: 350,
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                quiz.questions[quiz.questionIndex]
                                    ['questionText'],
                                style: const TextStyle(fontSize: 17.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ]),
              const SizedBox(height: 20.0),
              ...(quiz.questions[quiz.questionIndex]['answers']
                      as List<Map<String, dynamic>>)
                  .map((answer) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => quiz.answerQuestion(
                                score: answer['score'],
                                quizFinished: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ResultPage(),
                                    ),
                                  );
                                },
                              ),
                              child: Container(
                                height: 40,
                                width: width / 1.3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.3,
                                    )),
                                child: Center(child: Text(answer['text'])),
                              ),
                            ),
                          )
                      // ElevatedButton(
                      //       onPressed: () => quiz.answerQuestion(answer['score']),
                      //       child: Text(answer['text']),
                      //     )
                      ),
            ],
          ),
        ),
      );
    });
  }
}
