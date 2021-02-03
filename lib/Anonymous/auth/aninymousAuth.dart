import 'package:firebase_auth/firebase_auth.dart';

class ClickToLogin {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future login() async {
    try {
      UserCredential user = await auth.signInAnonymously();
      return user.user.uid;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
