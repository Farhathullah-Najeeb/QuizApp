// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zealosh/const/colours.dart';
import 'package:zealosh/features/home_page/provider/question_provider.dart';
import 'package:zealosh/features/home_page/view/home_page.dart';
import 'package:zealosh/features/questions_page/provider/quiz_time_provider.dart';
import 'package:zealosh/features/result_page/result_page.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
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
                      margin: const EdgeInsets.only(bottom: 350.0),
                      alignment: Alignment.topCenter,
                      height: 290.0,
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
                                      icon: const Icon(
                                        Icons.menu,
                                        color: Colors.grey,
                                        size: 18,
                                      )),
                                  Image.asset(
                                    "assets/logo.jpg",
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        exitScreenPopup(context);
                                      },
                                      icon: const Icon(
                                        Icons.exit_to_app_rounded,
                                        color: Colors.grey,
                                        size: 18,
                                      )),
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
                                      'Question ${quizProvider.questionIndex}',
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
                                              BorderRadius.circular(5),
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
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: SizedBox(
                                              width: 300,
                                              height: 10,
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                child: LinearProgressIndicator(
                                                  value: provider.getProgress(),
                                                  valueColor:
                                                      const AlwaysStoppedAnimation<
                                                          Color>(darkGreen),
                                                  backgroundColor:
                                                      const Color(0xffD6D6D6),
                                                ),
                                              ),
                                            ),
                                          )
                                      //     LinearPercentIndicator(
                                      //   width: MediaQuery.of(context).size.width -
                                      //       23,
                                      //   animation: true,
                                      //   lineHeight: 10.0,
                                      //   animationDuration: 1,
                                      //   percent: provider.getProgress(),
                                      //   // center: Text(
                                      //   //     "${(provider.getProgress() * 100).toStringAsFixed(1)}%"),
                                      //   linearStrokeCap: LinearStrokeCap.roundAll,

                                      //   progressColor: darkGreen,
                                      // ),
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
                      child: Container(
                          width: 400.0,
                          height: 500,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 25.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade700,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 13, top: 10),
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
                                        height: height / 9,
                                        width: width / 1.2,
                                        child: Text(
                                          quiz.questions[quiz.questionIndex]
                                              ['questionText'],
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 13, bottom: 10),
                                      child: InkWell(
                                        onTap: () {
                                          _showPopup(context);
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  width: width / 1,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 2,
                                          offset: const Offset(1, 3)),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20.0),
                                      ...(quiz.questions[quiz.questionIndex]
                                                  ['answers']
                                              as List<Map<String, dynamic>>)
                                          .map((answer) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () =>
                                                      quiz.answerQuestion(
                                                    score: answer['score'],
                                                    quizFinished: () {
                                                      Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ResultPage(),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  child: Container(
                                                    height: 40,
                                                    width: width / 1.3,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20)),
                                                        border: Border.all(
                                                          color: Colors.black,
                                                          width: 1.3,
                                                        )),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child:
                                                          Text(answer['text']),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  )),
                            ],
                          )),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      );
    });
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Explanation",
            style: TextStyle(
              color: kGreenColor,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            "During the construction of a stainless steel pressure vessel, the most toxic welding fume generated would likely be chromium fumes. Stainless steel typically contains chromium, and during the welding process, especially if it involves high temperatures or poor ventilation, chromium fumes can be released. Chromium fumes are known to be hazardous, particularly hexavalent chromium compounds, which can cause respiratory issues and are classified as carcinogenic. Therefore, proper ventilation, personal protective equipment, and adherence to safety guidelines are essential to mitigate the risks associated with welding fumes.",
            style: TextStyle(fontSize: 12),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Container(
                height: 30,
                width: 80,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: const Center(
                  child: Text(
                    "Close",
                    style: TextStyle(
                      color: kwhiteColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void exitScreenPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              "Do You Want To Exit",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Container(
                height: 30,
                width: 80,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: const Center(
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: kwhiteColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Consumer<QuizProvider>(
              builder: (_, ref, __) {
                return Consumer<TimerModelProvider>(
                  builder: (_, ref1, __) {
                    return TextButton(
                      onPressed: () {
                        ref1.resetTimer();
                        ref.resetQuiz();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const HomePage();
                            },
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 80,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: const Center(
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              color: kwhiteColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
