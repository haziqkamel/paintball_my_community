import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:paintball_app/routes/route_path.dart';

class FirebaseAuthentication {

  static Future<void> useFirebaseAuthEmulator() async =>
      await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);

  // Subscribe current auth state
  static subscribeCurrentAuthState() =>
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Get.offNamedUntil(LOGIN, (route) => false);
        } else {
          Get.offNamedUntil(HOME, (route) => false);
        }
      });

  // Subscribe current id token changes
  static subscribeCurrentIdTokenChanges() =>
      FirebaseAuth.instance.idTokenChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });

  // Subscribe user changes
  static checkUserChanges() =>
      FirebaseAuth.instance.userChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });

  static User? get firebaseUser => FirebaseAuth.instance.currentUser;

  static signIn({required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  static signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
