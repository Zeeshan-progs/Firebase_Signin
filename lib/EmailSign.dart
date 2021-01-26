import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// hello gang welcome to my next class of firebase authentication for Email and password

// lets fresh-n-up and jump to code

// create a class

class EmailSignIn extends StatefulWidget {
  @override
  _EmailSignInState createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  // create bool value to toggle password visible or hide
  bool hide = true;
  final auth = FirebaseAuth.instance;
  // string var to store email and password
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Sign In'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // create a form fields for input password and email

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
              onChanged: (value) => email = value.trim(),
              // trim use to avoid white spaces
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Password',
                suffixIcon: IconButton(
                  icon: Icon(hide ? Icons.visibility : Icons.visibility_off),
                  // lets change icon to state of textfield
                  onPressed: () {
                    // to toggle on click
                    setState(() {
                      hide = !hide;
                    });
                  },
                ),
                // inputted text must be secure
                // to secure your password you need to add obSecure
              ),
              obscureText: hide,
              onChanged: (value) => password = value,
              // lets do some work to toggle secure password
            ),
          ),
// add some space between  button and text fields
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Buttons to create and login

              RaisedButton(
                child: Text('Log in'),
                onPressed: () async {
                  // print(email);
                  // print(password);
                  // // to test is it working or not
                  // lets do some real work
                  // first you need to check if email or password is not null
                  try {
                    if (email.isEmpty && password.isEmpty) {
                      print('Enter Email And password ');
                    } else {
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password)
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn())));
                      // before login you need to regester with same email and password
// do the same to navigate after login after done with work
// use then
                      print('Sign IN Successfully');
                      return user.user.uid;
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              RaisedButton(
                child: Text('Regester'),
                onPressed: () async {
                  try {
                    UserCredential user = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password)
                        .then((value) => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn())));
                    print(user.user.email);
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// lets create some methods for regester and log in

// to navigate after done with sign in

// create temporary widget

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: FlatButton(
            onPressed: () async {
              // add signout method to sign out
              await auth.signOut().then((value) => Navigator.pop(context));
              print('Sign Out Successfully ');
            },
            child: Text('Sign Out'),
          ),
        ),
      ),
    );
  }
}




// thats it for today 
// we will do some vadilation work in next video stay tuned 


// Happy Republic Day

// Happy Coding 


// Like 


//  Share 


// Subscribe 



// Than You All 



// Jai Hind 