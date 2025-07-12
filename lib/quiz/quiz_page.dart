import 'dart:async';
import 'package:flutter/material.dart';
import '../progress/progress_tracker.dart';
import 'question.dart';
import 'quiz_questions.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int score = 0;
  int seconds = 30;
  Timer? timer;
  DateTime? quizStartTime;

  List<int?> selectedAnswers = List<int?>.filled(
    aptitudeQuestions.length,
    null,
  );

  void startTimer() {
    timer?.cancel();
    seconds = 30;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (seconds == 0) {
        moveToNext();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  void moveToNext() {
    timer?.cancel();
    if (currentIndex < aptitudeQuestions.length - 1) {
      setState(() {
        currentIndex++;
      });
      startTimer();
    } else {
      submitQuiz();
    }
  }

  void moveToPrevious() {
    timer?.cancel();
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      startTimer();
    }
  }

  void selectAnswer(int index) {
    setState(() {
      selectedAnswers[currentIndex] = index;
    });
  }

  void submitQuiz() {
    timer?.cancel();
    score = 0;
    for (int i = 0; i < aptitudeQuestions.length; i++) {
      if (selectedAnswers[i] == aptitudeQuestions[i].correctIndex) {
        score++;
      }
    }

    final timeSpent = DateTime.now().difference(quizStartTime!);

    // Update progress stats
    ProgressTracker().updateProgress(
      correctAnswers: score,
      totalQuestions: aptitudeQuestions.length,
      category: 'Aptitude', // Replace if dynamic
      sessionTime: timeSpent,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:
            (_) => ResultPage(
              score: score,
              total: aptitudeQuestions.length,
              selectedAnswers: [],
            ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    quizStartTime = DateTime.now();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = aptitudeQuestions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aptitude Quiz'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: seconds / 30,
              color: Colors.red,
              backgroundColor: Colors.red.shade100,
            ),
            const SizedBox(height: 12),
            Text(
              'Time Left: $seconds seconds',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Q${currentIndex + 1}: ${question.questionText}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ...List.generate(question.options.length, (index) {
              bool isSelected = selectedAnswers[currentIndex] == index;
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                color: isSelected ? Colors.indigo.shade100 : null,
                child: ListTile(
                  title: Text(question.options[index]),
                  trailing:
                      isSelected
                          ? const Icon(Icons.check_circle, color: Colors.indigo)
                          : null,
                  onTap: () => selectAnswer(index),
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentIndex > 0 ? moveToPrevious : null,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text("Back"),
                ),
                ElevatedButton(
                  onPressed:
                      selectedAnswers[currentIndex] != null ? moveToNext : null,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    currentIndex == aptitudeQuestions.length - 1
                        ? "Submit"
                        : "Next",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
