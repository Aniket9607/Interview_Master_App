import 'package:flutter/material.dart';

class GoogleCompanyPage extends StatelessWidget {
  const GoogleCompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'What is a Trie and how is it used?',
      'answer':
          'A Trie is a tree-like data structure used for storing strings, often used in autocomplete and spell-check features.',
    },
    {
      'question': 'How does garbage collection work in Java?',
      'answer':
          'It automatically deallocates memory used by unreachable objects. Algorithms include generational GC and mark-sweep.',
    },
    {
      'question': 'How would you design Google Search?',
      'answer':
          'Design involves crawling, indexing, ranking algorithms (like PageRank), caching, sharding, and distributed systems.',
    },
    {
      'question': 'What is Big-O notation and why is it important?',
      'answer':
          'Big-O notation describes the performance or complexity of an algorithm as the input size grows.',
    },
    {
      'question': 'Explain CAP Theorem.',
      'answer':
          'CAP Theorem states that a distributed system can achieve only two out of the following three: Consistency, Availability, Partition tolerance.',
    },
    {
      'question': 'What are strong and weak references in Java?',
      'answer':
          'Strong references prevent garbage collection. Weak references allow GC to reclaim the object even if it\'s still referenced.',
    },
    {
      'question': 'What is memoization?',
      'answer':
          'Memoization is a technique to speed up programs by storing the results of expensive function calls.',
    },
    {
      'question': 'How do you handle concurrency in Java?',
      'answer':
          'Using synchronized blocks, `ReentrantLock`, `volatile`, `Atomic` classes, and concurrent collections.',
    },
    {
      'question': 'What is the difference between process and thread?',
      'answer':
          'A process is an independent execution unit; a thread is a subset of a process that shares memory.',
    },
    {
      'question': 'Explain how DNS works.',
      'answer':
          'DNS translates domain names to IP addresses. It involves recursive and iterative queries through DNS resolvers and root servers.',
    },
    {
      'question': 'What is load balancing?',
      'answer':
          'Load balancing distributes traffic across multiple servers to ensure reliability and performance.',
    },
    {
      'question':
          'Describe a situation where you improved performance of a system.',
      'answer':
          'Example: Reduced response time by implementing caching layer and query optimizations in backend API.',
    },
    {
      'question': 'What are some principles of good software design?',
      'answer':
          'Principles include SOLID, DRY (Don\'t Repeat Yourself), KISS (Keep It Simple, Stupid), and modularity.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Interview Q&A"),
        backgroundColor: Colors.blue,
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
