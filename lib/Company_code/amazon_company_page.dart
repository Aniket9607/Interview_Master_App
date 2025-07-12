import 'package:flutter/material.dart';

class AmazonCompanyPage extends StatelessWidget {
  const AmazonCompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'Explain CAP theorem.',
      'answer':
          'CAP theorem states that a distributed system can only satisfy two of the three: Consistency, Availability, Partition Tolerance.',
    },
    {
      'question': 'Describe a situation where you took a leadership role.',
      'answer':
          'Leadership principle-based behavioral questions are common at Amazon. Use STAR method to structure your answer.',
    },
    {
      'question': 'Design an Amazon Shopping Cart system.',
      'answer':
          'It includes inventory management, cart service, session management, caching, checkout service, and eventual consistency.',
    },
    {
      'question': 'What is eventual consistency?',
      'answer':
          'It means updates to a database will propagate eventually, so reads may not reflect the latest write immediately.',
    },
    {
      'question': 'How does DynamoDB ensure high availability?',
      'answer':
          'DynamoDB uses data replication, partitioning, and consistent hashing to ensure high availability and fault tolerance.',
    },
    {
      'question': 'Explain Amazon’s leadership principle "Customer Obsession".',
      'answer':
          'It means starting with the customer and working backward to earn and keep their trust.',
    },
    {
      'question': 'What is the difference between S3 and EBS?',
      'answer':
          'S3 is object storage used for scalable data storage, while EBS is block storage used with EC2 instances.',
    },
    {
      'question': 'How do you scale a service to support millions of users?',
      'answer':
          'Use load balancing, database sharding, caching (e.g. Redis), CDN, microservices, and horizontal scaling.',
    },
    {
      'question': 'How would you debug a slow microservice?',
      'answer':
          'Check logs, monitor metrics, use APM tools, identify bottlenecks, and analyze dependencies or thread contention.',
    },
    {
      'question': 'Describe a time you failed and what you learned.',
      'answer':
          'Amazon values learning from failures. Be honest, explain the situation using the STAR method, and focus on your growth.',
    },
    {
      'question': 'What is a deadlock and how can it be prevented?',
      'answer':
          'A deadlock is a situation where two or more processes wait indefinitely. Prevention techniques include resource ordering and timeout.',
    },
    {
      'question':
          'What’s the difference between horizontal and vertical scaling?',
      'answer':
          'Horizontal scaling adds more machines; vertical scaling increases resources (CPU, RAM) in a single machine.',
    },
    {
      'question': 'What is the STAR method in interviews?',
      'answer':
          'STAR stands for Situation, Task, Action, Result — a structured way to answer behavioral questions effectively.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Amazon Interview Q&A"),
        backgroundColor: Colors.orange,
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
