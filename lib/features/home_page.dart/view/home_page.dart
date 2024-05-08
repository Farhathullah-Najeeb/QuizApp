// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:provider/provider.dart';
import 'package:zealosh/const/colours.dart';

import 'package:flutter/material.dart';
import 'package:zealosh/features/home_page.dart/provider/question_provider.dart';
import 'package:zealosh/features/questions_page.dart/questionss_page.dart';
import 'package:zealosh/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGreenColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: CustomAppBar(
            onPressed: () {},
            home_check: true,
          ),
        ),
        body: Container(
          color: kwhiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  color: kGreenColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: backgroundcolor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset("assets/about.png"),
                            ),
                          ),
                          const Text(
                            "About App",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: backgroundcolor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset("assets/condact.png"),
                          ),
                          const Text(
                            "Condact Us",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    "© All Rights Reserved By Zealosh",
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
