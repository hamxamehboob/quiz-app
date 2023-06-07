import 'package:cloud_firestore/cloud_firestore.dart';

class QuizQuestions {
  static Future<List> getQuestionsList(String quizId) async {
    List<dynamic> allData = [];
    await FirebaseFirestore.instance
        .collection("quizzes")
        .doc(quizId)
        .collection("Questions")
        .get()
        .then((value) {
      allData = value.docs.map((doc) => doc.data()).toList();
    });
    return allData;
  }
}
