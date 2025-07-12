import 'package:flutter/material.dart';

class MetaCompanyPage extends StatelessWidget {
  const MetaCompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'Explain how to design a social media news feed.',
      'answer':
          'Design includes user timelines, ranking algorithm, real-time updates, caching, data models, sharding, and push notifications.',
    },
    {
      'question':
          'What is the difference between optimistic and pessimistic locking?',
      'answer':
          'Optimistic locking assumes minimal conflict and checks before committing. Pessimistic locking prevents access by locking records.',
    },
    {
      'question': 'How do you handle high concurrency in a distributed system?',
      'answer':
          'Use techniques like load balancing, caching, eventual consistency, message queues, and distributed locks.',
    },
    {
      'question': 'What is the significance of Big-O notation?',
      'answer':
          'Big-O describes the performance or complexity of an algorithm as input size grows, helping evaluate time and space efficiency.',
    },
    {
      'question':
          'How would you detect and resolve memory leaks in an Android app?',
      'answer':
          'Use tools like Android Profiler or LeakCanary to monitor heap memory. Avoid static references to contexts and use WeakReferences where needed.',
    },
    {
      'question': 'How does GraphQL differ from REST?',
      'answer':
          'GraphQL allows clients to request exactly the data they need, reducing over-fetching and under-fetching, unlike REST\'s fixed endpoints.',
    },
    {
      'question': 'What are some key design principles of React?',
      'answer':
          'React is built on component-based architecture, unidirectional data flow, virtual DOM, and declarative UI.',
    },
    {
      'question': 'What is sharding and how does it improve scalability?',
      'answer':
          'Sharding splits large databases into smaller parts (shards), improving read/write performance and horizontal scalability.',
    },
    {
      'question': 'Describe Meta’s approach to privacy by design.',
      'answer':
          'Privacy by design integrates privacy at every development stage, ensuring data minimization, transparency, and control for users.',
    },
    {
      'question': 'How do you ensure fault tolerance in a system?',
      'answer':
          'Implement redundancy, graceful degradation, retries, monitoring, backups, and fallback strategies.',
    },
    {
      'question': 'What is A/B testing and how does Meta use it?',
      'answer':
          'A/B testing compares two versions of a feature to determine which performs better, helping Meta make data-driven product decisions.',
    },
    {
      'question': 'What is eventual consistency in distributed systems?',
      'answer':
          'It means data updates will propagate to all nodes eventually, allowing temporary inconsistencies but ensuring final consistency.',
    },
    {
      'question': 'How do you prevent XSS attacks in web applications?',
      'answer':
          'Sanitize user input, use Content Security Policy (CSP), escape output, and avoid inline JavaScript.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meta Interview Q&A"),
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
