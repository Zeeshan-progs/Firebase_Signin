import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogOutScreen extends StatefulWidget {
  @override
  _LogOutScreenState createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogOut Screen '),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: logout,
          child: Text('Log out'),
        ),
      ),
    );
  }

  Future logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut().then(
          (value) => Navigator.pop(context),
        );
  }
}
