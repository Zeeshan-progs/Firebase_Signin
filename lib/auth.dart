import 'package:firebase_auth/firebase_auth.dart';

class UserSignin {
  //create a method for user anonymouly sign in

  // method is type of future
  // so
  Future signInAnon() async {
    try {
      // using async because future do take some time to complete given work
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      // in new update of firebase you need to add usercredential at place of AuthResult
      // now you can directly return userCredential
      print(userCredential.user); // to print in console

      return userCredential;
      // in any exception error lets do all its work in try catch block}
    } catch (e) {
      print(e);
    }
  }

  // lets create sign out method

  Future signOutAnon() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }
}
