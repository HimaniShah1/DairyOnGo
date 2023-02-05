import 'package:dairyongo/widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: text,
        color: Colors.black,
        size: Dimensions.font26,
      ),
      SizedBox(
        height: Dimensions.height10,
      ), //height between 2 rows of text

      //comments section
      Row(
        children: [
          Wrap(
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 15,
                    )),
          ),
          SizedBox(
            width: 10,
          ),
          SmallText(text: '4.5'),
          SizedBox(
            width: 10,
          ),
          SmallText(text: '1287'),
          SizedBox(
            width: 10,
          ),
          SmallText(text: 'comments')
        ],
      ),
      SizedBox(
        height: Dimensions.height20,
      ),

      //product, supplier, quantity
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconAndTextWidget(
              icon: Icons.coffee_rounded,
              text: 'Milk',
              iconColor: Color.fromARGB(255, 102, 172, 208)),
          IconAndTextWidget(
              icon: Icons.location_on,
              text: 'Amul',
              iconColor: Color.fromARGB(255, 102, 172, 208)),
          IconAndTextWidget(
              icon: Icons.water_drop,
              text: '500 ml',
              iconColor: Color.fromARGB(255, 102, 172, 208))
        ],
      )
    ]);
  }
}
