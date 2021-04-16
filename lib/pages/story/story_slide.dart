import 'dart:ui';

import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorySlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: hh(context, 685),
      child: Stack(
        children: [
          gradientMask(context),
          Column(
            children: [
              storyHeader(context, s),
              Spacer(),
              blogIntro(context),
              SizedBox(height: hh(context, 40)),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(ww(context, 28))),
        image: DecorationImage(
          image: AssetImage("assets/images/User6.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

Widget blogIntro(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(ww(context, 18)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          width: ww(context, 295),
          height: hh(context, 200),
          padding: EdgeInsets.all(ww(context, 32)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ww(context, 18)),
            color: Color(0xff8C8C8C).withOpacity(0.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Do You Want To Live A Happy Life? Smile.",
                style: TextStyle(
                  color: Clrs.white,
                  fontSize: hh(context, 18),
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),
              Spacer(),
              Text(
                "Sometimes there’s no reason to smile, but I’ll smile anyway because of life. Yes, I’m one of those people who always smiles.",
                style: TextStyle(
                  color: Clrs.white,
                  fontSize: hh(context, 14),
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget storyHeader(BuildContext context, Size s) => Container(
      width: s.width,
      height: hh(context, 142),
      child: Column(
        children: [
          SizedBox(height: hh(context, 60)),
          slideBar(context),
          SizedBox(height: hh(context, 24)),
          userInfo(context),
        ],
      ),
    );

Widget userInfo(BuildContext context) => paddingHorizontal(
      context,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ww(context, 18)),
            child: Image.asset(
              "assets/images/User3.png",
              width: ww(context, 51),
              height: ww(context, 51),
            ),
          ),
          SizedBox(width: ww(context, 16)),
          Container(
            height: hh(context, 51),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Jasmine Levin",
                  style: TextStyle(
                    fontSize: hh(context, 16),
                    fontWeight: FontWeight.w600,
                    color: Clrs.white,
                  ),
                ),
                Text(
                  "4m ago",
                  style: TextStyle(
                    fontSize: hh(context, 12),
                    fontWeight: FontWeight.w400,
                    color: Clrs.white,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: ww(context, 32),
              height: ww(context, 32),
              padding: EdgeInsets.all(6),
              child: SvgPicture.asset(
                "assets/icons/Close.svg",
              ),
            ),
          ),
        ],
      ),
    );

Widget slideBar(BuildContext context) => paddingHorizontal(
      context,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: ww(context, 93),
            height: hh(context, 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Clrs.white,
            ),
          ),
          Container(
            width: ww(context, 93),
            height: hh(context, 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Clrs.white.withOpacity(0.3),
            ),
          ),
          Container(
            width: ww(context, 93),
            height: hh(context, 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Clrs.white.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );

Widget gradientMask(BuildContext context) => Container(
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(ww(context, 28))),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.58),
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.27),
              ])),
    );
