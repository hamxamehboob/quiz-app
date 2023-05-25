import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/widgets/google_button.dart';

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
        body: Padding(
          padding: EdgeInsets.only(
              left: size.width * .07,
              top: size.height * .1,
              right: size.height * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello there 👋",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * .07,
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: _emailKey,
                child: TextFormField(
                  controller: _emailtextcontroller,
                  validator: emailValidate,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Enter your email address",
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF7558ff), width: 2))),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Text(
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
                      suffixIcon: IconButton(
                        color: const Color(0xFF7558ff),
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
                      enabledBorder: UnderlineInputBorder(
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
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Color(0xFF7558ff),
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
                      color: Color(0xFF6949ff),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Sign In",
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
              GoogleButton(route: () {}),
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
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailtextcontroller.text,
              password: _pwtextcontroller.text)
          .then((value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      });
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong - password') {}
    }
    setState(() {});
  }
}
