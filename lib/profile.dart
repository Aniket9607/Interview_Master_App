import 'dart:io';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project/NotificationPage/NotificationPage.dart';
import 'package:mini_project/controller/auth.dart';
import 'package:mini_project/controller/userController.dart';
import 'package:mini_project/signup_login_page/login_page.dart';
import 'package:mini_project/update_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;
  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> userdata = {};
  String? _userName = '';
  String? _email = '';
  String? _age = '';
  String? _location = '';
  String? _education = '';
  String? _experience = '';
  String? _publicId = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final fetchedData = await UserController().fetchUserData();

      if (fetchedData == null || fetchedData.isEmpty) {
        setState(() {
          _email = user?.email ?? '';
          _userName = 'User Name';
          _age = 'Not specified';
          _location = 'Not specified';
          _education = 'Not specified';
          _experience = 'Not specified';
          _publicId = '';
        });
        return;
      }

      setState(() {
        userdata = fetchedData;
        _email = fetchedData['email']?.toString() ?? user?.email ?? '';
        _userName = fetchedData['name']?.toString() ?? 'User Name';
        _age = fetchedData['age']?.toString() ?? 'Not specified';
        _location = fetchedData['location']?.toString() ?? 'Not specified';
        _education = fetchedData['education']?.toString() ?? 'Not specified';
        _experience = fetchedData['experience']?.toString() ?? 'Not specified';
        _publicId = fetchedData['profileImageUrl']?.toString() ?? '';
      });
    } catch (e) {
      setState(() {
        _email = user?.email ?? '';
        _userName = 'User Name';
        _age = 'Not specified';
        _location = 'Not specified';
        _education = 'Not specified';
        _experience = 'Not specified';
        _publicId = '';
      });
    }
  }

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => UpdateProfile(
                        currentName: _userName ?? '',
                        currentEmail: _email ?? '',
                        currentAge: _age ?? '',
                        currentLocation: _location ?? '',
                        currentEducation: _education ?? '',
                        currentExperience: _experience ?? '',
                        profileImage: _profileImage,
                      ),
                ),
              );
              _loadUserData();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            // Profile Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.grey[200],
                      child: ClipOval(
                        child: SizedBox(
                          width: 84,
                          height: 84,
                          child:
                              _publicId != null && _publicId!.isNotEmpty
                                  ? CldImageWidget(
                                    cloudinary: Cloudinary.fromStringUrl(
                                      'cloudinary://239522746823794:WmV9E5ig4IXx8ibZIWvd9NG-vtM@dbndeqfjo',
                                    ),
                                    publicId: _publicId!,
                                    width: 84,
                                    height: 84,
                                    fit: BoxFit.cover,
                                  )
                                  : Image.asset(
                                    'assets/interview.png',
                                    fit: BoxFit.cover,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _userName ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _email ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Expert - Level 4',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            _buildSectionHeader('Personal Information'),
            _buildInfoCard(Icons.person, 'Name', _userName ?? ''),
            _buildInfoCard(Icons.email, 'Email', _email ?? ''),
            _buildInfoCard(Icons.cake, 'Age', _age ?? ''),
            _buildInfoCard(Icons.location_on, 'Location', _location ?? ''),

            _buildSectionHeader('Professional Information'),
            _buildInfoCard(Icons.school, 'Education', _education ?? ''),
            _buildInfoCard(Icons.work, 'Experience', _experience ?? ''),

            _buildSectionHeader('Resume'),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Resume Upload Logic
              },
              icon: const Icon(Icons.upload_file),
              label: const Text('Upload Resume'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black87,
                elevation: 0,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),

            _buildSectionHeader('Settings'),
            _buildSettingOption(Icons.notifications, 'Notifications', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationPage()),
              );
            }),
            _buildSettingOption(Icons.wb_sunny, 'Theme', () {
              // TODO: Implement theme toggle
            }),

            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => _logout(context),
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildSettingOption(IconData icon, String title, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
