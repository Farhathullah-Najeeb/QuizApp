// import 'package:flutter/material.dart';

// class AnswerButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final bool isCorrect;
//   final bool isWrong;

//   const AnswerButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     required this.isCorrect,
//     required this.isWrong,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       child: InkWell(
//         onTap: onPressed,
//         child: Container(
//           decoration: BoxDecoration(
//               color: isCorrect
//                   ? Colors.green
//                   : isWrong
//                       ? Colors.red
//                       : Colors.white,
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20)),
//               border: Border.all(
//                 color: Colors.black,
//                 width: 1.3,
//               )),
//           child: Center(
//             child: Text(
//               text,
//               style: const TextStyle(color: Colors.black),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

