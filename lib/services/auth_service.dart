import 'package:exptra/screen/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  createUser(data, context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LandingPage()));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Sign up failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  login(data, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LandingPage()));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Incorrect email address or password"),
              content: Text(e.toString()),
            );
          });
    }
  }
}
