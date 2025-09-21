import 'package:flutter/material.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              
              // App Title (big, bold, elder-friendly)
              const Text(
                "ElderEase",
                style: TextStyle(
                  fontSize: 48, // bigger
                  fontWeight: FontWeight.bold, // bolder
                  color: Colors.black,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 60),
              
              // Minimal divider
              Container(
                width: 60,
                height: 2,
                color: Colors.black,
              ),
              const SizedBox(height: 40),
              
              // Login/Register Title
              const Text(
                "Login / Register",
                style: TextStyle(
                  fontSize: 32, // larger
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 80),
              
              // Register as User Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to User Registration Page
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 24), // bigger button
                    side: const BorderSide(width: 2, color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // slightly rounded for comfort
                    ),
                  ),
                  child: const Text(
                    "Register as User",
                    style: TextStyle(
                      fontSize: 22, // bigger text
                      color: Colors.black,
                      fontWeight: FontWeight.w600, // medium-bold
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // Register as Service Provider Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to Service Provider Registration Page
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    side: const BorderSide(width: 2, color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Register as Service Provider",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Already have account? Login
              TextButton(
                onPressed: () {
                  // Navigate to Login Page
                },
                child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(
                    fontSize: 20, // bigger and easier
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.2,
                  ),
                ),
              ),
              
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
