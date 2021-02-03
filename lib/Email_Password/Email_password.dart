import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_anon/Email_Password/Logout.dart';

import 'App_Bar.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String email = '';
String password = '';
FirebaseAuth auth = FirebaseAuth.instance;
String emailError, passwordError;

class EmailPasswordSignIn extends StatefulWidget {
  @override
  _EmailPasswordSignInState createState() => _EmailPasswordSignInState();
}

class _EmailPasswordSignInState extends State<EmailPasswordSignIn> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: AppBarData(),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                errorText: emailError,
              ),
              onChanged: (val) => email = val.trim(),
              // controller: email,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: buildIconButton(),
              ),
              obscureText: hide,
              onChanged: (val) => password = val.trim(),
              validator: (value) =>
                  value.length < 6 ? passwordError = 'Length must be 6' : null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () async {
                    dynamic user = await regester();
                    return user.toString();
                  },
                  child: Text('Regester'),
                ),
                RaisedButton(
                  onPressed: () async {
                    dynamic result = await login();
                    return result.toString();
                  },
                  child: Text('Log In '),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /*


       ##############        Custom Methods      #############


  */

  // Password Field Icon
  IconButton buildIconButton() {
    return IconButton(
        icon: FaIcon(
          hide ? FontAwesomeIcons.lock : FontAwesomeIcons.lockOpen,
        ),
        onPressed: () {
          setState(() {
            hide = !hide;
          });
        });
  }

  // Create New User
  Future regester() async {
    if (_formKey.currentState.validate()) {
      try {
        UserCredential user = (await auth
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogOutScreen(),
                ),
              ),
            ));
        return user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          setState(() {
            emailError = 'Enter Valid Email';
          });
        } else if (e.code == 'week-password') {
          setState(() {
            passwordError = 'Make Your Password String';
          });
        } else if (e.code == 'email-already-in-use') {
          setState(() {
            emailError = 'User Already Exist Try to login';
          });
        } else if (e.code == 'unknown') {
          setState(() {
            emailError = 'Email Must Be Entered';
            passwordError = 'password Must Be Entered';
          });
        } else if (e.code == 'user-not-found') {
          setState(() {
            emailError = 'Create Account First';
          });
        } else {
          setState(() {
            emailError = 'Enter Valid Details';
            passwordError = 'Enter Valid details';
          });
        }
        print(e.code.toUpperCase());
      }
    }
  }

  // Login Method

  Future login() async {
    try {
      if (_formKey.currentState.validate()) {
        UserCredential user = await auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogOutScreen(),
                ),
              ),
            );
        return user;
      }
    } on FirebaseAuthException catch (e) {
      print(e.code.toUpperCase());
      if (e.code == 'invalid-email') {
        setState(() {
          emailError = 'Enter Valid Email';
        });
      } else if (e.code == 'week-password') {
        setState(() {
          passwordError = 'Make Your Password String';
        });
      } else if (e.code == 'unknown') {
        setState(() {
          emailError = 'Email Must Be Entered';
          passwordError = 'password Must Be Entered';
        });
      } else {
        setState(() {
          emailError = 'Enter Valid Details';
          passwordError = 'Enter Valid details';
        });
      }
    }
  }
}
