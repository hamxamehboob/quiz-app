import 'package:flutter/material.dart';
import 'package:quiz_app/firebase_service/quiz_questions.dart';
import 'home_screen.dart';
import 'winning_screen.dart';

class QuizPage extends StatefulWidget {
  final String quizId;

  QuizPage({required this.quizId, Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> questions = [];
  int currentQuestionIndex = 0;

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

  void checkAnswer(String selectedOption) {
    final currentQuestion = questions[currentQuestionIndex];
    final correctAnswer = currentQuestion['correct_answer'];

    if (selectedOption == correctAnswer) {
      if (currentQuestionIndex == questions.length - 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WinPage()),
        );
      } else {
        setState(() {
          currentQuestionIndex++;
        });
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ElevatedButton(
        child: const Text(
          "QUIT GAME",
          style: TextStyle(fontSize: 27),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        },
      ),
      body: questions.isEmpty
          ? Center(child: const CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
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
                    checkAnswer(
                        questions[currentQuestionIndex]["option1"].toString());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(14),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
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
                    checkAnswer(
                        questions[currentQuestionIndex]["option2"].toString());
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(34)),
                      child: Text(
                        "B. ${questions[currentQuestionIndex]["option2"].toString()}",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    checkAnswer(
                        questions[currentQuestionIndex]["option3"].toString());
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(34)),
                      child: Text(
                        "C. ${questions[currentQuestionIndex]["option3"].toString()}",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    checkAnswer(
                        questions[currentQuestionIndex]["option4"].toString());
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(34)),
                      child: Text(
                        "D. ${questions[currentQuestionIndex]["option4"].toString()}",
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
    );
  }
}
