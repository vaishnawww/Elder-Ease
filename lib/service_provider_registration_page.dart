import 'package:flutter/material.dart';

class ServiceProviderRegistrationPage extends StatelessWidget {
  const ServiceProviderRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Service Provider Registration",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
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

              // Service Type
              TextField(
                decoration: const InputDecoration(
                  labelText: "Service Type (e.g., Plumbing, Electrical)",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 24),

              // Experience
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Experience (in years)",
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
                  // Handle Service Provider Registration
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
      ),
    );
  }
}
