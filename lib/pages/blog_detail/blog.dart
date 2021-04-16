import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(ww(context, 28))),
        color: Clrs.white,
        boxShadow: [
          BoxShadow(
            color: Clrs.blue.withOpacity(0.06),
            offset: Offset(0, hh(context, -6)),
            blurRadius: hh(context, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          blogImage(context, s),
          SizedBox(height: hh(context, 32)),
          blogTitle(context),
          SizedBox(height: hh(context, 16)),
          blogArticle(context),
          SizedBox(height: hh(context, 84)),
        ],
      ),
    );
  }
}

Widget blogArticle(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: ww(context, 50)),
      child: Text(
        "This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.",
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Clrs.textBlueDark,
          fontSize: hh(context, 14),
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
      ),
    );

Widget blogTitle(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: ww(context, 50)),
      child: Text(
        "A man’s sexuality is never your mind responsibility.",
        style: TextStyle(
          color: Clrs.textDark,
          fontSize: hh(context, 18),
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
      ),
    );

Widget blogImage(BuildContext context, Size s) => Container(
      width: s.width,
      height: hh(context, 219),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(ww(context, 28))),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/User7.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
