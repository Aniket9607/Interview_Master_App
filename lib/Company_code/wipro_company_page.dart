import 'package:flutter/material.dart';

class WiproCompanyPage extends StatelessWidget {
  const WiproCompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question':
          'Explain the difference between an abstract class and interface in Java.',
      'answer':
          'An abstract class can have both abstract and concrete methods, while interfaces can only have abstract methods (prior to Java 8). Interfaces are used for full abstraction.',
    },
    {
      'question': 'What is SDLC and its phases?',
      'answer':
          'SDLC stands for Software Development Life Cycle. Phases include: Requirement Gathering, Design, Development, Testing, Deployment, and Maintenance.',
    },
    {
      'question': 'What is normalization in DBMS?',
      'answer':
          'Normalization is the process of organizing data to reduce redundancy. Common normal forms are 1NF, 2NF, 3NF, and BCNF.',
    },
    {
      'question': 'What is the use of a constructor in OOP?',
      'answer':
          'A constructor is used to initialize objects in object-oriented programming. It sets initial values for object attributes.',
    },
    {
      'question': 'Explain the concept of exception handling.',
      'answer':
          'Exception handling is a mechanism to handle runtime errors using try, catch, throw, and finally blocks.',
    },
    {
      'question': 'What is the difference between == and equals() in Java?',
      'answer':
          '== compares object references, while equals() compares the values inside the objects.',
    },
    {
      'question': 'Explain Agile methodology.',
      'answer':
          'Agile is an iterative approach to software development that emphasizes flexibility, customer collaboration, and rapid delivery.',
    },
    {
      'question': 'What is the difference between stack and queue?',
      'answer':
          'Stack uses LIFO (Last In First Out), while queue uses FIFO (First In First Out) for data management.',
    },
    {
      'question': 'What is a linked list?',
      'answer':
          'A linked list is a linear data structure where elements are stored in nodes, with each node pointing to the next.',
    },
    {
      'question': 'What are the access modifiers in Java?',
      'answer':
          'Access modifiers in Java include: public, private, protected, and default. They control visibility of class members.',
    },
    {
      'question': 'What is a primary key in a database?',
      'answer':
          'A primary key uniquely identifies each record in a table and cannot contain null or duplicate values.',
    },
    {
      'question': 'Why do you want to join Wipro?',
      'answer':
          'Wipro is a global leader in technology services. I am impressed by its innovation, work culture, and global exposure.',
    },
    {
      'question': 'Describe a situation where you solved a technical problem.',
      'answer':
          'Use the STAR method: explain the Situation, Task, Action, and Result. Focus on your contribution and outcome.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wipro Interview Q&A"),
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
                  Text(qa['answer']!, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
