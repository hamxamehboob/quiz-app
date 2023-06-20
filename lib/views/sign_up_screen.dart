import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:quiz_app/controllers/signup_controller.dart';
import 'package:quiz_app/views/login_screen.dart';
import 'package:quiz_app/Utils/google_button.dart';

import '../Utils/dialogs.dart';
import '../Utils/sign_in_with_google.dart';
import '../constants/colors.dart';
import 'home_screen.dart';

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
                    signUp(_emailtextcontroller.text, _pwtextcontroller.text,
                        context);
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
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Have An Account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: AppColor.purpleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
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
                  GoogleSignInHelper().handleGoogleSignIn(context);
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
}
