import 'package:flutter/material.dart';

import '../firebase_service/home_fire.dart';
import '../widgets/home_screen_quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List quizzes = [];
  getquiz() async {
    await HomeFire.getquizzes().then((returned_quizzes) {
      setState(() {
        quizzes = returned_quizzes;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getquiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomePageQuizCart(
            imageurl: '',
          ),
          HomePageQuizCart(
            imageurl: '',
          ),
          HomePageQuizCart(
            imageurl: '',
          ),
          HomePageQuizCart(
            imageurl: '',
          ),
          HomePageQuizCart(
            imageurl: '',
          ),
        ],
      ),
    ));
  }
}
