import 'package:flutter/material.dart';

class AppleCompanyPage extends StatelessWidget {
  const AppleCompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'What is memory management in iOS?',
      'answer':
          'Memory management in iOS is handled using ARC (Automatic Reference Counting), which automatically tracks and manages memory usage for objects in Swift and Objective-C.',
    },
    {
      'question': 'Explain MVC architecture.',
      'answer':
          'MVC stands for Model-View-Controller. It separates data (Model), UI (View), and control logic (Controller) to improve maintainability and scalability.',
    },
    {
      'question': 'What is the difference between frame and bounds in iOS?',
      'answer':
          'Frame is the view’s location and size in its superview’s coordinate system, while bounds is the internal coordinate system of the view itself.',
    },
    {
      'question':
          'What are Apple’s core values and how do they influence your work?',
      'answer':
          'Apple values innovation, simplicity, user-centric design, and privacy. These values influence software and hardware decisions at every level.',
    },
    {
      'question': 'How would you design a secure iOS app?',
      'answer':
          'Use Keychain for sensitive data, enable App Transport Security, avoid storing data in plain text, use biometrics (Face ID, Touch ID), and implement secure APIs.',
    },
    {
      'question': 'What is Grand Central Dispatch (GCD)?',
      'answer':
          'GCD is a low-level API for managing concurrent tasks in iOS. It helps in executing code asynchronously using queues.',
    },
    {
      'question': 'What is the difference between weak and unowned in Swift?',
      'answer':
          'Both are used to avoid retain cycles. `weak` is optional and can become nil; `unowned` is non-optional and expected to always have a value.',
    },
    {
      'question': 'How does lazy loading work in Swift?',
      'answer':
          'A `lazy` property is initialized only when it is first accessed, helping optimize memory and performance.',
    },
    {
      'question': 'What are Codable and Decodable in Swift?',
      'answer':
          '`Codable` is a type alias for `Encodable` and `Decodable`, allowing easy encoding/decoding of data to/from JSON.',
    },
    {
      'question': 'What is a retain cycle and how do you avoid it?',
      'answer':
          'A retain cycle occurs when two objects hold strong references to each other. Use `weak` or `unowned` references to break the cycle.',
    },
    {
      'question':
          'What is the difference between synchronous and asynchronous tasks?',
      'answer':
          'Synchronous tasks block the thread until completed, while asynchronous tasks run in the background, allowing other tasks to execute.',
    },
    {
      'question': 'Explain dependency injection in iOS.',
      'answer':
          'Dependency injection is a technique to provide objects their dependencies externally instead of creating them internally, improving testability and flexibility.',
    },
    {
      'question': 'How do you manage app lifecycle events in iOS?',
      'answer':
          'Use `AppDelegate` and `SceneDelegate` methods such as `applicationDidEnterBackground`, `applicationWillTerminate`, and `sceneDidBecomeActive` to handle lifecycle events.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apple Inc. Interview Q&A"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: questions.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final qa = questions[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    qa['question']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(qa['answer']!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
