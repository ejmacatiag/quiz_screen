import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.elapsedTime,
    required this.isTimeUp,
    required this.onPressed,
  }) : super(key: key);

  final int result;
  final int questionLength;
  final int elapsedTime;
  final bool isTimeUp;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(color: neutral, fontSize: 22.0),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(
              child: Text(
                '$result/$questionLength',
                style: const TextStyle(fontSize: 30.0),
              ),
              radius: 70.0,
              backgroundColor: result == 7
                  ? Colors.yellow // when the result is half of the questions
                  : result < 7
                      ? incorrect // when the result is less than half
                      : correct, // when the result is more than half
            ),
            const SizedBox(height: 20.0),
            Text(
              result == 7
                  ? 'Almost There' // when the result is half of the questions
                  : result < 7
                      ? 'Try Again ?' // when the result is less than half
                      : 'Great!', // when the result is more than half
              style: const TextStyle(color: neutral),
            ),
            if (isTimeUp) // Display time taken if time is up
              const SizedBox(height: 10.0),
              Text(
                'Time Taken: ${elapsedTime}s',
                style: const TextStyle(color: neutral),
              ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: onPressed,
              child: const Text(
                'Start Over',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
