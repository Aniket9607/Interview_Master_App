import 'package:flutter/material.dart';

class BehavioralPage extends StatelessWidget {
  const BehavioralPage({super.key});

  final List<Map<String, String>> qaList = const [
    {
      'question': 'Describe a time when you had to work under pressure.',
      'answer':
          'In my previous role, we had a tight deadline for a client project. I prioritized tasks, collaborated effectively with the team, and managed time efficiently to meet the deadline successfully.',
    },
    {
      'question': 'Tell me about a time you had a conflict with a coworker.',
      'answer':
          'I had a difference of opinion with a colleague on a project. I initiated a one-on-one discussion, listened to their perspective, and we agreed on a solution that combined both of our ideas.',
    },
    {
      'question': 'Describe a situation where you demonstrated leadership.',
      'answer':
          'When my team lead was unavailable, I took initiative to coordinate daily standups, ensured everyone stayed on track, and escalated issues early, resulting in on-time delivery.',
    },
    {
      'question': 'Tell me about a time you failed.',
      'answer':
          'I once missed a deadline due to poor estimation. I owned up to it, informed stakeholders, and adjusted my planning and time estimation techniques for future tasks.',
    },
    {
      'question': 'How do you handle constructive criticism?',
      'answer':
          'I welcome it as an opportunity to improve. I reflect on the feedback, ask for clarification if needed, and implement changes proactively.',
    },
    {
      'question': 'Describe a goal you set and how you achieved it.',
      'answer':
          'I aimed to improve my public speaking. I joined a local club, practiced regularly, and delivered a well-received presentation to a large audience within three months.',
    },
    {
      'question': 'Tell me about a time you went above and beyond.',
      'answer':
          'During a product launch, I voluntarily took on additional testing responsibilities to ensure a smooth release, which helped prevent major post-launch issues.',
    },
    {
      'question': 'How do you prioritize tasks when multitasking?',
      'answer':
          'I list tasks, assess deadlines and importance, and use time-blocking techniques to ensure high-priority tasks are completed efficiently.',
    },
    {
      'question': 'Have you ever had to learn a new skill quickly?',
      'answer':
          'Yes, I had to learn a new data visualization tool for a presentation. I followed tutorials and practiced during my off-hours, delivering a successful demo within a week.',
    },
    {
      'question': 'How do you handle ambiguity?',
      'answer':
          'I ask clarifying questions, break down the task into manageable parts, and seek feedback regularly to stay aligned.',
    },
    {
      'question': 'Tell me about a time you made a difficult decision.',
      'answer':
          'I had to choose between two competing priorities: client deadlines and internal improvements. I chose the client task first and scheduled the internal work for after delivery, which balanced both needs.',
    },
    {
      'question': 'Describe a time you had to adapt to change.',
      'answer':
          'When our company shifted to remote work, I quickly adjusted by setting up a home workspace, establishing routines, and maintaining team communication effectively.',
    },
    {
      'question': 'Give an example of when you worked as part of a team.',
      'answer':
          'In a group project, I contributed ideas, coordinated team meetings, and ensured we stayed on track. Our collaboration resulted in a successful outcome.',
    },
    {
      'question': 'How do you stay motivated during repetitive tasks?',
      'answer':
          'I set small milestones, take breaks, and remind myself of the bigger goal. Sometimes, I also automate parts of the process where possible.',
    },
    {
      'question': 'Have you ever had to work with a difficult manager?',
      'answer':
          'Yes, I focused on understanding their expectations, communicated clearly, and stayed professional. Over time, we built a better working relationship.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Behavioral Questions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
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
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: ExpansionTile(
                title: Text(
                  qa['question'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
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
