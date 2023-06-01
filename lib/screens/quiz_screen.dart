import 'package:flutter/material.dart';
import 'package:quiz_app/firebase_service/home_fire.dart';
import 'package:quiz_app/firebase_service/quiz_questions.dart';

import '../models/questions.dart';

class QuizPage extends StatefulWidget {
  String QuizId;
  QuizPage({
    required this.QuizId,
    super.key,
  });

  @override
  State<QuizPage> createState() => _HomePageState();
}

class _HomePageState extends State<QuizPage> {
  Questions questionModel = new Questions();
  genQue() async {
    QuizQuestions.generateQuizQue("Flutter").then((queData) {
      setState(() {
        questionModel.questions = queData["questions"];
        questionModel.correctAns = queData["correct_answer"];
        List options = [
          queData["option1"],
          queData["option2"],
          queData["option3"],
          queData["option4"],
        ];
        options.shuffle();
        questionModel.option1 = options[0];
        questionModel.option2 = options[1];
        questionModel.option3 = options[2];
        questionModel.option4 = options[3];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    genQue();
  }

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
              child: Text(
                questionModel.questions,
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
              child: Text(
                "A. ${questionModel.option1}",
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
