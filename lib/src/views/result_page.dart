import 'package:flutter/material.dart';
import 'start_page.dart';
import '../controllers/questions_module.dart';

class ResultPage extends StatelessWidget {
  final List<QuizQuestion> correctQuestions;
  final List<QuizQuestion> incorrectQuestions;

  const ResultPage({
    super.key,
    required this.correctQuestions,
    required this.incorrectQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Correct Answers:',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            ...correctQuestions.map((question) {
              return ListTile(
                title: Text(question.question),
                subtitle: Text('Correct Answer: ${question.correctAnswer}'),
              );
            }).toList(),
            SizedBox(height: 20),
            Text(
              'Incorrect Answers:',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
            ...incorrectQuestions.map((question) {
              return ListTile(
                title: Text(question.question),
                subtitle: Text('Correct Answer: ${question.correctAnswer}'),
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => StartPage()),
                      (Route<dynamic> route) => false,
                );
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}