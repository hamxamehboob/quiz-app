import 'package:flutter/material.dart';
import 'package:quiz_app/firebase_service/home_fire.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _HomePageState();
}

class _HomePageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ElevatedButton(
        child: Text(
          "QUIT GAME",
          style: TextStyle(fontSize: 27),
        ),
        onPressed: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(
          //   height: 100,
          //   width: 100,
          //   child: Stack(
          //     fit: StackFit.expand,
          //     children: [
          //       CircularProgressIndicator(
          //         strokeWidth: 12,
          //         backgroundColor: Colors.green,
          //       ),
          //       Center(
          //           child: Text(
          //         "46",
          //         style: TextStyle(
          //             fontSize: 45,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white),
          //       ))
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "Which of the Following is use for Cross Platform Application making? ",
                style: TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(34)),
              child: const Text(
                "A. C++",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(34)),
              child: const Text(
                "B. Flutter",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(34)),
              child: const Text(
                "C. Photoshop",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(34)),
              child: const Text(
                "D. Enginnering",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
