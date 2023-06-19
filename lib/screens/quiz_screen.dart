import 'package:flutter/material.dart';

import '../helpers/dialogs.dart';
import '../service/quiz_questions.dart';
import 'lost_screen.dart';
import 'winning_screen.dart';

class QuizPage extends StatefulWidget {
  final String quizId;

  const QuizPage({required this.quizId, Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> questions = [];
  int currentQuestionIndex = 0;
  Color optionAColor = Colors.black.withOpacity(0.4);
  Color optionBColor = Colors.black.withOpacity(0.4);
  Color optionCColor = Colors.black.withOpacity(0.4);
  Color optionDColor = Colors.black.withOpacity(0.4);

  @override
  void initState() {
    super.initState();
    genQue();
  }

  Future<void> genQue() async {
    var ques = await QuizQuestions.getQuestionsList(widget.quizId);
    setState(() {
      questions = List<Map<String, dynamic>>.from(ques);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7558ff)),
          child: const Text(
            "QUIT QUIZ",
            style: TextStyle(fontSize: 27),
          ),
          onPressed: () {
            Dialogs.showQuitGameDialog(context);
          },
        ),
        body: questions.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Question: ${currentQuestionIndex + 1}',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      questions[currentQuestionIndex]["question"].toString(),
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      checkAnswer(questions[currentQuestionIndex]["option1"]
                          .toString());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                        color: optionAColor,
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: Text(
                        "A. ${questions[currentQuestionIndex]["option1"].toString()}",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      checkAnswer(questions[currentQuestionIndex]["option2"]
                          .toString());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                        color: optionBColor,
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: Text(
                        "B. ${questions[currentQuestionIndex]["option2"].toString()}",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      checkAnswer(questions[currentQuestionIndex]["option3"]
                          .toString());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                        color: optionCColor,
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: Text(
                        "C. ${questions[currentQuestionIndex]["option3"].toString()}",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      checkAnswer(questions[currentQuestionIndex]["option4"]
                          .toString());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                        color: optionDColor,
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: Text(
                        "D. ${questions[currentQuestionIndex]["option4"].toString()}",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void checkAnswer(String selectedOption) {
    final currentQuestion = questions[currentQuestionIndex];
    final correctAnswer = currentQuestion['correct_answer'];

    if (selectedOption == correctAnswer) {
      setState(() {
        if (selectedOption ==
            questions[currentQuestionIndex]["option1"].toString()) {
          optionAColor = Colors.green;
        } else if (selectedOption ==
            questions[currentQuestionIndex]["option2"].toString()) {
          optionBColor = Colors.green;
        } else if (selectedOption ==
            questions[currentQuestionIndex]["option3"].toString()) {
          optionCColor = Colors.green;
        } else if (selectedOption ==
            questions[currentQuestionIndex]["option4"].toString()) {
          optionDColor = Colors.green;
        }
      });

      Future.delayed(const Duration(seconds: 1), () {
        if (currentQuestionIndex == questions.length - 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const WinPage()),
          );
        } else {
          setState(() {
            currentQuestionIndex++;
            optionAColor = Colors.black.withOpacity(0.4);
            optionBColor = Colors.black.withOpacity(0.4);
            optionCColor = Colors.black.withOpacity(0.4);
            optionDColor = Colors.black.withOpacity(0.4);
          });
        }
      });
    } else {
      setState(() {
        if (selectedOption ==
            questions[currentQuestionIndex]["option1"].toString()) {
          optionAColor = Colors.red;
        } else if (selectedOption ==
            questions[currentQuestionIndex]["option2"].toString()) {
          optionBColor = Colors.red;
        } else if (selectedOption ==
            questions[currentQuestionIndex]["option3"].toString()) {
          optionCColor = Colors.red;
        } else if (selectedOption ==
            questions[currentQuestionIndex]["option4"].toString()) {
          optionDColor = Colors.red;
        }
      });

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoserPage()),
        );
      });
    }
  }
}
