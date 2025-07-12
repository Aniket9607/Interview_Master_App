import 'package:flutter/material.dart';

class MicrosoftCompanyPage extends StatelessWidget {
  const MicrosoftCompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'Explain the difference between a process and a thread.',
      'answer':
          'A process is an independent program with its own memory space, while a thread is a subset of a process that shares memory with other threads.',
    },
    {
      'question': 'What is a deadlock? How can it be avoided?',
      'answer':
          'A deadlock occurs when two or more processes are waiting on each other to release resources. It can be avoided using resource ordering, avoiding hold-and-wait, or using a deadlock detection mechanism.',
    },
    {
      'question': 'Design a scalable file storage system like OneDrive.',
      'answer':
          'Use microservices, cloud storage (like Azure Blob Storage), metadata management, CDN for distribution, and consistent hashing for sharding.',
    },
    {
      'question': 'What is the difference between stack and heap memory?',
      'answer':
          'Stack memory is used for static memory allocation and function calls, while heap memory is used for dynamic memory allocation.',
    },
    {
      'question': 'How do hash tables work and what are collisions?',
      'answer':
          'Hash tables use a hash function to map keys to indices. Collisions occur when multiple keys hash to the same index and are handled by chaining or open addressing.',
    },
    {
      'question': 'What is the purpose of virtual memory?',
      'answer':
          'Virtual memory allows execution of processes that may not be completely in memory by using disk space to simulate extra RAM.',
    },
    {
      'question': 'Explain polymorphism in object-oriented programming.',
      'answer':
          'Polymorphism allows objects of different classes to be treated as objects of a common super class, often using method overriding.',
    },
    {
      'question': 'How does a database index improve performance?',
      'answer':
          'An index helps locate data without scanning every row in a table, significantly speeding up query execution.',
    },
    {
      'question': 'What is caching and why is it important?',
      'answer':
          'Caching stores frequently accessed data in memory for fast access, reducing latency and database load.',
    },
    {
      'question': 'How would you design a news feed system?',
      'answer':
          'Use fan-out on write or read, ranking algorithms, caching for hot feeds, and pagination or infinite scroll on the client.',
    },
    {
      'question': 'Explain the concept of eventual consistency.',
      'answer':
          'Eventual consistency means updates will propagate through the system eventually, and all nodes will become consistent over time.',
    },
    {
      'question': 'What is multithreading and where is it useful?',
      'answer':
          'Multithreading allows concurrent execution of tasks within a program, improving efficiency in I/O-bound or CPU-bound operations.',
    },
    {
      'question': 'What are some challenges in designing distributed systems?',
      'answer':
          'Challenges include fault tolerance, consistency, network latency, data replication, and coordination among nodes.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Microsoft Interview Q&A"),
        backgroundColor: Colors.indigo,
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
