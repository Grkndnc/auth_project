import 'package:auth_project/Features/auth/presentation/widgets/my_button.dart';
import 'package:auth_project/Features/auth/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final pwcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_sharp,
              size: 85,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 32),
            Text(
              "M Y    A U T H    A P P ",
              style: TextStyle(
                fontSize: 35,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 32),

            MyTextField(
              controller: emailcontroller,
              hintText: "Email",
              obscureText: false,
            ),
            SizedBox(height: 12),
            MyTextField(
              controller: pwcontroller,
              hintText: "Password",
              obscureText: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // reset password
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: MyButton(onTap: () {}, text: "LOGIN"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an Account ?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.togglePages,
                  child: Text(
                    "  Sign up Here",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
