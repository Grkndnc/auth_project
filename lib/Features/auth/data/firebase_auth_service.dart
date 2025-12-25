import 'package:auth_project/Features/auth/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_project/Features/auth/domain/models/app_user.dart';

class FirebaseAuthService implements AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  SIGN IN USER ////
  @override
  Future<AppUser?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      // attempt to sign in
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // create AppUser from Firebase User
      AppUser user = AppUser(uid: userCredential.user!.uid, email: email);
      return user;
    } catch (e) {
      throw Exception("Eror signing in : $e");
    }
  }

  /// REGİSTER USER ////
  @override
  Future<AppUser?> signUpWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    // attempt to sign up
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // create Appuser from Firebase User
      AppUser user = AppUser(uid: userCredential.user!.uid, email: email);
      return user;
    } catch (e) {
      throw Exception("Error signing up  : $e");
    }
  }

  // DELETE USER ///
  @override
  Future<void> deleteUser() async {
    try {
      // get current user
      final user = _auth.currentUser;
      // check there is logged in user
      if (user == null) {
        throw Exception("No user is currently logged in.");
      }
      // delete user
      await user.delete();
      await signOut();
    } catch (e) {
      throw Exception("Error deleting user. : $e");
    }
  }

  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "Password reset email sent successfully to $email";
    } catch (e) {
      throw Exception("an error occurred : $e");
    }
  }

  // SIGN OUT USER
  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // GET CURRENT USER ////
  @override
  Future<AppUser?> getCurrentUser() async {
    // get logged in user from firebaseauth
    final user = _auth.currentUser;
    // no logged in user
    if (user == null) {
      return null;
    }
    // Logged in user exists
    return AppUser(uid: user.uid, email: user.email!);
  }
}
