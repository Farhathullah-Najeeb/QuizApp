// ignore_for_file: file_nam
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onPressed,
    required this.home_check,
  });
  final VoidCallback onPressed;
  final bool home_check;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: AppBar(
        elevation: 8.0,
        shadowColor: const Color.fromARGB(255, 227, 227, 227),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 15),
          // iconSize: 18,
          icon: Icon(home_check ? Icons.menu : Icons.arrow_back_sharp),
          onPressed: onPressed,
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            // iconSize: 18,
            icon: const Icon(
              Icons.notifications_none,
            ),
            tooltip: 'notification',
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Image.asset("assets/logo.jpg"),
        ),
      ),
    );
  }
}
