// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:zealosh/const/colours.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // final bool _showRedDot = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: backgroundcolor,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: AppBar(
                      elevation: 8.0,
                      shadowColor: const Color.fromARGB(255, 227, 227, 227),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      actions: <Widget>[
                        IconButton(
                          padding: const EdgeInsets.only(right: 30),
                          // iconSize: 20,
                          icon: const Icon(
                            Icons.notifications_none,
                            color: kBlackColor,
                          ),
                          onPressed: () {},
                        ),
                      ],
                      centerTitle: true,
                      title: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Image.asset("assets/logo.jpg"),
                      ),
                    ))),
            body: Container(
                height: MediaQuery.sizeOf(context).height,
                color: kwhiteColor,
                child: Stack(children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        width: MediaQuery.sizeOf(context).width,
                        decoration: const BoxDecoration(
                          color: kGreenColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
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
                  SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 130,
                              margin:
                                  const EdgeInsets.only(bottom: 30, top: 20),
                              decoration: const BoxDecoration(
                                  color: Color(0xFF44592A),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                    image: AssetImage("assets/aboutscreen.png"),
                                    fit: BoxFit.cover,
                                  )),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      "About Us",
                                      style: TextStyle(
                                        color: kwhiteColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //     height: 80,
                                  //     width: 100,
                                  //     child: Image.asset(
                                  //       "assets/about_page.png",
                                  //       fit: BoxFit.fill,
                                  //     ))
                                ],
                              ),
                            ),
                            const Text(
                              "Welcome to the Zealosh Training and Consultants' ASP and CSP Exam Prep App!Our app is meticulously designed to guide ASP and CSP candidates through their certification journey with ease and precision. With a comprehensive database containing solutions for over 5000 questions directly aligned with the ASP and CSP blueprints, learners can trust that they are studying the most relevant material.Each question in our app is thoughtfully crafted, taking into account the blueprint topics to ensure thorough coverage of key concepts. By practicing with our app, learners can sharpen their skills and boost their confidence, ultimately increasing their chances of success on the ASP and CSP exams.Join the countless professionals who have chosen Zealosh Training and Consultants' ASP and CSP Exam Prep App to achieve their certification goals. Let us help you ace your exams and advance your career!",
                              style: TextStyle(
                                color: kBlackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ])))
                ]))));
  }
}
