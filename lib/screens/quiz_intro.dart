import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

// ignore: must_be_immutable
class QuizIntro extends StatefulWidget {
  String quizName;
  String quizImgUrl;
  String quizTopics;
  String quizDuration;
  String quizAbout;
  String quizId;
  String instructions;

  QuizIntro(
      {super.key,
      required this.instructions,
      required this.quizAbout,
      required this.quizDuration,
      required this.quizImgUrl,
      required this.quizName,
      required this.quizTopics,
      required this.quizId});

  @override
  _QuizIntroState createState() => _QuizIntroState();
}

class _QuizIntroState extends State<QuizIntro> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7558ff)),
          child: const Text(
            "START QUIZ",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => QuizPage(
                          quizId: widget.quizId,
                        )));
          },
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF7558ff),
          title: Text(widget.quizName),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                ),
                Image.network(
                  widget.quizImgUrl,
                  fit: BoxFit.cover,
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.topic_outlined),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Related To -",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text(
                        widget.quizTopics,
                        style: const TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.topic_outlined),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Duration -",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text(
                        "${widget.quizDuration} Minutes",
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.topic_outlined),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Instructions -",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text(
                        widget.instructions,
                        style: const TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
