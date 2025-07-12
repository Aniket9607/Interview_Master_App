import 'package:flutter/material.dart';
import 'quiz/quiz_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aptitude Quiz',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuizPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
