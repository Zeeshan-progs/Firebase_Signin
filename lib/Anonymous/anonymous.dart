import 'package:flutter/material.dart';

import 'auth/aninymousAuth.dart';

class AnonymousSignIn extends StatefulWidget {
  @override
  _AnonymousSignInState createState() => _AnonymousSignInState();
}

class _AnonymousSignInState extends State<AnonymousSignIn> {
  dynamic result = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://nakedsecurity.sophos.com/wp-content/uploads/sites/2/2013/11/anon-250.png?w=250',
                fit: BoxFit.fill,
                height: 40,
                width: 40,
              ),
              SizedBox(width: 30),
              Text('Anonymous Sign In'),
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () async {
                  if (result.isEmpty) {
                    result = await ClickToLogin().login();
                    print(result.toString());
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Sign In Successfully'),
                      ));
                    });
                  } else {
                    await ClickToLogin().signOut();
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Sign out successfully '),
                      ));
                      result = '';
                    });
                    print('Signed out success fully ');
                  }
                },
                child: Text(result.isEmpty ? 'Sign In' : 'Sign Out'),
              ),
              SizedBox(height: 50),
              Text(result.isEmpty
                  ? ' '
                  : "Guest Loged In at ${result.toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
