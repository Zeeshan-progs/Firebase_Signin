import 'package:firebase_auth/firebase_auth.dart';

class UserSignin {
  //create a method for user anonymouly sign in

  // method is type of future
  // so
  UserUid _uidFromFirebase(User user) {
    return user != null ? UserUid(uid: user.uid) : null;
  }

  Future signInAnon() async {
    try {
      // using async because future do take some time to complete given work
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      // in new update of firebase you need to add usercredential at place of AuthResult
      // now you can directly return userCredential
      User user = userCredential.user;
      print(user.uid);
      return _uidFromFirebase(user);
      // in any exception error lets do all its work in try catch block}
    } catch (e) {
      print(e.toString());
      return null;
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

class UserUid {
  final String uid;
  UserUid({this.uid});
}

class EmailSign {
  String email, password;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signinWithEmail(String email, String password) async {
    try {
      if (email != null && password != null) {
        dynamic user =
            auth.signInWithEmailAndPassword(email: email, password: password);
        return user;
      } else {
        print('User not created ');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future createEmail(String email, String password) async {
    try {
      dynamic user =
          auth.createUserWithEmailAndPassword(email: email, password: password);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }
}
