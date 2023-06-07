import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/widgets/google_button.dart';

import '../helpers/dialogs.dart';
import 'home_screen.dart';
import 'onboard_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = true;
  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _pwKey = GlobalKey<FormState>();
  final TextEditingController _emailtextcontroller = TextEditingController();
  final TextEditingController _pwtextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              left: size.width * .07,
              top: size.height * .05,
              right: size.height * .04,
              bottom: size.height * .02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const OnBoardPage())),
                    child: const Icon(Icons.arrow_back_ios)),
                SizedBox(
                  height: size.height * .03,
                ),
                const Center(
                  child: Text(
                    "Create an account 📝",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                const Text(
                  "Please enter your name,email address and password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: size.height * .07,
                ),
                const Text(
                  "Username",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Form(
                  key: _nameKey,
                  child: TextFormField(
                    validator: nameValidate,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Enter your Name",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF7558ff), width: 2))),
                  ),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Form(
                  key: _emailKey,
                  child: TextFormField(
                    controller: _emailtextcontroller,
                    validator: emailValidate,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Enter your email address",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF7558ff), width: 2))),
                  ),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Form(
                  key: _pwKey,
                  child: TextFormField(
                    controller: _pwtextcontroller,
                    keyboardType: TextInputType.emailAddress,
                    validator: pwValidate,
                    textAlign: TextAlign.start,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          color: const Color(0xFF7558ff),
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                _isObscure = !_isObscure;
                              },
                            );
                          },
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF7558ff), width: 2),
                        )),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * .5),
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Color(0xFF7558ff),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                GestureDetector(
                  onTap: () {
                    validate();
                    signUp();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .35,
                        vertical: size.height * .014),
                    decoration: BoxDecoration(
                        color: const Color(0xFF6949ff),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * .01, right: size.width * .01),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(color: Color(0xFF949494), thickness: 1),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      const Text(
                        "Or SignUp with",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xFF949494),
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: size.height * .1,
                      ),
                    ],
                  ),
                ),
                GoogleButton(route: () {
                  _handleGoogleSignIn();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate() {
    if (_pwKey.currentState!.validate() ||
        _nameKey.currentState!.validate() ||
        _emailKey.currentState!.validate()) {}
  }

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

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailtextcontroller.text, password: _pwtextcontroller.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    } catch (e) {
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
      Dialogs.showSnackBar(context, errorMessage);
    }

    setState(() {});
  }

  _handleGoogleSignIn() {
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
