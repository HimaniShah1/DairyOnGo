import 'package:dairyongo/utils/dimensions.dart';
import 'package:dairyongo/widgets/app_column.dart';
import 'package:dairyongo/widgets/big_text.dart';
import 'package:dairyongo/widgets/icon_and_text_widget.dart';
import 'package:dairyongo/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomeSlideshow extends StatefulWidget {
  const HomeSlideshow({Key? key}) : super(key: key);

  @override
  State<HomeSlideshow> createState() => _HomeSlideshowState();
}

class _HomeSlideshowState extends State<HomeSlideshow> {
  PageController pageController = PageController(
      viewportFraction:
          0.85); //parameter shows how much of the next slideshow should be visible in the current one
  var _currPageValue = 0.0;
  double scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          height: Dimensions.pageView,
          //  color: Colors.red,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),

        //Dots indicator for the slideshow
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        SizedBox(
          height: Dimensions.height30,
        ),

        //Recommended text
        Container(
            margin: EdgeInsets.only(left: Dimensions.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: 'Recommended'),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: ".", color: Colors.black26),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: 'Frequently bought'),
                )
              ],
            )),

        //list of products and images

        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    //image section
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage("assets/images/amul_toned_milk.png"),
                        ),
                      ),
                    ),

                    //text container
                    Expanded(
                      child: Container(
                          height: Dimensions.listViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: 'Moti Toned Milk from Amul'),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  SmallText(text: 'Get your calcium needs'),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidget(
                                          icon: Icons.coffee_rounded,
                                          text: 'Milk',
                                          iconColor: Color.fromARGB(
                                              255, 102, 172, 208)),
                                      IconAndTextWidget(
                                          icon: Icons.location_on,
                                          text: 'Amul',
                                          iconColor: Color.fromARGB(
                                              255, 102, 172, 208)),
                                      IconAndTextWidget(
                                          icon: Icons.water_drop,
                                          text: '500 ml',
                                          iconColor: Color.fromARGB(
                                              255, 102, 172, 208))
                                    ],
                                  )
                                ]),
                          )),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

//Container of the slideshow where image of the product lies

  Widget _buildPageItem(int index) {
    //For scaling the slideshow we need to call an api of flutter called matrix4
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (_currPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        //image container
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions
                  .width10), //creates space btw two slideshow containers
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Colors.blue : Colors.purple,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/amul_toned_milk.png"))),
        ),

        //text container
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  )
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.height15,
                  right: Dimensions.height15),
              child: AppColumn(
                text: 'Moti Toned Milk',
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
