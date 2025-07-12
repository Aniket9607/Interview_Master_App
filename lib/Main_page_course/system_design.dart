import 'package:flutter/material.dart';

class system_design extends StatelessWidget {
  const system_design({super.key});

  final List<Map<String, String>> qaList = const [
    {
      'question': 'What is System Design?',
      'answer':
          'System design is the process of defining the architecture, components, modules, interfaces, and data for a system to satisfy specified requirements.',
    },
    {
      'question':
          'What is the difference between High-Level Design (HLD) and Low-Level Design (LLD)?',
      'answer':
          'HLD gives an overview of the system, focusing on architecture and modules, while LLD deals with internal logic, algorithms, and component-level design.',
    },
    {
      'question': 'What is load balancing?',
      'answer':
          'Load balancing is the process of distributing network traffic across multiple servers to ensure no single server becomes a bottleneck.',
    },
    {
      'question': 'What is caching?',
      'answer':
          'Caching stores frequently accessed data in memory to reduce latency and load on the primary data store.',
    },
    {
      'question': 'What is sharding?',
      'answer':
          'Sharding is a database architecture pattern where a large database is divided into smaller, faster, and more easily managed parts called shards.',
    },
    {
      'question': 'What is a CDN?',
      'answer':
          'A Content Delivery Network (CDN) delivers static content from the nearest server to the user, improving latency and speed.',
    },
    {
      'question': 'How do you scale a system vertically and horizontally?',
      'answer':
          'Vertical scaling adds more power (CPU, RAM) to a single server, while horizontal scaling adds more servers to handle the load.',
    },
    {
      'question': 'What is a message queue?',
      'answer':
          'A message queue is an asynchronous communication service that decouples services and ensures reliable delivery of messages.',
    },
    {
      'question': 'What is a microservice?',
      'answer':
          'Microservices are an architectural style that structures an application as a collection of small, independent services that communicate over APIs.',
    },
    {
      'question': 'What is a monolithic architecture?',
      'answer':
          'Monolithic architecture is a software design where all components are interconnected and interdependent, running as a single unit.',
    },
    {
      'question': 'What is CAP Theorem?',
      'answer':
          'CAP Theorem states that a distributed system can achieve only two out of three: Consistency, Availability, and Partition Tolerance.',
    },
    {
      'question': 'What is eventual consistency?',
      'answer':
          'Eventual consistency means that all nodes in a distributed system will become consistent over time, rather than immediately.',
    },
    {
      'question': 'What is a proxy server?',
      'answer':
          'A proxy server is an intermediary between clients and servers that forwards requests, often used for caching, security, and anonymity.',
    },
    {
      'question': 'What is rate limiting?',
      'answer':
          'Rate limiting restricts the number of requests a user or client can make to a server within a specific time frame.',
    },
    {
      'question': 'How do you design a URL shortening service like bit.ly?',
      'answer':
          'Use a hash function to generate short URLs, store them in a database, and redirect requests to the original URLs using a lookup mechanism.',
    },
    {
      'question': 'What is a reverse proxy?',
      'answer':
          'A reverse proxy forwards client requests to backend servers and is often used for load balancing, security, and caching.',
    },
    {
      'question': 'What is database replication?',
      'answer':
          'Replication involves copying data from one database server to another for redundancy and increased availability.',
    },
    {
      'question': 'What is data partitioning?',
      'answer':
          'Data partitioning divides data across multiple databases or tables to improve performance and manageability.',
    },
    {
      'question': 'How would you design a scalable chat application?',
      'answer':
          'Use WebSockets for real-time messaging, sharded databases for scalability, and message queues for reliable delivery.',
    },
    {
      'question': 'What is the role of DNS in system design?',
      'answer':
          'DNS translates domain names to IP addresses, enabling users to access services using human-readable names.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'System Design Questions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: qaList.length,
        itemBuilder: (context, index) {
          final qa = qaList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 6.0,
            ),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ExpansionTile(
                title: Text(
                  qa['question'] ?? '',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      qa['answer'] ?? '',
                      style: const TextStyle(fontSize: 15),
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
