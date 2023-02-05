import 'package:dairyongo/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

//Created a custom widget for texts on the app

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      this.color = const Color(0xFFa9a29f),
      required this.text,
      this.size = 0,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: color,
              fontSize: size == 0 ? Dimensions.font12 : size,
              height: height),
        ));
  }
}
