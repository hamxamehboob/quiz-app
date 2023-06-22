import 'package:flutter/material.dart';

import 'package:quiz_app/views/sign_up_screen.dart';
import 'package:quiz_app/utils/google_button.dart';

import '../controllers/sign_in_with_google.dart';
import '../constants/colors.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  login(_emailtextcontroller.text, _pwtextcontroller.text,
                      context);
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
}
