import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
    required this.route,
  }) : super(key: key);
  final GestureTapCallback route;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: route,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .23, vertical: size.height * .014),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/google_icon.png",
              height: size.height * .03,
            ),
            SizedBox(
              width: size.width * 0.13,
            ),
            Text(
              "Google",
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
