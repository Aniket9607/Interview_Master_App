import 'package:flutter/material.dart';

class ICICIBankPage extends StatelessWidget {
  const ICICIBankPage({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'Tell me about ICICI Bank.',
      'answer':
          'ICICI Bank is a leading private sector bank in India, offering a wide range of banking and financial services to corporate and retail customers.',
    },
    {
      'question': 'What do you know about the role of a probationary officer?',
      'answer':
          'A probationary officer (PO) is responsible for handling customer service, account management, loans, and supervising clerical tasks.',
    },
    {
      'question': 'How does digital banking impact the financial sector?',
      'answer':
          'Digital banking improves efficiency, reduces operational costs, enhances customer experience, and enables 24/7 service.',
    },
    {
      'question': 'Explain KYC and its importance.',
      'answer':
          'KYC (Know Your Customer) is the process of verifying a customer’s identity to prevent fraud, money laundering, and terrorism financing.',
    },
    {
      'question': 'What are the types of accounts offered by ICICI Bank?',
      'answer':
          'Savings Account, Current Account, Salary Account, NRI Account, and Fixed Deposit Accounts are some of the types offered.',
    },
    {
      'question': 'Why do you want to work at ICICI Bank?',
      'answer':
          'ICICI Bank is known for innovation, a strong reputation in the industry, and career growth opportunities. I am aligned with the bank’s vision and values.',
    },
    {
      'question': 'What is the UPI system and how does ICICI use it?',
      'answer':
          'UPI (Unified Payments Interface) enables instant fund transfers. ICICI offers UPI through its iMobile app for seamless digital payments.',
    },
    {
      'question': 'What is a non-performing asset (NPA)?',
      'answer':
          'An NPA is a loan or advance where the borrower has stopped making interest or principal payments for 90 days or more.',
    },
    {
      'question': 'How would you handle a difficult customer in a bank?',
      'answer':
          'Stay calm, listen actively, empathize, provide clear explanations, and ensure quick resolution or escalate when necessary.',
    },
    {
      'question': 'What do you understand by repo rate and reverse repo rate?',
      'answer':
          'Repo rate is the rate at which RBI lends money to banks. Reverse repo is the rate at which RBI borrows from banks.',
    },
    {
      'question': 'Describe the iMobile app by ICICI.',
      'answer':
          'iMobile is ICICI Bank’s mobile banking app offering services like fund transfers, bill payments, UPI, account management, and investment tools.',
    },
    {
      'question':
          'What is the difference between a debit card and a credit card?',
      'answer':
          'A debit card deducts money directly from your bank account, while a credit card allows you to borrow funds up to a limit.',
    },
    {
      'question': 'How does ICICI promote financial inclusion?',
      'answer':
          'Through initiatives like digital savings accounts, rural banking, self-service kiosks, and partnerships for affordable finance in underserved areas.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ICICI Bank Interview Q&A"),
        backgroundColor: Colors.teal,
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
