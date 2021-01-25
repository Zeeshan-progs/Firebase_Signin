import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_anon/auth.dart';

class SignEmail extends StatefulWidget {
  @override
  _SignEmailState createState() => _SignEmailState();
}

class _SignEmailState extends State<SignEmail> {
  String _password, _email;
  bool _hide = false;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Sign in'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Enter Email',
            ),
            onChanged: (value) {
              _email = value.trim();
            },
          ),
          SizedBox(height: 20),
          TextField(
            obscureText: !_hide,
            decoration: InputDecoration(
              hintText: 'Enter Password',
             border: OutlineInputBorder(borderSide: BorderSide()),floatingLabelBehavior: FloatingLabelBehavior.always,
             labelText: 'Password',
             alignLabelWithHint: true,
             labelStyle: TextStyle(fontSize: 25),
              suffix: IconButton(
                icon: Icon(_hide ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _hide = !_hide;
                  });
                },
              ),
            ),
            onChanged: (value) {
              _password = value.trim();
            },
            keyboardAppearance: Brightness.dark,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                onPressed: () async {
                  EmailSign().signinWithEmail(_email, _password).then((value) =>
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Validate())));
                },
                child: Text('Sign In'),
              ),
              RaisedButton(
                onPressed: () async {
                  EmailSign().createEmail(_email, _password).then((value) =>
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Validate())));
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Validate extends StatefulWidget {
  @override
  _ValidateState createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Text('Log Out'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
