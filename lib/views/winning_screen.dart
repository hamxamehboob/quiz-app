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
    setState(
      () {
        initController();
      },
    );
    confettiController.play();
  }

  void initController() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("CONGRATULATIONS!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                const Text("YOUR ANSWERs ARE CORRECT",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset("assets/images/win_image.jpg")),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7558ff)),
                  child: const Text("Back to Home Screen"),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  },
                )
              ]),
              buildConfettiWidget(confettiController, pi / 2),
            ],
          )),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: const Size(40, 30),
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
