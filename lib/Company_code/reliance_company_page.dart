import 'package:flutter/material.dart';

class RelianceCompanyPage extends StatelessWidget {
  const RelianceCompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'What are the key businesses under Reliance Industries?',
      'answer':
          'Reliance operates in petrochemicals, refining, oil and gas exploration, retail, telecommunications (Jio), and digital services.',
    },
    {
      'question':
          'Explain supply chain challenges in a retail giant like Reliance Retail.',
      'answer':
          'Challenges include inventory management, real-time demand prediction, vendor coordination, cold chain logistics, and distribution optimization.',
    },
    {
      'question': 'How would you improve customer experience for Jio users?',
      'answer':
          'Suggestions include improved network analytics, AI-based support, personalized offers, and real-time performance monitoring tools.',
    },
    {
      'question': 'What is your understanding of Reliance’s digital strategy?',
      'answer':
          'Reliance focuses on digital integration across business verticals including Jio platforms, e-commerce (JioMart), cloud, and fintech.',
    },
    {
      'question':
          'How would you handle project management in a large conglomerate like Reliance?',
      'answer':
          'Use agile and waterfall hybrids, stakeholder mapping, cross-functional team coordination, risk assessments, and clear KPI tracking.',
    },
    {
      'question': 'What is Jio Platforms and why is it significant?',
      'answer':
          'Jio Platforms consolidates digital apps, telecom, and tech services. It attracted major investments from Facebook, Google, and others, positioning Reliance as a digital powerhouse.',
    },
    {
      'question': 'What are the ESG initiatives by Reliance?',
      'answer':
          'Reliance focuses on net-zero carbon goals, renewable energy (solar, green hydrogen), and sustainable business practices in refining and retail.',
    },
    {
      'question':
          'How would you analyze customer data to improve JioMart sales?',
      'answer':
          'Use predictive analytics, segmentation, A/B testing, behavior analysis, and personalized recommendations to increase engagement and conversions.',
    },
    {
      'question':
          'What role does technology play in Reliance Retail operations?',
      'answer':
          'Technology is used for real-time inventory, supply chain automation, loyalty systems, CRM, and unified commerce platforms.',
    },
    {
      'question': 'Explain how 5G can impact Reliance Jio’s future.',
      'answer':
          '5G enables ultra-low latency, higher speeds, smart city connectivity, and supports IoT, AI, and enterprise solutions for Jio’s next growth phase.',
    },
    {
      'question':
          'Describe a situation where you managed a large, cross-functional project.',
      'answer':
          'Use the STAR method—describe goals, your actions, how you led multiple teams, overcame obstacles, and delivered measurable results.',
    },
    {
      'question': 'What do you know about Reliance’s green energy transition?',
      'answer':
          'Reliance is investing heavily in solar manufacturing, green hydrogen, and battery storage to achieve net-zero carbon emissions by 2035.',
    },
    {
      'question':
          'How would you ensure compliance and governance in a multinational operation?',
      'answer':
          'Implement SOPs, audit mechanisms, local regulatory tracking, compliance training, and centralized risk dashboards.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reliance Industries Q&A"),
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
