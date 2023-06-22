import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../views/home_screen.dart';
import '../utils/dialogs.dart';

class GoogleSignInHelper {
  void handleGoogleSignIn(BuildContext context) {
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((value) {
      if (value != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } else {
        Dialogs.showSnackBar(
          context,
          'Something Went Wrong. Check Internet Connection',
        );
      }
    }).catchError((error) {
      Dialogs.showSnackBar(
        context,
        'Something Went Wrong. Check Internet Connection',
      );
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception('No Internet Connection');
    }
  }
}
