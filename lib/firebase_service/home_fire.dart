import 'package:cloud_firestore/cloud_firestore.dart';

class HomeFire {
  static Future<List<Map<String, dynamic>>> getquizzes() async {
    List<Map<String, dynamic>> allQuiz = [];
    await FirebaseFirestore.instance
        .collection("quizzes")
        .get()
        .then((querySnapshot) {
      for (var quiz in querySnapshot.docs) {
        Map<String, dynamic> myQuiz = quiz.data();
        myQuiz['QuizId'] = quiz.reference.id;
        // print(quiz.data());
        allQuiz.add(myQuiz);
      }
    });
    return allQuiz;
  }
}
