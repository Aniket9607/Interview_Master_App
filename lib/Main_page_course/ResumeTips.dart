import 'package:flutter/material.dart';

class ResumeTipsPage extends StatelessWidget {
  const ResumeTipsPage({super.key});

  final List<Map<String, String>> qaList = const [
    {
      'question': 'What should be the ideal resume length?',
      'answer':
          'Ideally, one page for freshers and two pages for experienced professionals.',
    },
    {
      'question': 'What font and size should I use in a resume?',
      'answer':
          'Use professional fonts like Calibri, Arial, or Times New Roman with 10–12 pt size.',
    },
    {
      'question': 'Should I include a photo on my resume?',
      'answer':
          'Unless required by region or industry, avoid photos to focus on qualifications.',
    },
    {
      'question': 'What sections should be on a resume?',
      'answer':
          'Include: Contact Info, Summary, Skills, Work Experience, Education, Projects, Certifications.',
    },
    {
      'question': 'What are action words for resumes?',
      'answer':
          'Use strong verbs like "Led", "Developed", "Implemented", "Designed", "Achieved".',
    },
    {
      'question': 'How to tailor a resume for each job?',
      'answer':
          'Use keywords from the job description and align your skills and experiences accordingly.',
    },
    {
      'question': 'Should I include my GPA?',
      'answer':
          'Yes, if it is above 3.0 or equivalent. Otherwise, it’s optional.',
    },
    {
      'question': 'How to format work experience?',
      'answer':
          'Use reverse-chronological order. Highlight achievements with metrics if possible.',
    },
    {
      'question': 'What should be avoided in a resume?',
      'answer':
          'Avoid personal pronouns, long paragraphs, irrelevant experience, and spelling errors.',
    },
    {
      'question': 'What is a resume summary?',
      'answer':
          'A brief statement (2–3 lines) highlighting your background and what you bring to the table.',
    },
    {
      'question': 'Should I include hobbies and interests?',
      'answer':
          'Only if they’re relevant to the job or demonstrate transferable skills.',
    },
    {
      'question': 'What file format should I use to send a resume?',
      'answer':
          'PDF is the preferred format to preserve layout and formatting.',
    },
    {
      'question': 'Can I use color in my resume?',
      'answer': 'Yes, but keep it minimal and professional. Use neutral tones.',
    },
    {
      'question': 'How to showcase soft skills?',
      'answer':
          'Integrate soft skills into work achievements instead of listing them plainly.',
    },
    {
      'question': 'How important is proofreading?',
      'answer':
          'Extremely important. Typos and errors can lead to instant rejection.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resume Tips Questions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
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
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
                childrenPadding: const EdgeInsets.all(16.0),
                title: Text(
                  qa['question'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                children: [
                  Text(
                    qa['answer'] ?? '',
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
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
