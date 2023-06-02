import 'package:cloud_firestore/cloud_firestore.dart';

class QuizQuestions {
  static Future<dynamic> generateQuizQue(String quizId) async {
    late Map queData;
    await FirebaseFirestore.instance
        .collection("quizzes")
        .doc("Flutter")
        .collection("Questions")
        .get()
        .then((value) {
      queData = value.docs.elementAt(0).data();
    });
    print("QUIZ DATA========== ${queData}");
    return queData;
  }
}
