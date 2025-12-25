import 'package:auth_project/Features/Home/presentation/home_page.dart';
import 'package:auth_project/Features/auth/data/firebase_auth_service.dart';
import 'package:auth_project/Features/auth/presentation/cubits/auth_cubit.dart';
import 'package:auth_project/Features/auth/presentation/cubits/auth_state.dart';
import 'package:auth_project/Features/auth/presentation/pages/auth_page.dart';
import 'package:auth_project/Features/auth/presentation/widgets/loading_screen.dart';
import 'package:auth_project/firebase_options.dart';
import 'package:auth_project/themes/dark_mode.dart';
import 'package:auth_project/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // Firebase Initialization
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authrepo = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) =>
                AuthCubit(authRepo: FirebaseAuthService())..checkAuth(),
          ),
        ],
        child: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            print(state);
            if (state is UnauthenticatedState) {
              return const AuthPage();
            }
            if (state is AuthenticatedState) {
              return const HomePage();
            } else {
              return const LoadingScreen();
            }
          },
          listener: (context, state) {
            if (state is AuthErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message!)));
            }
          },
        ),
      ),
    );
  }
}
