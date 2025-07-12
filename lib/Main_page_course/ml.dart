import 'package:flutter/material.dart';

class MachineLearningPage extends StatelessWidget {
  const MachineLearningPage({super.key});

  final List<Map<String, String>> qaList = const [
    {
      'question': 'What is Machine Learning?',
      'answer':
          'Machine learning is a subset of artificial intelligence that enables computers to learn from data and make decisions without being explicitly programmed.',
    },
    {
      'question': 'What are the types of Machine Learning?',
      'answer':
          'There are three main types: Supervised Learning, Unsupervised Learning, and Reinforcement Learning.',
    },
    {
      'question': 'What is Supervised Learning?',
      'answer':
          'Supervised learning involves training a model on a labeled dataset, where the input is mapped to the correct output.',
    },
    {
      'question': 'What is Unsupervised Learning?',
      'answer':
          'Unsupervised learning uses input data without labeled responses to find hidden patterns and intrinsic structures in the data.',
    },
    {
      'question': 'What is Reinforcement Learning?',
      'answer':
          'Reinforcement learning is a type of machine learning where an agent learns to make decisions by receiving rewards or penalties.',
    },
    {
      'question': 'What is Overfitting?',
      'answer':
          'Overfitting occurs when a model learns the training data too well, including noise and outliers, which reduces its performance on unseen data.',
    },
    {
      'question': 'What is Underfitting?',
      'answer':
          'Underfitting happens when a model is too simple to capture the underlying structure of the data, leading to poor performance on training and test data.',
    },
    {
      'question': 'How to prevent overfitting?',
      'answer':
          'Techniques to prevent overfitting include cross-validation, pruning, regularization, and using more training data.',
    },
    {
      'question':
          'What is the difference between classification and regression?',
      'answer':
          'Classification is used to predict categorical labels, whereas regression is used for predicting continuous values.',
    },
    {
      'question': 'What is a confusion matrix?',
      'answer':
          'A confusion matrix is a performance measurement tool for classification problems, showing true positives, true negatives, false positives, and false negatives.',
    },
    // Auto-generated filler questions to reach 50 total
    {
      'question': 'What is Machine Learning concept 11?',
      'answer':
          'Detailed explanation of concept 11 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 12?',
      'answer':
          'Detailed explanation of concept 12 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 13?',
      'answer':
          'Detailed explanation of concept 13 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 14?',
      'answer':
          'Detailed explanation of concept 14 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 15?',
      'answer':
          'Detailed explanation of concept 15 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 16?',
      'answer':
          'Detailed explanation of concept 16 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 17?',
      'answer':
          'Detailed explanation of concept 17 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 18?',
      'answer':
          'Detailed explanation of concept 18 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 19?',
      'answer':
          'Detailed explanation of concept 19 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 20?',
      'answer':
          'Detailed explanation of concept 20 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 21?',
      'answer':
          'Detailed explanation of concept 21 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 22?',
      'answer':
          'Detailed explanation of concept 22 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 23?',
      'answer':
          'Detailed explanation of concept 23 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 24?',
      'answer':
          'Detailed explanation of concept 24 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 25?',
      'answer':
          'Detailed explanation of concept 25 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 26?',
      'answer':
          'Detailed explanation of concept 26 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 27?',
      'answer':
          'Detailed explanation of concept 27 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 28?',
      'answer':
          'Detailed explanation of concept 28 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 29?',
      'answer':
          'Detailed explanation of concept 29 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 30?',
      'answer':
          'Detailed explanation of concept 30 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 31?',
      'answer':
          'Detailed explanation of concept 31 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 32?',
      'answer':
          'Detailed explanation of concept 32 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 33?',
      'answer':
          'Detailed explanation of concept 33 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 34?',
      'answer':
          'Detailed explanation of concept 34 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 35?',
      'answer':
          'Detailed explanation of concept 35 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 36?',
      'answer':
          'Detailed explanation of concept 36 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 37?',
      'answer':
          'Detailed explanation of concept 37 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 38?',
      'answer':
          'Detailed explanation of concept 38 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 39?',
      'answer':
          'Detailed explanation of concept 39 in the context of machine learning.',
    },
    {'question': 'my name anu', 'answer': 'Detailed anu.'},
    {
      'question': 'What is Machine Learning concept 41?',
      'answer':
          'Detailed explanation of concept 41 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 42?',
      'answer':
          'Detailed explanation of concept 42 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 43?',
      'answer':
          'Detailed explanation of concept 43 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 44?',
      'answer':
          'Detailed explanation of concept 44 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 45?',
      'answer':
          'Detailed explanation of concept 45 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 46?',
      'answer':
          'Detailed explanation of concept 46 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 47?',
      'answer':
          'Detailed explanation of concept 47 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 48?',
      'answer':
          'Detailed explanation of concept 48 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 49?',
      'answer':
          'Detailed explanation of concept 49 in the context of machine learning.',
    },
    {
      'question': 'What is Machine Learning concept 50?',
      'answer':
          'Detailed explanation of concept 50 in the context of machine learning.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Machine Learning Questions')),
      body: ListView.builder(
        itemCount: qaList.length,
        itemBuilder: (context, index) {
          final qa = qaList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                title: Text(
                  qa['question'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      qa['answer'] ?? '',
                      style: const TextStyle(fontSize: 16),
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
