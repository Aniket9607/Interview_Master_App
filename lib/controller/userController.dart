import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>?> fetchUserData() async {
    try {
      final User? user = _auth.currentUser;
      if (user == null) {
        print('[DEBUG] No user is currently logged in.');
        return null;
      }

      final DocumentSnapshot docSnapshot =
          await _firestore.collection('users').doc(user.uid).get();

      if (docSnapshot.exists) {
        print('[DEBUG] User data fetched from Firestore for UID: ${user.uid}');
        print(docSnapshot.data());
        return docSnapshot.data() as Map<String, dynamic>;
      } else {
        print('[DEBUG] No user document found for UID: ${user.uid}');
        return null;
      }
    } catch (e) {
      print('[ERROR] Failed to fetch user data: $e');
      return null;
    }
  }

  Future<void> updateProfile({
    required String? name,
    required String? age,
    required String? location,
    required String? education,
    required String? experience,
    required String? profileImage,
  }) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print('[DEBUG] No user is currently logged in.');
        throw Exception('No authenticated user found');
      }

      // Validate at least one field is being updated
      if (name == null &&
          age == null &&
          location == null &&
          education == null &&
          experience == null &&
          profileImage == null) {
        print('[DEBUG] No profile data provided for update');
        throw Exception('No profile data provided for update');
      }

      // Prepare update data (only include non-null fields)
      final Map<String, dynamic> updateData = {};
      if (name != null) updateData['name'] = name;
      if (age != null) updateData['age'] = age;
      if (location != null) updateData['location'] = location;
      if (education != null) updateData['education'] = education;
      if (profileImage != null) updateData['profileImageUrl'] = profileImage;

      if (experience != null) updateData['experience'] = experience;

      // Update user document in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(updateData, SetOptions(merge: true));

      print('[DEBUG] Profile updated successfully for UID: ${user.uid}');
      print('[DEBUG] Updated data: $updateData');
    } catch (e) {
      print('[ERROR] Failed to update profile: $e');
      throw Exception('Failed to update profile: $e');
    }
  }
}
