// admin_manage_questions.dart
import 'package:flutter/material.dart';

class AdminManageQuestionsPage extends StatefulWidget {
  const AdminManageQuestionsPage({super.key});

  @override
  State<AdminManageQuestionsPage> createState() =>
      _AdminManageQuestionsPageState();
}

class _AdminManageQuestionsPageState extends State<AdminManageQuestionsPage> {
  String selectedCategory = 'Data Structures';
  final List<String> categories = [
    'Data Structures',
    'Algorithms',
    'System Design',
    'HR Questions',
    'Behavioral',
    'Resume Tips',
  ];

  final Map<String, List<String>> questions = {
    'Data Structures': ['What is a linked list?'],
    'Algorithms': ['Explain binary search.'],
    'System Design': ['How to design a URL shortener?'],
    'HR Questions': ['Tell me about yourself.'],
    'Behavioral': ['Describe a challenging situation.'],
    'Resume Tips': ['What to include in a resume?'],
  };

  final TextEditingController questionController = TextEditingController();

  void addQuestion() {
    if (questionController.text.isNotEmpty) {
      setState(() {
        questions[selectedCategory]!.add(questionController.text);
        questionController.clear();
      });
    }
  }

  void editQuestion(int index) {
    questionController.text = questions[selectedCategory]![index];
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Edit Question'),
            content: TextField(
              controller: questionController,
              decoration: const InputDecoration(labelText: 'Question'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    questions[selectedCategory]![index] =
                        questionController.text;
                    questionController.clear();
                  });
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  void deleteQuestion(int index) {
    setState(() {
      questions[selectedCategory]!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Questions')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              items:
                  categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: questionController,
              decoration: InputDecoration(
                labelText: 'Enter new question',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addQuestion,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Questions:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: questions[selectedCategory]!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(questions[selectedCategory]![index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => editQuestion(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => deleteQuestion(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
