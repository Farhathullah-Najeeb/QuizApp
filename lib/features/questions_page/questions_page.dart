// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:zealosh/const/colours.dart';
import 'package:zealosh/features/home_page/provider/question_provider.dart';
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
    final height = MediaQuery.of(context).size.height;

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
                      margin: const EdgeInsets.only(bottom: 80.0),
                      alignment: Alignment.topCenter,
                      height: 270.0,
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
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
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
                                                ("${remainingTime.toString()} Sec"),
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
                          Center(
                            child: Consumer<QuizProvider>(
                              builder: (context, quizProvider, child) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 12),
                                  child: Consumer<QuizProvider>(
                                    builder: (context, provider, child) =>
                                        LinearPercentIndicator(
                                      width: MediaQuery.of(context).size.width -
                                          23,
                                      animation: true,
                                      lineHeight: 10.0,
                                      animationDuration: 1,
                                      percent: provider.getProgress(),
                                      // center: Text(
                                      //     "${(provider.getProgress() * 100).toStringAsFixed(1)}%"),
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                      progressColor: darkGreen,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 160.0,
                      right: -10.0,
                      left: -10.0,
                      // bottom: 10,
                      child: Container(
                          width: 400.0,
                          height: 400,
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 25.0),
                          child: Container(
                            height: 300,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade700,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 13, top: 10),
                                  child: Text(
                                    "Questions",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Center(
                                  child: SizedBox(
                                    height: height / 7.5,
                                    width: width / 1.2,
                                    child: Text(
                                      quiz.questions[quiz.questionIndex]
                                          ['questionText'],
                                      style: const TextStyle(
                                          fontSize: 15.0, color: Colors.white),
                                      // textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Container(
                                    height: 20,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(
                                      child: Text(
                                        "Read Explanation",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                )
                              ],
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
                      )),
            ],
          ),
        ),
      );
    });
  }
}
