import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget categoriedList(BuildContext context, Size s) => Container(
      width: s.width,
      height: hh(context, 192),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          categoriedListCard(
            context,
            img: "assets/images/Img5.png",
            title: "BIG DATA",
            subtitle: "Why Big Data Needs Thick Data?",
          ),
        ],
      ),
    );

Widget categoriedListHeader(BuildContext context) => paddingHorizontal(
      context,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Latest News",
            style: TextStyle(
              color: Clrs.textDark,
              fontSize: hh(context, 20),
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "More",
              style: TextStyle(
                color: Clrs.blue,
                fontSize: hh(context, 14),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

Widget categoriedListCard(BuildContext context,
        {String img, String title, String subtitle}) =>
    paddingHorizontal(
      context,
      child: Container(
        width: ww(context, 295),
        height: hh(context, 141),
        child: Row(
          children: [
            categoriedListCardImage(context, img: img),
            SizedBox(width: ww(context, 20)),
            categoriedListCardInfo(context, title: title, subtitle: subtitle),
          ],
        ),
        decoration: BoxDecoration(
          color: Clrs.white,
          borderRadius: BorderRadius.circular(hh(context, 16)),
          boxShadow: [
            BoxShadow(
              color: Clrs.blue.withOpacity(0.06),
              offset: Offset(0, hh(context, 6)),
              blurRadius: 12,
            ),
          ],
        ),
      ),
    );

Widget categoriedListCardImage(BuildContext context, {String img}) => Container(
      width: ww(context, 92),
      height: hh(context, 141),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ww(context, 16)),
        image: DecorationImage(
          image: AssetImage(
            img,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );

Widget categoriedListCardInfo(BuildContext context,
        {String title, String subtitle}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: hh(context, 14),
            fontWeight: FontWeight.w600,
            color: Clrs.blue,
            height: 1.3,
          ),
        ),
        SizedBox(height: hh(context, 4)),
        Container(
          width: ww(context, 163),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: hh(context, 14),
              fontWeight: FontWeight.w500,
              color: Clrs.textDark,
              height: 1.3,
            ),
          ),
        ),
        SizedBox(height: hh(context, 20)),
        Container(
          width: ww(context, 163),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Like.svg",
                    color: Clrs.textDark,
                  ),
                  SizedBox(width: ww(context, 6)),
                  Text(
                    "2.1K",
                    style: TextStyle(
                      fontSize: hh(context, 12),
                      fontWeight: FontWeight.w500,
                      color: Clrs.textDark,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Time.svg",
                    color: Clrs.textDark,
                  ),
                  SizedBox(width: ww(context, 6)),
                  Text(
                    "1hr ago",
                    style: TextStyle(
                      fontSize: hh(context, 12),
                      fontWeight: FontWeight.w500,
                      color: Clrs.textDark,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                "assets/icons/Bookmark.svg",
                color: Clrs.textDark,
              ),
            ],
          ),
        ),
      ],
    );
