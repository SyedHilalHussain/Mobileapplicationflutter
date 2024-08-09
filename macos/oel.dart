import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_flutter.jpg'),
            Text(
              'Welcome to the Quiz App!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizPage()),
            );
          },
          child: Text('Start Quiz'),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswer;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': ['Paris', 'London', 'Berlin', 'Madrid'],
      'correct': 0,
    },
    {
      'question': 'What is 2 + 2?',
      'answers': ['3', '4', '5', '6'],
      'correct': 1,
    },
    {
      'question': 'What is 2 + 3?',
      'answers': ['3', '4', '5', '6'],
      'correct': 2,
    },
    {
      'question': 'What is 2 + 5?',
      'answers': ['3', '4', '7', '6'],
      'correct': 2,
    },
    {
      'question': 'What is 2 + 4?',
      'answers': ['3', '4', '5', '6'],
      'correct': 3,
    },
    // Add more questions here
  ];

  void _nextQuestion() {
    setState(() {
      if (_selectedAnswer != null) {
        if (_selectedAnswer == _questions[_currentQuestionIndex]['correct']) {
          _score++;
        }
        if (_currentQuestionIndex < _questions.length - 1) {
          _currentQuestionIndex++;
          _selectedAnswer = null;  // Reset selected answer for the next question
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ResultPage(score: _score)),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex]['question'];
    final answers = _questions[_currentQuestionIndex]['answers'] as List<String>;

    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question as String,
            style: TextStyle(fontSize: 24),
          ),
          ...answers.asMap().entries.map((entry) {
            int idx = entry.key;
            String answer = entry.value;
            return RadioListTile<int>(
              title: Text(answer),
              value: idx,
              groupValue: _selectedAnswer,
              onChanged: (int? value) {
                setState(() {
                  _selectedAnswer = value;
                });
              },
            );
          }).toList(),
          ElevatedButton(
            onPressed: _nextQuestion,
            child: Text('Next'),

          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;

  ResultPage({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You scored $score points!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
