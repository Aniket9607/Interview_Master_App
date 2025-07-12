import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/Main_page_course/Algorithms.dart';
import 'package:mini_project/controller/userController.dart';
import 'profile.dart';
import 'companies_page.dart';
import 'progress/progress_screen.dart';
import 'package:mini_project/NotificationPage/NotificationPage.dart';
import 'Main_page_course/ml.dart';
import 'Main_page_course/devops_page.dart';
import 'Main_page_course/system_design.dart';
import 'Main_page_course/data_structure.dart';
import 'Main_page_course/HRQuestions.dart';
import 'Main_page_course/Behavioral.dart';
import 'Main_page_course/ResumeTips.dart';
import 'quiz/quiz_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String publicId = '';
  int _notificationCount = 6;

  Future<void> _initData() async {
    final user = await UserController().fetchUserData();
    setState(() {
      publicId = user?['profileImageUrl'] ?? '';
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  void _openNotifications() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NotificationPage()),
    );
    setState(() {
      _notificationCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeContent(
        publicId: publicId,
        onNotificationTap: _openNotifications,
        notificationCount: _notificationCount,
      ),
      const CompaniesPage(),
      const ProgressScreen(),
      const ProfilePage(),
    ];

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Companies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: 'Progress',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final String publicId;
  final VoidCallback onNotificationTap;
  final int notificationCount;

  const HomeContent({
    super.key,
    required this.publicId,
    required this.onNotificationTap,
    required this.notificationCount,
  });

  final List<Map<String, dynamic>> categories = const [
    {'icon': Icons.memory, 'label': 'Machine Learning'},
    {'icon': Icons.cloud, 'label': 'DevOps'},
    {'icon': Icons.menu_book, 'label': 'Data Structures'},
    {'icon': Icons.code, 'label': 'Algorithms'},
    {'icon': Icons.dashboard_customize, 'label': 'System Design'},
    {'icon': Icons.chat, 'label': 'HR Questions'},
    {'icon': Icons.extension, 'label': 'Behavioral'},
    {'icon': Icons.description, 'label': 'Resume Tips'},
  ];

  void _handleCategoryTap(BuildContext context, String label) {
    final routes = {
      'Machine Learning': const MachineLearningPage(),
      'DevOps': const DevOpsPage(),
      'System Design': const system_design(),
      'Data Structures': const data_structure(),
      'Algorithms': const AlgorithmsPage(),
      'HR Questions': const HRQuestionsPage(),
      'Behavioral': const BehavioralPage(),
      'Resume Tips': const ResumeTipsPage(),
    };

    if (routes.containsKey(label)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => routes[label]!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 4.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: Transform.scale(
                    scale: 0.9,
                    child: const Icon(Icons.notifications_none),
                  ),
                  onPressed: onNotificationTap,
                ),
                if (notificationCount > 0)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '$notificationCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()),
                );
              },
              child:
                  publicId.isNotEmpty
                      ? CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey[300],
                        child: ClipOval(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: CldImageWidget(
                              cloudinary: Cloudinary.fromStringUrl(
                                'cloudinary://239522746823794:WmV9E5ig4IXx8ibZIWvd9NG-vtM@dbndeqfjo',
                              ),
                              publicId: publicId,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      : CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey[300],
                        child: ClipOval(
                          child: Image.asset(
                            'assets/interview.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ChallengeCard(),
            const SizedBox(height: 24),
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children:
                    categories.map((item) {
                      return GestureDetector(
                        onTap: () => _handleCategoryTap(context, item['label']),
                        child: CategoryCard(
                          icon: item['icon'],
                          label: item['label'],
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFCBC5F6), Color(0xFFD6D5F9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Challenge",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5A4FCF),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '"Describe a time you failed and what you learned from the experience."',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: const [
              ChallengeTag(label: 'Behavioral'),
              ChallengeTag(label: 'Medium'),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuizPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5A4FCF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Solve Now'),
            ),
          ),
        ],
      ),
    );
  }
}

class ChallengeTag extends StatelessWidget {
  final String label;
  const ChallengeTag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.indigo.shade100,
      labelStyle: const TextStyle(color: Colors.indigo),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: Colors.indigo),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
