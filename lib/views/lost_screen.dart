import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/views/home_screen.dart';

class LoserPage extends StatelessWidget {
  const LoserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Oh Sorry!",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              const Text(
                "YOUR ANSWER IS INCORRECT",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 25,
              ),
              const Icon(Icons.error_outline, size: 100, color: Colors.black),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.purpleColor),
                child: const Text("Go To Home Page"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
