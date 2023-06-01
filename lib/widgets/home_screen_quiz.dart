import 'package:flutter/material.dart';

import '../firebase_service/home_fire.dart';
import '../screens/quiz_intro.dart';

class HomePageQuizCart extends StatefulWidget {
  final String imageurl;
  const HomePageQuizCart({super.key, required this.imageurl});

  @override
  State<HomePageQuizCart> createState() => _HomePageQuizCartState();
}

class _HomePageQuizCartState extends State<HomePageQuizCart> {
  Future<dynamic> getquiz() async {
    var returrnedQuiz = await HomeFire.getquizzes().then((returned_quizzes) {
      return returned_quizzes;
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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: FutureBuilder(
          future: getquiz(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => QuizIntro(
                            quizAbout: snapshot.data[0]["about_quiz"],
                            quizDuration: snapshot.data[0]["duration"],
                            quizId: 'snapshot.data[0]["About_quiz"],',
                            quizImgUrl: snapshot.data[0]["quiz_thumbnail"],
                            quizName: snapshot.data[0]["quiz_name"],
                            quizTopics: snapshot.data[0]["topics"],
                          )));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Image.network(
                          widget.imageurl,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Container(
                          color: Colors.black26,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data[0]["quiz_name"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  snapshot.data[0]["about_quiz"],
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
