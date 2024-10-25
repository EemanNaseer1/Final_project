import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:myfinalprojecthackton/Services/auth_service.dart';
import 'package:myfinalprojecthackton/Views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDT11Hk1BKUCnAhyS-ivOewXfYcwost4pg",
      appId: "1:197936576247:android:e11c61e3b289e238df05f2",
      messagingSenderId: "197936576247",
      projectId: "foodie-app-5b838",
    ),
  );
  
  Get.put(AuthService());

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: LoginScreen(), // Set the initial screen
    );
  }
}