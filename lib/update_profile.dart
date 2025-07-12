import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project/controller/auth.dart';
import 'package:mini_project/controller/userController.dart';

class UpdateProfile extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final String currentAge;
  final String currentLocation;
  final String currentEducation;
  final String currentExperience;
  final File? profileImage;

  const UpdateProfile({
    super.key,
    required this.currentName,
    required this.currentEmail,
    required this.currentAge,
    required this.currentLocation,
    required this.currentEducation,
    required this.currentExperience,
    this.profileImage,
  });

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _ageController;
  late TextEditingController _locationController;
  late TextEditingController _experienceController;

  String _selectedEducation = 'High School';
  File? _profileImage;
  final _picker = ImagePicker();
  bool _isLoading = false;
  bool _imageChanged = false;

  final List<String> _educationOptions = [
    'High School',
    'Associate Degree',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Doctorate',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _emailController = TextEditingController(text: widget.currentEmail);
    _ageController = TextEditingController(text: widget.currentAge);
    _locationController = TextEditingController(text: widget.currentLocation);
    _experienceController = TextEditingController(
      text: widget.currentExperience,
    );
    _profileImage = widget.profileImage;

    _selectedEducation =
        _educationOptions.contains(widget.currentEducation)
            ? widget.currentEducation
            : _educationOptions[0];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _locationController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      try {
        setState(() => _isLoading = true);
        final compressedFile = await FlutterImageCompress.compressAndGetFile(
          pickedFile.path,
          '${pickedFile.path}_compressed.jpg',
          quality: 85,
          minWidth: 800,
          minHeight: 800,
        );

        setState(() {
          _profileImage =
              compressedFile != null
                  ? File(compressedFile.path)
                  : File(pickedFile.path);
          _imageChanged = true;
        });
      } catch (e) {
        setState(() {
          _profileImage = File(pickedFile.path);
          _imageChanged = true;
        });
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _updateProfile({
    required String name,
    required String age,
    required String location,
    required String education,
    required String experience,
    String? profileImageUrl,
  }) async {
    await UserController().updateProfile(
      name: name,
      age: age,
      location: location,
      education: education,
      experience: experience,
      profileImage: profileImageUrl,
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;
    if (!mounted) return;

    setState(() => _isLoading = true);

    try {
      final hasChanges =
          _nameController.text != widget.currentName ||
          _ageController.text != widget.currentAge ||
          _locationController.text != widget.currentLocation ||
          _selectedEducation != widget.currentEducation ||
          _experienceController.text != widget.currentExperience ||
          _imageChanged;

      if (!hasChanges) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('No changes detected')));
        }
        return;
      }

      String? profileImageUrl;
      if (_imageChanged && _profileImage != null) {
        profileImageUrl = await Auth().uploadProfileImage(_profileImage!);
      }

      await _updateProfile(
        name: _nameController.text,
        age: _ageController.text,
        location: _locationController.text,
        education: _selectedEducation,
        experience: _experienceController.text,
        profileImageUrl: profileImageUrl,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to update profile: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool readOnly = false,
    int maxLines = 1,
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: TextFormField(
          controller: controller,
          readOnly: readOnly,
          maxLines: maxLines,
          keyboardType: inputType,
          validator: (value) {
            if (!readOnly && (value == null || value.isEmpty)) {
              return 'Please enter $label';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A90E2), Color(0xFF007AFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _saveProfile,
            child:
                _isLoading
                    ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                    : const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Image
              Center(
                child: Stack(
                  children: [
                    Material(
                      elevation: 4,
                      shape: const CircleBorder(),
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey[200],
                        backgroundImage:
                            _profileImage != null
                                ? FileImage(_profileImage!)
                                : const AssetImage('assets/interview.png')
                                    as ImageProvider,
                      ),
                    ),
                    Positioned(
                      bottom: 6,
                      right: 6,
                      child: InkWell(
                        onTap: _pickImage,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              _buildTextField(_nameController, 'Full Name', Icons.person),
              _buildTextField(
                _emailController,
                'Email',
                Icons.email,
                readOnly: true,
              ),
              _buildTextField(
                _ageController,
                'Age',
                Icons.cake,
                inputType: TextInputType.number,
              ),
              _buildTextField(
                _locationController,
                'Location',
                Icons.location_on,
              ),

              // Education Dropdown
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(12),
                  child: DropdownButtonFormField<String>(
                    value: _selectedEducation,
                    decoration: InputDecoration(
                      labelText: 'Education',
                      prefixIcon: const Icon(Icons.school),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items:
                        _educationOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedEducation = newValue;
                        });
                      }
                    },
                  ),
                ),
              ),

              _buildTextField(
                _experienceController,
                'Experience',
                Icons.work,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
