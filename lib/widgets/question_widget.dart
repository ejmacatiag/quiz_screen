import 'package:flutter/material.dart';
import '../constants.dart'; // it contains our colors.

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions})
      : super(key: key);
  // here we need the question title and the total number of questions, and also the index

  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Question ${indexAction + 1}/$totalQuestions',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blue, // Adjust the color as needed
            ),
          ),
          SizedBox(height: 10.0), // Add some space between the question counter and the question
          Text(
            question,
            style: const TextStyle(
              fontSize: 24.0,
              color: neutral,
            ),
          ),
        ],
      ),
    );
  }
}
