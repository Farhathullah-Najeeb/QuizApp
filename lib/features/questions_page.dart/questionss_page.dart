// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zealosh/const/colours.dart';
import 'package:zealosh/features/home_page.dart/provider/question_provider.dart';
import 'package:zealosh/features/home_page.dart/view/home_page.dart';
import 'package:zealosh/features/questions_page.dart/provider/quiz_time_provider.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final quiz = Provider.of<QuizProvider>(context);
    final timerModel = Provider.of<TimerModelProvider>(context);

    return Consumer<QuizProvider>(
      builder: (context, model, child) {
        return Scaffold(
          body: quiz.isQuizFinished
              // || timerModel.quizOver
              ? Container(
                  height: height,
                  width: width,
                  color: kDGreenColor,
                  child: Center(
                    child: Container(
                      height: height / 1.7,
                      width: width / 1.1,
                      decoration: BoxDecoration(
                          color: backgroundcolor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 74,
                            width: 162,
                            child: Image(
                                image: AssetImage(
                                    "assets/stars-removebg-preview.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                              "You Have Been Succesfully",
                              style: GoogleFonts.lato(
                                color: kwhiteColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text("Completed This Section",
                              style: GoogleFonts.lato(
                                color: kwhiteColor,
                                fontSize: 14,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  quiz.totalScore.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.yellow.shade400,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "/10",
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text("Your Score",
                              style: GoogleFonts.lato(
                                color: kwhiteColor,
                                fontSize: 7,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 35,
                              width: 150,
                              decoration: const BoxDecoration(
                                  color: darkGreen,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                              child: TextButton(
                                onPressed: quiz.resetQuiz,
                                child: Text(
                                  "Play Again",
                                  style: GoogleFonts.lato(
                                    color: kwhiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 35,
                            width: 150,
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            child: TextButton(
                              onPressed: () {
                                timerModel.resetTimer();
                                quiz.resetQuiz;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return const HomePage();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Back Home",
                                style: GoogleFonts.lato(
                                  color: kwhiteColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Column(
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
                                  height: 30,
                                ),
                                Center(
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
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
                                            icon: const Icon(Icons
                                                .notifications_none_sharp)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Question ${model.questionIndex + 1}',
                                        style: GoogleFonts.lato(
                                          color: kwhiteColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Time Left",
                                              style: GoogleFonts.lato(
                                                color: kwhiteColor,
                                                fontSize: 9,
                                              ),
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
                                                child: Consumer<
                                                    TimerModelProvider>(
                                                  builder: (context,
                                                      timerProvider, child) {
                                                    final remainingTime =
                                                        timerProvider
                                                            .remainingTime;
                                                    return Text(
                                                      remainingTime.toString(),
                                                      style: GoogleFonts.lato(
                                                        color: kwhiteColor,
                                                        fontSize: 15,
                                                      ),
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
                                          "You Complete (${quizProvider.currentQuestionIndex + 1}0%)",
                                          style: GoogleFonts.lato(
                                            color: kwhiteColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ));
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      quiz.questions[quiz.questionIndex]
                                          ['questionText'],
                                      style: GoogleFonts.lato(
                                        fontSize: 17,
                                      ),
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
                                    onTap: () =>
                                        quiz.answerQuestion(answer['score']),
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
                                      child:
                                          Center(child: Text(answer['text'])),
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
        );
      },
    );
  }
}
