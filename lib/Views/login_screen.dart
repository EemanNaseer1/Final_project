import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinalprojecthackton/Background/background.dart';
import 'package:myfinalprojecthackton/Services/auth_service.dart';
import 'package:myfinalprojecthackton/Views/sign_up.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService = Get.put(AuthService());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 80), // Adjust this for proper padding at the top
                // Logo at the top
                Column(
                  children: [
                    Image.asset("assets/images/logo.png"),
                    Text(
                      'Deliver Favourite Food',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                // Login Form
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'example@gmail.com',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.person_2_outlined,
                              color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          suffixIcon: Icon(Icons.visibility,
                              color: Colors
                                  .white), // Eye icon for password visibility
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          String email = emailController.text;
                          String password = passwordController.text;

                          // Use AuthService for login
                          User? user =
                              await _authService.signIn(email, password);

                          if (user != null) {
                            Get.snackbar('Success', 'Logged in successfully',
                                colorText: Color.fromARGB(0, 255, 255, 255));
                            // Navigate to home screen or dashboard
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 7, 53, 132), // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Or",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Implement Google sign-in
                            },
                            icon: Icon(Icons.g_mobiledata,
                                color: const Color.fromARGB(255, 244, 98, 54),
                                size: 40),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              // Implement Facebook sign-in
                            },
                            icon: Icon(Icons.facebook,
                                color: Colors.blue, size: 40),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SignUpScreen());
                  },
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 40), // Adjust for bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}