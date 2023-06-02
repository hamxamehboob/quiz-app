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
  // Questions questionModel = new Questions();
  Future genQue() async {
    var ques=[];
    ques=await QuizQuestions.getQuestionsList("Flutter");

    if(ques.isEmpty){
      return [{
        "question": "EMPTY",
        "correct_answer": "EMPTY",
        "option1": "EMPTY",
        "option2": "EMPTY",
        "option3": "EMPTY",
        "option4": "EMPTY",
      }];
    }
    return ques;

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
      body: FutureBuilder(
        future: genQue(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {

        return Column(
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
                  // "questionModel.questions",
                  snapshot.data[0]["question"].toString()??'',
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
                  "A. ${snapshot.data[0]["option1"].toString()??''}",
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
                child:  Text(
                  "B. ${snapshot.data[0]["option2"].toString()??''}",
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
                child:  Text(
                  "C. ${snapshot.data[0]["option3"].toString()??''}",
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
                child:  Text(
                  "D. ${snapshot.data[0]["option4"].toString()??''}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          ],
        );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
