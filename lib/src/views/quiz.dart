import 'package:flutter/material.dart';
import '../controllers/questions_module.dart';
import 'result_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final QuizController _quizController = QuizController();
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;

  @override
  void initState() {
    super.initState();
    _quizController.shuffleAnswers();
  }

  void _checkAnswer() {
    setState(() {
      _quizController.checkAnswer(_currentQuestionIndex, _selectedAnswer!);
      _currentQuestionIndex++;
      _selectedAnswer = null;
    });

    if (_currentQuestionIndex >= _quizController.questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            correctQuestions: _quizController.getCorrectQuestions(),
            incorrectQuestions: _quizController.getIncorrectQuestions(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {


    final currentQuestionText = _quizController.getQuestionText(_currentQuestionIndex);
    final currentAnswers = _quizController.getAnswers(_currentQuestionIndex);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestionText,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ...currentAnswers.map((answer) {
              return RadioListTile<String>(
                title: Text(answer),
                value: answer,
                groupValue: _selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    _selectedAnswer = value;
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedAnswer == null ? null : _checkAnswer,
              child: Text('Next Question'),
            ),
          ],
        ),
      ),
    );
  }
}