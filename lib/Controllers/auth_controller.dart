import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfinalprojecthackton/Services/auth_service.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User?> _firebaseUser = Rx<User?>(null);
  FirebaseAuth auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();

  @override
  void onInit() {
    _firebaseUser.bindStream(auth.authStateChanges());
    super.onInit();
  }

  // Sign up function
  Future<void> register(String email, String password) async {
    User? user = await _authService.signUp(email, password);
    if (user != null) {
      Get.snackbar('Success', 'Account created successfully',
          colorText: Color.fromARGB(0, 255, 255, 255));
    } else {
      Get.snackbar('Error', 'Could not create account',
          colorText: Color.fromARGB(0, 255, 255, 255));
    }
  }

  // Sign in function
  Future<void> login(String email, String password) async {
    User? user = await _authService.signIn(email, password);
    if (user != null) {
      Get.snackbar('Success', 'Logged in successfully',
          colorText: Color.fromARGB(0, 255, 255, 255));
    } else {
      Get.snackbar('Error', 'Invalid credentials',
          colorText: Color.fromARGB(0, 255, 255, 255));
    }
  }

  // Logout
  void signOut() {
    _authService.signOut();
    Get.offAllNamed('/login');
  }
}