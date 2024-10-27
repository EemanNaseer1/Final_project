import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinalprojecthackton/Background/background.dart';
import 'package:myfinalprojecthackton/Views/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SizedBox(
          width: double.infinity, // Ensure it stretches horizontally
          height: double.infinity, // Ensure it stretches vertically
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center contents
            children: [
              // App Logo
              Image.asset('assets/images/logo.png', height: 150),

              const SizedBox(height: 50),

              // "Get Started" Button
              ElevatedButton(
                onPressed: () {
                  Get.offAll(() => LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 29, 37, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
