import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../Utils/dialogs.dart';
import '../views/home_screen.dart';

void login(String email, String password, BuildContext context) async {
  FocusScope.of(context).unfocus();
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
  await Future.delayed(const Duration(milliseconds: 100));
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    Navigator.pop(context);

    QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: "Login Sucessfull")
        .then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
  } catch (e) {
    Navigator.pop(context);

    String errorMessage = 'An error occurred. Please try again.';

    if (e is FirebaseAuthException) {
      if (e.code == 'user-not-found') {
        errorMessage = 'User not found. Please check your email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password. Please try again.';
      }
    }

    Dialogs.showSnackBar(context, errorMessage);
  }
}

String? emailValidate(value) {
  if (value.isEmpty) {
    return "Please enter an email";
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return "Enter a valid email";
  } else {
    return null;
  }
}

String? pwValidate(value) {
  if (value.isEmpty) {
    return "Please enter a password";
  } else {
    return null;
  }
}
