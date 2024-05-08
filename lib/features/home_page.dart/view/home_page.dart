import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zealosh/const/colours.dart';
import 'package:zealosh/features/home_page.dart/provider/question_provider.dart';
import 'package:zealosh/features/questions_page.dart/questionss_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context);
    // final timerModel = Provider.of<QuizTimerProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height / 2.6,
            decoration: const BoxDecoration(
                color: backgroundcolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.menu)),
                        Image.asset("assets/logo.jpg"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications_none_sharp)),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "ASP-CSP QuizMaster",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                          height: height / 5,
                          width: width / 1.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: darkGreen,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                      "assets/einsteen-removebg-preview.png"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      quiz.totalScore.toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow[400]),
                                    ),
                                    const Text(
                                      "Your Total Quiz",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          // quiz.dispose();
                                          // quiz.resetQuiz();
                                          // quiz.resetQuiz;
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const QuizScreen()),
                                          );
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: backgroundcolor,
                                            ),
                                            height: 20,
                                            width: 100,
                                            child: const Center(
                                              child: Text(
                                                "Start the quiz",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            )))
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    color: backgroundcolor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: const Icon(
                  Icons.person_2_outlined,
                  size: 22,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    color: backgroundcolor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: const Icon(
                  Icons.call_end_outlined,
                  size: 22,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
