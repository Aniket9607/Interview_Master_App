import 'package:flutter/material.dart';

class TCSCompanyPage extends StatelessWidget {
  const TCSCompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'Tell me about yourself.',
      'answer':
          'Give a brief summary of your education, skills, internships, and achievements relevant to the role.',
    },
    {
      'question': 'What is the difference between C and C++?',
      'answer':
          'C is a procedural language, while C++ supports both procedural and object-oriented programming.',
    },
    {
      'question': 'Explain OOP concepts.',
      'answer':
          'OOP concepts include Encapsulation, Inheritance, Polymorphism, and Abstraction.',
    },
    {
      'question': 'What is SDLC?',
      'answer':
          'Software Development Life Cycle (SDLC) is a process used by the software industry to design, develop, and test high-quality software.',
    },
    {
      'question': 'Why do you want to join TCS?',
      'answer':
          'TCS is a leading global IT services company known for innovation, growth, and career development. I want to be part of a company that values learning and leadership.',
    },
    {
      'question': 'Write a program to reverse a string in C.',
      'answer': '''
#include <stdio.h>
#include <string.h>

int main() {
    char str[100], temp;
    int i, j;
    printf("Enter a string: ");
    gets(str);
    j = strlen(str) - 1;
    for (i = 0; i < j; i++, j--) {
        temp = str[i];
        str[i] = str[j];
        str[j] = temp;
    }
    printf("Reversed string: %s", str);
    return 0;
}
''',
    },
    {
      'question': 'What is normalization in databases?',
      'answer':
          'Normalization is the process of organizing data to reduce redundancy and improve data integrity in relational databases.',
    },
    {
      'question': 'Differentiate between primary key and foreign key.',
      'answer':
          'Primary key uniquely identifies a record in a table. Foreign key links two tables and refers to the primary key in another table.',
    },
    {
      'question': 'What is the use of the “static” keyword in C?',
      'answer':
          'The static keyword retains the value of a variable across function calls and restricts scope to the file or block.',
    },
    {
      'question': 'What are your strengths and weaknesses?',
      'answer':
          'Strengths: Quick learner, team player, problem-solving. Weakness: Initially shy but working on confidence through presentations.',
    },
    {
      'question': 'Explain the difference between malloc() and calloc().',
      'answer':
          'malloc() allocates uninitialized memory; calloc() allocates and initializes memory to zero.',
    },
    {
      'question': 'What is a pointer in C?',
      'answer':
          'A pointer is a variable that stores the memory address of another variable.',
    },
    {
      'question': 'What is recursion?',
      'answer':
          'Recursion is a programming technique where a function calls itself to solve smaller instances of the same problem.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TCS Interview Q&A"),
        backgroundColor: Colors.deepPurple,
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
