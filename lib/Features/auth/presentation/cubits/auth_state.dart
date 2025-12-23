/*
        AUTH STATES
*/

import 'package:auth_project/Features/auth/domain/models/app_user.dart';

abstract class AuthState {}

// initial state
class AuthInitialState extends AuthState {}

// loading state ...
class AuthLoadingState extends AuthState {}

// authenticated state
class AuthenticatedState extends AuthState {
  final AppUser? user;
  AuthenticatedState({this.user});
}

// unauthenticated state
class UnauthenticatedState extends AuthState {}

// error state
class AuthErrorState extends AuthState {
  final String? message;
  AuthErrorState({this.message});
}
