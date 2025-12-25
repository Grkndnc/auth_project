/*

   Cubits are responsible for managing the state of the authentication feature. 
   They handle user interactions, such as login and logout, and emit the corresponding authentication states.
*/

import 'package:auth_project/Features/auth/domain/models/app_user.dart';
import 'package:auth_project/Features/auth/domain/repository/auth_repo.dart';
import 'package:auth_project/Features/auth/presentation/cubits/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;
  AuthCubit({required this.authRepo}) : super(AuthInitialState());

  // get user
  AppUser? get currentUser => _currentUser;

  // check authentication status
  void checkAuth() async {
    // loading.....
    emit(AuthLoadingState());
    // AppUser.
    AppUser? user = await authRepo.getCurrentUser();
    if (user != null) {
      _currentUser = user;
      emit(AuthenticatedState(user: _currentUser));
    } else {
      emit(UnauthenticatedState());
    }
  }

  // sign in. email + password
  Future<void> signIn(String email, String pw) async {
    try {
      emit(AuthLoadingState());
      AppUser? user = await authRepo.signInWithEmailAndPassword(email, pw);
      if (user != null) {
        _currentUser = user;
        emit(AuthenticatedState(user: _currentUser));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
      emit(UnauthenticatedState());
    }
  }

  // sign up.
  Future<void> signUp(String name, String email, String pw) async {
    try {
      emit(AuthLoadingState());
      AppUser? user = await authRepo.signUpWithEmailAndPassword(
        name,
        email,
        pw,
      );
      if (user != null) {
        _currentUser = user;
        emit(AuthenticatedState(user: _currentUser));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
      emit(UnauthenticatedState());
    }
  }

  // log out
  Future<void> signOut() async {
    emit(AuthLoadingState());
    await authRepo.signOut();
    emit(UnauthenticatedState());
  }

  // Forgot Password
  Future<String> forgotPassword(String email) async {
    try {
      emit(AuthLoadingState());
      final String message = await authRepo.sendPasswordResetEmail(email);
      return message;
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
      return e.toString();
    }
  }

  // delete user account
  Future<void> deleteUser() async {
    try {
      emit(AuthLoadingState());
      await authRepo.deleteUser();
      emit(UnauthenticatedState());
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
      emit(UnauthenticatedState());
    }
  }
}
