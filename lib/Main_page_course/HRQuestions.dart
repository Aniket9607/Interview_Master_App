import 'package:flutter/material.dart';

class HRQuestionsPage extends StatelessWidget {
  const HRQuestionsPage({super.key});

  final List<Map<String, String>> qaList = const [
    {
      'question': 'Tell me about yourself.',
      'answer':
          'Start with your name, education, and background. Highlight your achievements, work experience, and why you are a good fit for the role.',
    },
    {
      'question': 'What are your strengths?',
      'answer':
          'Include qualities like problem-solving, leadership, adaptability, communication, and provide examples.',
    },
    {
      'question': 'What are your weaknesses?',
      'answer':
          'Mention a real weakness and follow up with how you are working to improve it.',
    },
    {
      'question': 'Why should we hire you?',
      'answer':
          'Show how your skills, experience, and attitude align with the job requirements and company values.',
    },
    {
      'question': 'Where do you see yourself in 5 years?',
      'answer':
          'Talk about career goals that align with the role and how you plan to grow in the company.',
    },
    {
      'question': 'Why do you want to work here?',
      'answer':
          'Research the company and align its mission, culture, and work with your goals and values.',
    },
    {
      'question':
          'Tell me about a challenge you faced and how you overcame it.',
      'answer':
          'Use the STAR method (Situation, Task, Action, Result) to clearly explain the problem-solving process.',
    },
    {
      'question': 'What motivates you?',
      'answer':
          'Talk about learning, achievements, impact, or collaboration as motivators.',
    },
    {
      'question': 'How do you handle stress and pressure?',
      'answer':
          'Mention techniques like planning, time management, staying calm, or seeking help when needed.',
    },
    {
      'question': 'Are you a team player?',
      'answer':
          'Yes, and give an example of when you collaborated effectively in a team.',
    },
    {
      'question': 'What are your salary expectations?',
      'answer':
          'Answer based on research, or politely say you are open to discussion based on the company’s standards and your experience.',
    },
    {
      'question': 'Do you have any questions for us?',
      'answer':
          'Always say yes and ask meaningful questions about role expectations, team structure, or growth opportunities.',
    },
    {
      'question': 'Describe your ideal work environment.',
      'answer':
          'Mention values like open communication, supportive teams, and opportunities for growth.',
    },
    {
      'question': 'Have you ever disagreed with your manager?',
      'answer':
          'Yes, explain the situation respectfully, how you handled it professionally, and what you learned.',
    },
    {
      'question': 'What is your greatest professional achievement?',
      'answer':
          'Describe a specific accomplishment with measurable results using the STAR format.',
    },
    {
      'question': 'Why did you leave your last job?',
      'answer':
          'Be honest but positive. Avoid criticizing past employers. Focus on growth or new challenges.',
    },
    {
      'question': 'How do you prioritize your work?',
      'answer':
          'Discuss using task lists, deadlines, and urgency to organize your day effectively.',
    },
    {
      'question': 'How do you handle feedback?',
      'answer':
          'Say that you appreciate constructive feedback and use it to improve your performance.',
    },
    {
      'question': 'What is your work style?',
      'answer':
          'Mention traits like detail-oriented, collaborative, proactive, or independent depending on the role.',
    },
    {
      'question': 'What do you know about our company?',
      'answer':
          'Share research about the company’s mission, products, culture, and recent news or achievements.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HR Questions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
                borderRadius: BorderRadius.circular(14),
              ),
              child: ExpansionTile(
                title: Text(
                  qa['question'] ?? '',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
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
