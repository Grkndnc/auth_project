import 'package:auth_project/Features/auth/presentation/pages/login_page.dart';
import 'package:auth_project/Features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showPage = true;

  void togglePages() {
    setState(() {
      showPage = !showPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showPage
          ? LoginPage(togglePages: togglePages)
          : RegisterPage(togglePages: togglePages),
    );
  }
}
