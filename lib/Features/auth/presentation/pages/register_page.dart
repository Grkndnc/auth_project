import 'package:auth_project/Features/auth/presentation/cubits/auth_cubit.dart';
import 'package:auth_project/Features/auth/presentation/widgets/my_button.dart';
import 'package:auth_project/Features/auth/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController namecontroller;
  late final TextEditingController emailcontroller;
  late final TextEditingController passwordcontroller;
  late final TextEditingController confirmpasswordcontroller;

  @override
  void initState() {
    namecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    confirmpasswordcontroller = TextEditingController();
    super.initState();
  }

  // register button pressed
  void register() {
    print("TIKLANDI");
    final name = namecontroller.text.trim();
    final email = emailcontroller.text.trim();
    final password = passwordcontroller.text.trim();
    final confirmpw = confirmpasswordcontroller.text.trim();
    // AuthCubit
    final authCubit = context.read<AuthCubit>();

    // ensure Fields aren't empty
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmpw.isNotEmpty) {
      if (password == confirmpw) {
        authCubit.signUp(name, email, password);
      } // password doesn't match
      else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Password doesn't match !")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Fields cant be empty please fill them out !")),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
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
              "Let's create an account for you",
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32),
            MyTextField(
              controller: namecontroller,
              hintText: "Name",
              obscureText: false,
            ),

            SizedBox(height: 12),
            MyTextField(
              controller: emailcontroller,
              hintText: "Email",
              obscureText: false,
            ),
            SizedBox(height: 12),
            MyTextField(
              controller: passwordcontroller,
              hintText: "Password",
              obscureText: false,
            ),
            SizedBox(height: 12),
            MyTextField(
              controller: confirmpasswordcontroller,
              hintText: " Confirm Password",
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
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8,
              ),
              child: MyButton(onTap: register, text: "SIGN UP"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account ?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.togglePages,
                  child: Text(
                    "  Login Here",
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
