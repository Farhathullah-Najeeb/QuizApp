import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zealosh/const/colours.dart';
import 'package:zealosh/features/home_page/view/home_page.dart'; // Import your main screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kBlackColor, kwhiteColor, kGreenColor],
              tileMode: TileMode.repeated),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    height: 151.0,
                    child: Image.asset("assets/logo.jpg"),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // LinearPercentIndicator(
                      //   width: MediaQuery.of(context).size.width * .35,
                      //   lineHeight: 5.0,
                      //   percent: 0.6,
                      //   progressColor: kGreenColor,
                      //   barRadius: const Radius.circular(5),
                      // ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(50.0),
                child: Text(
                  "www.zealosh.com",
                  style: TextStyle(
                    color: kwhiteColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
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
