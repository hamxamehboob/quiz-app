import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../Utils/dialogs.dart';
import '../views/home_screen.dart';

String? nameValidate(value) {
  if (value.isEmpty) {
    return "Please enter a name";
  } else {
    return null;
  }
}

String? emailValidate(value) {
  if (value.isEmpty) {
    return "Please enter a email";
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return "Enter Valid Email";
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

void signUp(String email, String password, BuildContext context) async {
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
        .createUserWithEmailAndPassword(email: email, password: password);
    // ignore: use_build_context_synchronously
    QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: "SignUp Sucessfully")
        .then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
  } catch (e) {
    // ignore: use_build_context_synchronously
    Navigator.pop(context);

    String errorMessage = 'An error occurred. Please try again.';

    if (e is FirebaseAuthException) {
      if (e.code == 'weak-password') {
        errorMessage =
            'Password is too weak. Please choose a stronger password.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage =
            'Email is already in use. Please choose a different email.';
      }
    }
    // ignore: use_build_context_synchronously
    Dialogs.showSnackBar(context, errorMessage);
  }
}
