import 'package:flutter/material.dart';
import 'login_register_page.dart';
import 'login_page.dart';
import 'user_registration_page.dart';
import 'service_provider_registration_page.dart';
import 'user_home_page.dart';
import 'provider_home_page.dart';
// Remove the unused imports since we're using MaterialPageRoute navigation

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ElderEase',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginRegisterPage(),
        '/login': (context) => const LoginPage(),
        '/user_register': (context) => const UserRegistrationPage(),
        '/provider_register': (context) => const ServiceProviderRegistrationPage(),
        '/user_home': (context) {
          final phone = ModalRoute.of(context)!.settings.arguments as String;
          return UserHomePage(phone: phone);
        },
        '/provider_home': (context) {
          final phone = ModalRoute.of(context)!.settings.arguments as String;
          return ProviderHomePage(phone: phone);
        },
      },
      theme: ThemeData(
        fontFamily: 'Inter',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}