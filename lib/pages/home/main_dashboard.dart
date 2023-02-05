import 'package:dairyongo/pages/home/home_slideshow.dart';
import 'package:dairyongo/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //header of the dashboard
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //state and city
                    Column(
                      children: [
                        BigText(text: 'Gujarat', color: Colors.blue),
                        Row(
                          children: [
                            SmallText(text: 'Vadodara', color: Colors.blueGrey),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        ),
                      ],
                    ),

                    //search icon
                    Center(
                      child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        child: Icon(Icons.search,
                            color: Colors.white, size: Dimensions.iconSize24),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: HomeSlideshow(),
          )),
        ],
      ),
    );
  }
}
