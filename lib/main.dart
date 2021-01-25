import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_anon/EmailSign.dart';
import 'package:sign_anon/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// hello gang welcome to code with nix next tutorial
// today we are learning about anonymous sign in Firebase

// lets jump to browser
// checking for firebase authentication
// after that lets create some minimal ui

// create stateful widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignEmail(),
    );
  }
}

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Anonymously'),
      ),

      // lets add body parameter
      body: Column(
        children: [
          // create a button

          Center(
            child: RaisedButton(
              onPressed: () async {
                // method of sign injhakhd sdkjhshdjfgfhkdjj fjasjjf jhjfhdjhf
                dynamic result = await UserSignin().signInAnon();
                // and after sign in if you want to go to next page
                if (result == null) {
                  print('error Signin');
                } else {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen()));
                  });
                }
              },
              // lets create some firebase work and call it in home

              child: Text('Click to Signin Anon'),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('screen'),
        ),
        body: ListView(
          children: [
            Text('Second Area'),
            RaisedButton(
              onPressed: () async {
                UserSignin().signOutAnon();
                
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Text('sign out'),
            ),
          ],
        ),
      ),
    );
  }
}

// there is some exceptions occurs we will talk about it latter

// for now if you loved this video
// hit like
// SHARE
//Subscribe
// to Code with nix

// jai hind

// thank you all
