// import 'dart:html';

import 'package:flutter/material.dart';

import '../firebase_service/home_fire.dart';
import '../widgets/home_screen_quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<dynamic> getquiz() async {
    var returrnedQuiz = await HomeFire.getquizzes().then((returnedQuizzes) {
      return returnedQuizzes;
    });
    return returrnedQuiz;
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
          FutureBuilder(
            future: getquiz(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return HomePageQuizCart(
                      imageurl: snapshot.data[1]['quiz_thumbnail'],
                    );
                  },
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
