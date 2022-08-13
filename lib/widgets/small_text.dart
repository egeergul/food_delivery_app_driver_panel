import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color color;
  double size;
  double height;

  SmallText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
        fontSize: size,
        height: height,
      ),
    );
  }
}
