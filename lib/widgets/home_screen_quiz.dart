import 'package:flutter/material.dart';
import '../screens/quiz_intro.dart';

class HomePageQuizCart extends StatelessWidget {
  final String imageurl;
  final String title;
  final String description;
  final String quizId;
  final String topic;
  final String duration;
  final String instructions;

  const HomePageQuizCart({
    Key? key,
    required this.imageurl,
    required this.instructions,
    required this.title,
    required this.description,
    required this.quizId,
    required this.topic,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => QuizIntro(
                quizAbout: description,
                quizId: quizId,
                quizImgUrl: imageurl,
                quizName: title,
                quizDuration: duration,
                quizTopics: topic,
                instructions: instructions,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image.network(
                  imageurl,
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
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
