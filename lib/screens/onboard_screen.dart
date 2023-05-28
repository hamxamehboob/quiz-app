import 'package:flutter/material.dart';
import 'package:quiz_app/screens/login_screen.dart';
import 'package:quiz_app/screens/sign_up_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          SizedBox(
            height: size.height * .01,
          ),
          SizedBox(
            height: size.height * .5,
            child: PageView(
              controller: _controller,
              children: [
                Image.asset("assets/images/splash_image3.png"),
                Image.asset("assets/images/splash_image2.png"),
                Image.asset("assets/images/splash_image4.png"),
              ],
            ),
          ),
          const Text(
            "Create,share and play quizzes whenever and wherever you want",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: size.height * .02),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                dotWidth: size.width * .03,
                activeDotColor: const Color(0xFF6949ff),
                dotHeight: size.height * .01,
              ),
            ),
          ),
          SizedBox(
            height: size.height * .08,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const SignUpPage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .36, vertical: size.height * .014),
              decoration: BoxDecoration(
                  color: const Color(0xFF6949ff),
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "GET STARTED",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginPage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .21, vertical: size.height * .014),
              decoration: BoxDecoration(
                  color: const Color(0xFFf0edff),
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "I ALREADY HAVE AN ACCOUNT",
                style: TextStyle(
                    color: Color(0xFF6949ff),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
