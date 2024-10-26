import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinalprojecthackton/Views/login_screen.dart'; // Import GetX

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate after a delay
    Timer(Duration(seconds: 3), () {
      Get.offAll(LoginScreen()); // Use GetX for navigation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundImage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 330),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the logo
              children: [
                Image.asset('assets/images/logo.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
