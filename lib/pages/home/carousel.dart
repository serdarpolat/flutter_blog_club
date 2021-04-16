import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController pageCtrl;
  int currentPage = 0;

  @override
  void initState() {
    pageCtrl = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: hh(context, 330),
      child: PageView.builder(
        controller: pageCtrl,
        onPageChanged: (val) {
          setState(() {
            currentPage = val;
          });
        },
        itemBuilder: (context, index) {
          return carouselItem(
            context,
            currentPage: currentPage,
            index: index,
            item: carouselItems[index],
          );
        },
        itemCount: 3,
      ),
    );
  }
}

class CarouselModel {
  String img;
  String title;

  CarouselModel(this.img, this.title);
}

List<CarouselModel> carouselItems = [
  CarouselModel("Img3.png", "Technology"),
  CarouselModel("Img2.png", "Adventure"),
  CarouselModel("Img1.png", "Nature"),
];

Widget carouselItem(BuildContext context,
        {int currentPage, int index, CarouselModel item}) =>
    AnimatedContainer(
      duration: Duration(milliseconds: 240),
      width: ww(context, 236),
      height: hh(context, currentPage == index ? 273 : 244),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: ww(context, 41.28),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 240),
              width: ww(context, 153.44),
              height: hh(context, currentPage == index ? 273 : 244),
              decoration: BoxDecoration(
                color: Clrs.textDark,
                boxShadow: [
                  BoxShadow(
                    color: Clrs.textDark.withOpacity(0.44),
                    offset: Offset(0, hh(context, 16)),
                    blurRadius: hh(context, 32),
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  ww(context, 28),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 240),
            width: ww(context, 236),
            height: hh(context, currentPage == index ? 273 : 244),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ww(context, 28)),
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/${item.img}",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 240),
            left: 0,
            bottom: hh(context, currentPage == index ? 57 : 86),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 240),
              width: ww(context, 236),
              height: hh(context, currentPage == index ? 273 : 244),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: ww(context, 25), bottom: hh(context, 25)),
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: Clrs.white,
                    fontSize: hh(context, 18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Clrs.textDark,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(ww(context, 28))),
              ),
            ),
          ),
        ],
      ),
    );
