import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newdesign/services/usermanagement.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String _email;
  String _password;
  String _phoneNo;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          padding:  EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(
                    hintText: ('Enter The Email or password'),
                  ),
                  onChanged: (value)
                  {
                    setState(() {
                      _phoneNo = value;
                    });
                  }
              ),
              SizedBox(
                  height: 15.0),
              TextField(
                  decoration: InputDecoration(hintText: 'Password'),
                  onChanged: (value)
                  {
                    setState(() {
                      _password =value;
                    });
                  }
              ),

              SizedBox(height: 20.0),
              RaisedButton(
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                },
              ),

              SizedBox(height: 20.0),
              Text(" Don\'t have an account ?"),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text('Sign Up'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: _phoneNo, timeout: null, verificationCompleted: _verificationId, verificationFailed: _verificationFaild, codeSent: null, codeAutoRetrievalTimeout: null)
                  then((signedInUser) {
                    UserManagement().storeNewUser(signedInUser, context);
                  })
                      .catchError((e) {
                    print(e);
                  });
                },
              ),

                  ],
          )
        ),
      ),
    );
  }
}
