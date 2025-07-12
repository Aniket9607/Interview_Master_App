import 'package:flutter/material.dart';

class HdfcBankPage extends StatelessWidget {
  const HdfcBankPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'What are the main functions of a commercial bank?',
      'answer':
          'The main functions include accepting deposits, providing loans and advances, credit creation, and offering various financial services.',
    },
    {
      'question': 'Explain the concept of KYC.',
      'answer':
          'KYC (Know Your Customer) is the process of verifying the identity of customers to prevent financial frauds such as money laundering.',
    },
    {
      'question': 'What is the difference between NEFT and RTGS?',
      'answer':
          'NEFT settles transactions in batches with no minimum limit, while RTGS settles transactions in real-time with a minimum limit of ₹2 lakh.',
    },
    {
      'question': 'What is CRR and SLR?',
      'answer':
          'CRR (Cash Reserve Ratio) is the percentage of total deposits banks must hold with the RBI. SLR (Statutory Liquidity Ratio) is the percentage banks must maintain in the form of gold, cash, or approved securities.',
    },
    {
      'question': 'How do you handle a customer complaint?',
      'answer':
          'Listen actively, stay calm, understand the issue, apologize sincerely, and offer a quick and effective resolution.',
    },
    {
      'question': 'What is a credit score and why is it important?',
      'answer':
          'A credit score is a number that represents a person’s creditworthiness. It influences loan approvals and interest rates.',
    },
    {
      'question': 'Differentiate between savings and current accounts.',
      'answer':
          'Savings accounts are meant for individuals with limited transactions and earn interest, while current accounts are for businesses with higher transaction limits and no interest.',
    },
    {
      'question': 'What are the types of loans offered by HDFC Bank?',
      'answer':
          'HDFC Bank offers personal loans, home loans, car loans, business loans, education loans, and gold loans.',
    },
    {
      'question': 'What is EMI and how is it calculated?',
      'answer':
          'EMI (Equated Monthly Installment) is a fixed payment made by a borrower to repay a loan. It includes both principal and interest.',
    },
    {
      'question': 'How would you handle pressure and meet sales targets?',
      'answer':
          'Stay focused, plan daily goals, prioritize high-potential leads, and stay motivated by tracking progress and results.',
    },
    {
      'question': 'What is the role of RBI in the banking sector?',
      'answer':
          'The Reserve Bank of India regulates banks, controls monetary policy, issues currency, and ensures financial stability.',
    },
    {
      'question': 'Why do you want to work at HDFC Bank?',
      'answer':
          'HDFC Bank is known for innovation, customer focus, and career growth. I want to contribute to a reputed and dynamic institution.',
    },
    {
      'question': 'What are digital banking services offered by HDFC?',
      'answer':
          'Digital services include NetBanking, MobileBanking, UPI, BillPay, e-wallets, and online loan applications.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HDFC Bank Interview Q&A"),
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
