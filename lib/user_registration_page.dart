import 'package:flutter/material.dart';

class UserRegistrationPage extends StatelessWidget {
  const UserRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "User Registration",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Name
            TextField(
              decoration: const InputDecoration(
                labelText: "Full Name",
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
              ),
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 24),

            // Age
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Age",
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
              ),
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 24),

            // Address
            TextField(
              decoration: const InputDecoration(
                labelText: "Address",
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
              ),
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 24),

            // Phone Number
            TextField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
              ),
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 24),

            // Password
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
              ),
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 40),

            // Register Button
            ElevatedButton(
              onPressed: () {
                // Handle User Registration
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              child: const Text(
                "Register",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
