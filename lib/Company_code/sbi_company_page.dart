import 'package:flutter/material.dart';

class SBICompanyPage extends StatelessWidget {
  const SBICompanyPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'What is the primary role of a bank?',
      'answer':
          'The primary role of a bank is to accept deposits from the public and lend money to individuals or institutions.',
    },
    {
      'question': 'What do you know about SBI?',
      'answer':
          'State Bank of India (SBI) is India\'s largest public sector bank. It was established in 1955 and is headquartered in Mumbai. It offers services like personal banking, corporate banking, insurance, and investment services.',
    },
    {
      'question': 'Explain the difference between NEFT and RTGS.',
      'answer':
          'NEFT is used for fund transfers in batches and is slower, while RTGS is real-time and used for high-value transactions (above ₹2 lakh).',
    },
    {
      'question': 'How would you handle a customer complaint at the bank?',
      'answer':
          'Listen carefully, stay calm and respectful, understand the issue, apologize if needed, and follow the bank’s grievance redressal process.',
    },
    {
      'question': 'What is KYC and why is it important?',
      'answer':
          'KYC stands for Know Your Customer. It involves verifying a customer\'s identity to prevent fraud, money laundering, and illegal activities.',
    },
    {
      'question': 'What is the role of the Reserve Bank of India (RBI)?',
      'answer':
          'RBI is India’s central bank. It regulates the issue and supply of the Indian currency and manages monetary policy to ensure financial stability.',
    },
    {
      'question':
          'What is the difference between a savings and a current account?',
      'answer':
          'Savings accounts are for individuals with interest benefits, while current accounts are for businesses with higher transaction needs and no interest.',
    },
    {
      'question': 'Why do you want to join SBI?',
      'answer':
          'SBI is a prestigious bank with nationwide presence, strong training programs, job security, and opportunities for career advancement.',
    },
    {
      'question': 'Explain the SBI YONO app.',
      'answer':
          'SBI YONO is a digital banking platform offering a range of services like fund transfers, shopping, investments, and account management from a single app.',
    },
    {
      'question':
          'What is a demand draft and how is it different from a cheque?',
      'answer':
          'A demand draft is prepaid and guaranteed by the bank, while a cheque is not prepaid and may bounce due to insufficient funds.',
    },
    {
      'question': 'How does SBI promote financial inclusion?',
      'answer':
          'SBI promotes financial inclusion through zero-balance accounts, Jan Dhan Yojana, rural banking, and doorstep banking services.',
    },
    {
      'question': 'What is meant by CRR and SLR?',
      'answer':
          'CRR is the percentage of bank deposits kept with the RBI in cash. SLR is the portion kept in approved securities like gold or government bonds.',
    },
    {
      'question': 'How do you prioritize tasks when under pressure?',
      'answer':
          'By assessing urgency and impact, making a task list, focusing on high-priority items, and staying calm and organized.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SBI Interview Q&A"),
        backgroundColor: Colors.green,
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
                  Text(qa['answer']!, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
