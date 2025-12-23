//

//
import 'package:auth_project/Features/auth/domain/models/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> signInWithEmailAndPassword(String email, String password);
  Future<AppUser?> signUpWithEmailAndPassword(
    String name,
    String email,
    String password,
  );
  Future<AppUser?> getCurrentUser();
  Future<String> sendPasswordResetEmail(String email);
  Future<void> signOut();
  Future<void> deleteUser();
}
