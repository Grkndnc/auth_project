import 'package:auth_project/Features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          TextButton(
            onPressed: context.read<AuthCubit>().signOut,
            child: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(context.read<AuthCubit>().currentUser!.uid.toString()),
      ),
    );
  }
}
