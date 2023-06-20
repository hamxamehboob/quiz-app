import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quiz_app/views/sign_up_screen.dart';
import 'package:quiz_app/widgets/google_button.dart';

import '../Utils/sign_in_with_google.dart';
import '../constants/colors.dart';
import '../Utils/dialogs.dart';
import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _pwKey = GlobalKey<FormState>();
  final TextEditingController _emailtextcontroller = TextEditingController();
  final TextEditingController _pwtextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
              left: size.width * .07,
              top: size.height * .03,
              right: size.height * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .03,
              ),
              const Text(
                "Hello there 👋",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * .07,
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
                              color: AppColor.purpleColor, width: 2))),
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
                        color: AppColor.purpleColor,
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
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
                            BorderSide(color: AppColor.purpleColor, width: 2),
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
                      color: AppColor.purpleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: size.height * .2,
              ),
              GestureDetector(
                onTap: () {
                  validate();
                  login();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .36,
                      vertical: size.height * .014),
                  decoration: BoxDecoration(
                      color: AppColor.purpleColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "Sign In",
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
                  const Text("Don't have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "SignUp",
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
                      "Or login with",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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
    );
  }

  void validate() {
    if (_pwKey.currentState!.validate() ||
        _emailKey.currentState!.validate()) {}
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

  void login() async {
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailtextcontroller.text, password: _pwtextcontroller.text);

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

    setState(() {});
  }
}