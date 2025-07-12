import 'package:flutter/material.dart';

class InfosysCompanyPage extends StatelessWidget {
  const InfosysCompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'What is SDLC and its phases?',
      'answer':
          'SDLC (Software Development Life Cycle) includes phases such as Requirements, Design, Implementation, Testing, Deployment, and Maintenance.',
    },
    {
      'question': 'Explain Object-Oriented Programming (OOP) principles.',
      'answer':
          'OOP is based on principles like Encapsulation, Inheritance, Polymorphism, and Abstraction.',
    },
    {
      'question': 'What are joins in SQL? Explain types.',
      'answer':
          'Joins are used to combine rows from two or more tables. Types include INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.',
    },
    {
      'question': 'How do you handle version control?',
      'answer':
          'Version control is managed using tools like Git. It helps in tracking changes, collaboration, and maintaining code history.',
    },
    {
      'question': 'What are Infosys core values?',
      'answer':
          'Infosys values include client value, integrity, fairness, leadership by example, and excellence.',
    },
    {
      'question': 'What is the difference between stack and queue?',
      'answer':
          'Stack follows LIFO (Last In First Out) while Queue follows FIFO (First In First Out) order for data management.',
    },
    {
      'question': 'Write a program to check if a number is prime.',
      'answer': '''
#include <stdio.h>

int main() {
    int num, i, flag = 0;
    printf("Enter a number: ");
    scanf("%d", &num);
    if (num <= 1) flag = 1;
    for (i = 2; i <= num / 2; i++) {
        if (num % i == 0) {
            flag = 1;
            break;
        }
    }
    if (flag == 0)
        printf("%d is a prime number.", num);
    else
        printf("%d is not a prime number.", num);
    return 0;
}
''',
    },
    {
      'question': 'What is normalization in DBMS?',
      'answer':
          'Normalization is the process of organizing data to eliminate redundancy and ensure data integrity.',
    },
    {
      'question': 'What are your strengths and weaknesses?',
      'answer':
          'Strengths: Adaptability, time management, quick learning. Weakness: Public speaking, which I am improving by attending workshops.',
    },
    {
      'question': 'Explain agile methodology.',
      'answer':
          'Agile is an iterative development methodology that emphasizes flexibility, customer collaboration, and continuous improvement.',
    },
    {
      'question': 'What is the difference between compiler and interpreter?',
      'answer':
          'A compiler translates the whole program at once, while an interpreter translates and executes line by line.',
    },
    {
      'question': 'Why do you want to join Infosys?',
      'answer':
          'Infosys offers structured training, strong global presence, and opportunities to grow in both technical and leadership roles.',
    },
    {
      'question': 'What is exception handling in Java?',
      'answer':
          'Exception handling in Java is managed using try-catch blocks to gracefully handle runtime errors.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infosys Interview Q&A"),
        backgroundColor: Colors.teal,
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      qa['answer']!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
