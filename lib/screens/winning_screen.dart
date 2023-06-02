import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'home_screen.dart';

class WinPage extends StatefulWidget {
  const WinPage({Key? key}) : super(key: key);

  @override
  _WinPageState createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    setState(() {
      initController();
    });
    confettiController.play();
  }

  void initController() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text("CONGRATULATIONS!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("YOUR ANSWER IS CORRECT",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        child: Image.asset("assets/images/win_image.jpg")),
                    ElevatedButton(
                      child: Text("Next"),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      },
                    )
                  ])),
              buildConfettiWidget(confettiController, pi / 2),
            ],
          ),
        ));
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(40, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 20,
        minBlastForce: 8,
        emissionFrequency: 0.2,
        numberOfParticles: 8,
        gravity: 0.01,
      ),
    );
  }
}
