import 'package:flutter/material.dart';

class TeslaCompanyPage extends StatelessWidget {
  const TeslaCompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'How would you design an autonomous driving system?',
      'answer':
          'Design includes sensors (LiDAR, cameras), perception algorithms, decision-making using neural networks, and path planning with real-time updates.',
    },
    {
      'question': 'What are the challenges of battery management systems?',
      'answer':
          'Challenges include thermal management, state-of-charge estimation, cell balancing, and ensuring safety and long battery life.',
    },
    {
      'question':
          'Explain a project where you optimized a hardware or software system.',
      'answer':
          'Tesla looks for engineers who can show measurable improvements—use the STAR method to describe goals, actions, and quantifiable results.',
    },
    {
      'question': 'What is CAN Bus and how is it used in vehicles?',
      'answer':
          'CAN Bus is a communication protocol used in automotive to allow microcontrollers and sensors to communicate without a host computer.',
    },
    {
      'question':
          'What’s your take on Tesla’s mission and how do you contribute?',
      'answer':
          'Demonstrate your alignment with Tesla’s mission of sustainability, innovation, and willingness to work in a fast-paced, impact-driven culture.',
    },
    {
      'question': 'What is thermal runaway in batteries?',
      'answer':
          'It is a chain reaction within a battery causing rapid temperature rise, often leading to fire or explosion, and must be prevented via safety systems.',
    },
    {
      'question': 'Describe Model Predictive Control (MPC) and its use.',
      'answer':
          'MPC is an advanced control strategy that uses models to predict future states and optimize control actions, useful in vehicle dynamics and trajectory planning.',
    },
    {
      'question': 'How do you handle version control for embedded software?',
      'answer':
          'Use Git with branching strategies, tagged releases for firmware versions, and CI/CD pipelines for hardware-in-the-loop (HIL) testing.',
    },
    {
      'question': 'Explain regenerative braking.',
      'answer':
          'Regenerative braking recovers energy during deceleration by using the electric motor as a generator, recharging the battery.',
    },
    {
      'question': 'What testing methods ensure vehicle safety?',
      'answer':
          'Use unit testing, simulation, hardware-in-the-loop (HIL), real-world testing, and fail-safe validation for safety-critical systems.',
    },
    {
      'question': 'How would you handle cross-functional collaboration?',
      'answer':
          'At Tesla, you’ll work with diverse teams—communicate clearly, respect domain knowledge, and align on goals and timelines.',
    },
    {
      'question': 'What is OTA (Over-the-Air) update?',
      'answer':
          'OTA allows remote firmware/software updates to vehicles without requiring a service visit, improving functionality and security post-delivery.',
    },
    {
      'question':
          'How do you optimize performance in real-time embedded systems?',
      'answer':
          'Optimize with efficient code, minimize interrupts, prioritize tasks, reduce latency, and profile memory/CPU usage.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tesla Interview Q&A"),
        backgroundColor: Colors.redAccent,
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
