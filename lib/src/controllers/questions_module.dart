import 'dart:math';

class QuizQuestion {
  final String question;
  final List<String> answers;
  final String correctAnswer;
  bool isCorrect;

  QuizQuestion(this.question, this.answers, this.correctAnswer, {this.isCorrect = false});
}

class QuizController {
  final List<QuizQuestion> questions = [
    QuizQuestion(
      'What are the main building blocks of Flutter UIs?',
      [
        'Widgets',
        'Components',
        'Blocks',
        'Functions',
      ],
      'Widgets',
    ),
    QuizQuestion(
      'How are Flutter UIs built?',
      [
        'By combining widgets in code',
        'By combining widgets in a visual editor',
        'By defining widgets in config files',
        'By using XCode for iOS and Android Studio for Android',
      ],
      'By combining widgets in code',
    ),
    QuizQuestion(
      'What\'s the purpose of a StatefulWidget?',
      [
        'Update UI as data changes',
        'Update data as UI changes',
        'Ignore data changes',
        'Render UI that does not depend on data',
      ],
      'Update UI as data changes',
    ),
    QuizQuestion(
      'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      [
        'StatelessWidget',
        'StatefulWidget',
        'Both are equally good',
        'None of the above',
      ],
      'StatelessWidget',
    ),
    QuizQuestion(
      'What happens if you change data in a StatelessWidget?',
      [
        'The UI is not updated',
        'The UI is updated',
        'The closest StatefulWidget is updated',
        'Any nested StatefulWidgets are updated',
      ],
      'The UI is not updated',
    ),
    QuizQuestion(
      'How should you update data inside of StatefulWidgets?',
      [
        'By calling setState()',
        'By calling updateData()',
        'By calling updateUI()',
        'By calling updateState()',
      ],
      'By calling setState()',
    ),
  ];

  void shuffleAnswers() {
    for (var question in questions) {
      question.answers.shuffle(Random());
    }
  }

  void checkAnswer(int questionIndex, String userAnswer) {
    questions[questionIndex].isCorrect = questions[questionIndex].correctAnswer == userAnswer;
  }

  String getQuestionText(int questionIndex) {
    return questions[questionIndex].question;
  }

  List<String> getAnswers(int questionIndex) {
    return questions[questionIndex].answers;
  }

  List<QuizQuestion> getCorrectQuestions() {
    return questions.where((q) => q.isCorrect).toList();
  }

  List<QuizQuestion> getIncorrectQuestions() {
    return questions.where((q) => !q.isCorrect).toList();
  }
}