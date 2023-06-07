import 'package:flutter/material.dart';

import '../firebase_service/home_fire.dart';
import '../widgets/home_screen_quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<dynamic>> quizzesFuture;

  @override
  void initState() {
    super.initState();
    quizzesFuture = HomeFire.getquizzes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder<List<dynamic>>(
                  future: quizzesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: LinearProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error occurred while fetching quizzes.'),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return HomePageQuizCart(
                            imageurl: snapshot.data![index]['quiz_thumbnail'],
                            description: snapshot.data![index]['about_quiz'],
                            title: snapshot.data![index]['quiz_name'],
                            quizId: snapshot.data![index]['quiz_id'],
                            duration: snapshot.data![index]['duration'],
                            topic: snapshot.data![index]['topics'],
                            instructions: snapshot.data![index]['instructions'],
                          );
                        },
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                      );
                    } else {
                      return const Center(
                        child: Text('No quizzes found.'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
