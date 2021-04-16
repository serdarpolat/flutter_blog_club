import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    PageController pageTopCtrl = PageController();
    PageController pageBottomCtrl = PageController();
    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
        child: BlocConsumer<OnboardingpageCubit, OnboardingpageState>(
          listener: (context, state) {
            pageTopCtrl.animateToPage(state.page,
                duration: Duration(milliseconds: 240), curve: Curves.easeInOut);
            pageBottomCtrl.animateToPage(state.page,
                duration: Duration(milliseconds: 240), curve: Curves.easeInOut);
          },
          builder: (context, state) {
            return Stack(
              children: [
                topLayout(context, s, pageCtrl: pageTopCtrl),
                bottomLayout(context, s,
                    pageCtrl: pageBottomCtrl, state: state),
              ],
            );
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.white,
              Color(0xFFF4F7FF),
            ],
          ),
        ),
      ),
    );
  }
}

Widget topLayout(BuildContext context, Size s, {PageController pageCtrl}) =>
    Positioned(
      top: hh(context, 30),
      left: 0,
      child: Container(
        width: s.width,
        height: hh(context, 332.07) + ww(context, 120),
        child: PageView.builder(
          controller: pageCtrl,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: hh(context, 60),
                horizontal: ww(context, 40),
              ),
              child: ImageLayout(),
            );
          },
          itemCount: 4,
        ),
      ),
    );

Widget bottomLayout(BuildContext context, Size s,
        {PageController pageCtrl, OnboardingpageState state}) =>
    Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: s.width,
        height: hh(context, 324),
        child: Column(
          children: [
            Container(
              width: s.width,
              height: hh(context, 146 + 59.0),
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: ww(context, 40),
                      right: ww(context, 40),
                      top: hh(context, 32),
                      bottom: hh(context, 27),
                    ),
                    child: message(context),
                  );
                },
                itemCount: 4,
                controller: pageCtrl,
              ),
            ),
            navigator(context, pageCtrl: pageCtrl, state: state),
          ],
        ),
        decoration: BoxDecoration(
          color: Clrs.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          boxShadow: [
            BoxShadow(
              color: Clrs.blue.withOpacity(0.07),
              offset: Offset(0, -hh(context, 25)),
              blurRadius: ww(context, 32),
            ),
          ],
        ),
      ),
    );

class ImageLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ww(context, 295),
      height: hh(context, 332.07),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: image(context, large: false, img: "assets/images/Img4.png"),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: image(context, large: true, img: "assets/images/Img3.png"),
          ),
          Positioned(
            top: hh(context, 157.75 + 16.51),
            left: 0,
            child: image(context, large: true, img: "assets/images/Img2.png"),
          ),
          Positioned(
            top: hh(context, 157.75 + 16.51),
            right: 0,
            child: image(context, large: false, img: "assets/images/Img1.png"),
          ),
        ],
      ),
    );
  }
}

Widget image(BuildContext context, {bool large, String img}) => Container(
      width: ww(context, large ? 190.82 : 92.12),
      height: hh(context, 157.75),
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
            width: ww(context, large ? 166.81 : 76.42),
            height: hh(context, 157.75),
            decoration: BoxDecoration(
              color: Clrs.textDark,
              borderRadius: BorderRadius.circular(hh(context, 24)),
              boxShadow: [
                BoxShadow(
                  color: Clrs.textDark.withOpacity(0.7),
                  offset: Offset(0, hh(context, 16)),
                  blurRadius: hh(context, 32),
                ),
              ],
            ),
          ),
          Container(
            width: ww(context, large ? 190.82 : 92.12),
            height: hh(context, 157.75),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(hh(context, 24)),
              image: DecorationImage(
                image: AssetImage(
                  img,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );

Widget message(BuildContext context) => Container(
      width: ww(context, 295),
      height: hh(context, 146),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: ww(context, 275),
            child: Text(
              "Read the article you want instantly!",
              style: TextStyle(
                fontSize: hh(context, 24),
                fontWeight: FontWeight.w700,
                color: Clrs.textDark,
                height: 1.5,
              ),
            ),
          ),
          Spacer(),
          Text(
            "You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.",
            style: TextStyle(
              fontSize: hh(context, 14),
              fontWeight: FontWeight.w400,
              color: Clrs.textBlueDark,
              height: 1.5,
            ),
          ),
        ],
      ),
    );

Widget navigator(BuildContext context,
        {PageController pageCtrl, OnboardingpageState state}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: ww(context, 40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Dots(),
          InkWell(
            onTap: () {
              if (state.page == 3) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login()),
                );
              } else {
                BlocProvider.of<OnboardingpageCubit>(context).incrementPage();
              }
            },
            child: Container(
              width: ww(context, 88),
              height: hh(context, 60),
              child: Center(
                child: SvgPicture.asset("assets/icons/ArrowRight.svg"),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ww(context, 12),
                ),
                color: Clrs.blue,
              ),
            ),
          )
        ],
      ),
    );

Widget dot(BuildContext context, {bool isActive}) => AnimatedContainer(
      duration: Duration(milliseconds: 240),
      width: isActive ? ww(context, 23) : hh(context, 8),
      height: hh(context, 8),
      decoration: BoxDecoration(
        color: isActive ? Clrs.blue : Clrs.lightBlueGrey,
        borderRadius: BorderRadius.circular(8),
      ),
    );

class Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ww(context, 71),
      height: hh(context, 8),
      child: BlocBuilder<OnboardingpageCubit, OnboardingpageState>(
        builder: (context, state) {
          return Row(
            children: List.generate(4, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index != 3 ? hh(context, 8) : 0,
                ),
                child: dot(context, isActive: state.page == index),
              );
            }),
          );
        },
      ),
    );
  }
}
