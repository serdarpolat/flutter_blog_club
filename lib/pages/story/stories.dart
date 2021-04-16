import 'dart:ui';

import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
        color: Clrs.blue,
        child: Column(
          children: [
            StorySlide(),
            readMore(context),
          ],
        ),
      ),
    );
  }
}

Widget readMore(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ww(context, 33), vertical: hh(context, 16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: ww(context, 42),
          ),
          Container(
            width: ww(context, 121),
            height: hh(context, 61),
            child: Column(
              children: [
                Icon(Icons.expand_less, color: Clrs.white),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => BlogDetail()));
                  },
                  minWidth: ww(context, 121),
                  elevation: 0,
                  height: hh(context, 40),
                  color: Clrs.white,
                  textColor: Clrs.blue,
                  child: Text(
                    "Read More",
                    style: TextStyle(
                      fontSize: hh(context, 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ww(context, 12)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ww(context, 42),
            height: hh(context, 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  "assets/icons/HeartFill.svg",
                ),
                Text(
                  "450k",
                  style: TextStyle(
                    color: Clrs.white,
                    fontSize: hh(context, 16),
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
