import 'package:dairyongo/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

//Created a custom widget for texts on the app

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText(
      {Key? key,
      this.color = const Color(0xFF444444),
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: overFlow,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: color,
              fontSize: size == 0 ? Dimensions.font20 : size,
              fontWeight: FontWeight.w400),
        ));
  }
}
