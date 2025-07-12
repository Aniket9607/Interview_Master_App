import 'dart:io';
import 'package:bcrypt/bcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';

class Auth {
  // Constants
  static const _userCollection = 'users';
  static const _adminCollection = 'admin';
  static const _profilePhotosFolder = 'userProfilePhotos';

  // Services
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final Cloudinary cloudinary = Cloudinary.signedConfig(
    apiKey: '239522746823794',
    apiSecret: 'WmV9E5ig4IXx8ibZIWvd9NG-vtM',
    cloudName: 'dbndeqfjo',
  );

  // Auth Methods
  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final stopwatch = Stopwatch()..start();
    print('[Auth][SignUp] Starting registration for $email');

    try {
      final trimmedName = name.trim();
      final trimmedEmail = email.trim();

      if (trimmedName.isEmpty) {
        print('[Auth][SignUp] Validation failed: Empty name');
        return 'Please enter your name';
      }
      if (trimmedEmail.isEmpty) {
        print('[Auth][SignUp] Validation failed: Empty email');
        return 'Please enter your email';
      }
      if (password.isEmpty) {
        print('[Auth][SignUp] Validation failed: Empty password');
        return 'Please enter your password';
      }

      print('[Auth][SignUp] Creating Firebase user...');
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: trimmedEmail,
        password: password,
      );
      print(
        '[Auth][SignUp] Firebase user created in ${stopwatch.elapsedMilliseconds}ms',
      );

      if (userCredential.user == null) {
        print('[Auth][SignUp] Error: User creation returned null');
        return 'User creation failed';
      }

      print('[Auth][SignUp] Saving user data to Firestore...');
      await _db.collection(_userCollection).doc(userCredential.user?.uid).set({
        'name': trimmedName,
        'email': trimmedEmail,
        'uid': userCredential.user?.uid,
        'createdAt': FieldValue.serverTimestamp(),
        'profileImageUrl': null,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      print(
        '[Auth][SignUp] User data saved in ${stopwatch.elapsedMilliseconds}ms',
      );

      print('[Auth][SignUp] Completed in ${stopwatch.elapsedMilliseconds}ms');
      return null;
    } on FirebaseAuthException catch (e) {
      print('[Auth][SignUp] Firebase error: ${e.code}');
      return _handleAuthError(e);
    } catch (e) {
      print('[Auth][SignUp] Unexpected error: $e');
      debugPrint('SignUp Error: $e');
      return 'An unexpected error occurred';
    } finally {
      stopwatch.stop();
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final stopwatch = Stopwatch()..start();
    print('[Auth][Login] Attempting login for $email');

    try {
      print('[Auth][Login] Trying Firebase authentication...');
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        print('[Auth][Login] Firebase auth returned null user');
        return _errorResponse('Authentication failed');
      }
      print('[Auth][Login] Completed in ${stopwatch.elapsedMilliseconds}ms');
      return {'status': 'success', 'role': 'user'};
    } on FirebaseAuthException catch (e) {
      print(
        '[Auth][Login] Firebase auth failed (${e.code}), trying admin login...',
      );
      final result = await _adminLogin(email, password);
      print(
        '[Auth][Login] Admin login completed in ${stopwatch.elapsedMilliseconds}ms',
      );
      return result;
    } catch (e, stackTrace) {
      print('[Auth][Login] Unexpected error: $e\n$stackTrace');
      return _errorResponse('Login failed. Please try again');
    } finally {
      stopwatch.stop();
    }
  }

  Future<Map<String, dynamic>> _adminLogin(
    String email,
    String password,
  ) async {
    print('[Auth][AdminLogin] Starting admin login for $email');

    try {
      print('[Auth][AdminLogin] Querying admin collection...');
      final snapshot =
          await _db
              .collection(_adminCollection)
              .where('email', isEqualTo: email)
              .limit(1)
              .get();

      if (snapshot.docs.isEmpty) {
        print('[Auth][AdminLogin] No admin found with email $email');
        return _errorResponse('Invalid credentials');
      }

      final admin = snapshot.docs.first.data();
      print('[Auth][AdminLogin] Admin found, verifying password...');

      if (!BCrypt.checkpw(password, admin['password'] ?? '')) {
        print('[Auth][AdminLogin] Password verification failed');
        return _errorResponse('Invalid credentials');
      }

      print('[Auth][AdminLogin] Admin login successful');
      return {'status': 'success', 'role': 'admin'};
    } catch (e) {
      print('[Auth][AdminLogin] Error: $e');
      debugPrint('Admin Login Error: $e');
      return _errorResponse('Admin login failed');
    }
  }

  Future<String?> uploadProfileImage(File image) async {
    final stopwatch = Stopwatch()..start();
    print('[Auth][UploadImage] Starting image upload');

    try {
      // Validate image file exists
      if (!image.existsSync()) {
        throw Exception('Image file does not exist');
      }

      final user = _auth.currentUser;
      if (user == null) {
        print('[Auth][UploadImage] No authenticated user');
        throw Exception('User not authenticated');
      }

      print('[Auth][UploadImage] Uploading to Cloudinary...');
      final response = await cloudinary.upload(
        file: image.path,
        fileName: user.uid,
        resourceType: CloudinaryResourceType.image,
        folder: _profilePhotosFolder,
      );

      if (response.secureUrl == null || response.publicId == null) {
        print('[Auth][UploadImage] Cloudinary upload failed');
        throw Exception('Upload failed - no URL or publicId returned');
      }

      print('[Auth][UploadImage] Updating Firestore with image URL...');
      // await _db.collection(_userCollection).doc(user.uid).update({
      //   'profileImageUrl':
      //       response.publicId!, // Changed from publicId to secureUrl
      //   'updatedAt': FieldValue.serverTimestamp(),
      // });

      print(
        '[Auth][UploadImage] Completed in ${stopwatch.elapsedMilliseconds}ms',
      );
      return response.publicId!;
    } catch (e, stackTrace) {
      print('[Auth][UploadImage] Error: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    } finally {
      stopwatch.stop();
    }
  }

  Future<void> signOut() async {
    print('[Auth][SignOut] Starting sign out');
    await _auth.signOut();
    print('[Auth][SignOut] Completed');
  }

  // Helpers
  String _handleAuthError(FirebaseAuthException e) {
    print('[Auth][Error] Firebase auth error: ${e.code}');
    return switch (e.code) {
      'email-already-in-use' => 'Email already registered',
      'invalid-email' => 'Invalid email',
      'weak-password' => 'Password too weak',
      'user-not-found' || 'wrong-password' => 'Invalid credentials',
      'user-disabled' => 'Account disabled',
      _ => e.message ?? 'Authentication failed',
    };
  }

  Map<String, dynamic> _errorResponse(String message) {
    print('[Auth][Error] Returning error response: $message');
    return {'status': 'error', 'message': message};
  }
}
