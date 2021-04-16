import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogDetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: hh(context, 259),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: hh(context, 66)),
          headerButtons(context),
          SizedBox(height: hh(context, 24)),
          paddingHorizontal(
            context,
            child: Text(
              "Four Things Every Woman Needs To Know",
              style: TextStyle(
                fontSize: hh(context, 24),
                fontWeight: FontWeight.w700,
                color: Clrs.textBlueDark,
              ),
            ),
          ),
          Spacer(),
          headerUserInfo(context),
        ],
      ),
    );
  }
}

Widget headerUserInfo(BuildContext context) => paddingHorizontal(
      context,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              width: ww(context, 155),
              height: hh(context, 39),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(hh(context, 12)),
                    child: Image.asset(
                      "assets/images/User2.png",
                      width: hh(context, 39),
                      height: hh(context, 39),
                    ),
                  ),
                  SizedBox(width: ww(context, 16)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Richard Gervain",
                        style: TextStyle(
                          fontSize: hh(context, 14),
                          fontWeight: FontWeight.w500,
                          color: Clrs.textBlueDark,
                        ),
                      ),
                      Text(
                        "2m ago",
                        style: TextStyle(
                          fontSize: hh(context, 12),
                          fontWeight: FontWeight.w400,
                          color: Clrs.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            width: ww(context, 64),
            child: Row(
              children: [
                Container(
                  width: ww(context, 24),
                  child: SvgPicture.asset(
                    "assets/icons/Send.svg",
                  ),
                ),
                Spacer(),
                Container(
                  width: ww(context, 24),
                  child: SvgPicture.asset(
                    "assets/icons/Bookmark.svg",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget headerButtons(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: ww(context, 32)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()));
            },
            child: Container(
              width: ww(context, 32),
              height: ww(context, 32),
              child: SvgPicture.asset(
                "assets/icons/ChevronLeft.svg",
                color: Clrs.darkBlue,
              ),
            ),
          ),
          Container(
            width: ww(context, 32),
            height: ww(context, 32),
            child: SvgPicture.asset(
              "assets/icons/More.svg",
              color: Clrs.darkBlue,
            ),
          ),
        ],
      ),
    );
