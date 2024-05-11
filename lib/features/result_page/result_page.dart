import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zealosh/const/colours.dart';
import 'package:zealosh/features/home_page/provider/question_provider.dart';
import 'package:zealosh/features/home_page/view/home_page.dart';
import 'package:zealosh/features/questions_page/provider/quiz_time_provider.dart';
import 'package:zealosh/features/questions_page/questions_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final quiz = Provider.of<QuizProvider>(context);
    final timerModel = Provider.of<TimerModelProvider>(context);

    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        timerModel.resetTimer();
        quiz.resetQuiz();
      },
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: kDGreenColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: width,
                color: kDGreenColor,
                child: Image.asset(
                  "assets/celebration-removebg-preview.png",
                  fit: BoxFit.fill,
                ),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              Container(
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
                          image:
                              AssetImage("assets/stars-removebg-preview.png")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        "You Have Been Succesfully",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      "Completed This Section",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
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
                          const Text(
                            "/10",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Text("Your Score",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 12,
                          // fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 35,
                        width: 150,
                        decoration: const BoxDecoration(
                            color: darkGreen,
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: TextButton(
                          onPressed: () {
                            timerModel.resetTimer();
                            quiz.resetQuiz();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QuizScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Play Again",
                            style: GoogleFonts.lato(
                              color: Colors.white,
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
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: TextButton(
                        onPressed: () {
                          timerModel.resetTimer();
                          quiz.resetQuiz();
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
                        child: Text(
                          "Back Home",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Container(
                height: 100,
                width: width,
                color: kDGreenColor,
                child: Image.asset(
                  "assets/celebration-removebg-preview.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
