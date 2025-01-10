import 'dart:io';

class Question {
  final String text;
  final List<String> options;
  final int correctOption;

  Question(this.text, this.options, this.correctOption);
}

class Quiz {
  final List<Question> _questions;
  int _score = 0;

  Quiz(this._questions);

  void start() {
    print('Welcome to my Quiz App!\n');
    for (var i = 0; i < _questions.length; i++) {
      _askQuestion(i);
    }
    print('Quiz finished! Your score: $_score/${_questions.length}');
  }

  void _askQuestion(int index) {
    final question = _questions[index];
    print('Question ${index + 1}: ${question.text}');
    for (var i = 0; i < question.options.length; i++) {
      print('${i + 1}. ${question.options[i]}');
    }
    _getUserAnswer(question);
  }

  void _getUserAnswer(Question question) {
    stdout.write('Your answer: ');
    final input = stdin.readLineSync();
    final answer = int.tryParse(input ?? '');

    if (answer != null && answer >= 1 && answer <= 4) {
      if (answer == question.correctOption) {
        print('Correct!\n');
        _score++;
      } else {
        print('Wrong! The correct answer was: ${question.options[question.correctOption - 1]}\n');
      }
    } else {
      print('Invalid input. Please enter a number between 1 and 4.\n');
      _getUserAnswer(question);
    }
  }
}

void main() {
  final questions = [
    Question('What is the capital of France?', ['Berlin', 'Madrid', 'Paris', 'Lisbon'], 3),
    Question('What is 5 + 3?', ['5', '8', '10', '7'], 2),
    Question('Which language is used for Flutter development?', ['Python', 'Java', 'Dart', 'C++'], 3),
    Question('Which planet is known as the Red Planet?', ['Earth', 'Mars', 'Jupiter', 'Venus'], 2),
  ];

  final quiz = Quiz(questions);
  quiz.start();
}
