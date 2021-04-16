import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: hh(context, 66)),
                  profileHeader(context),
                  SizedBox(height: hh(context, 16)),
                  profileCard(context),
                  PostsLayout(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: s.width,
                height: hh(context, 116),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffFAFBFF).withOpacity(0),
                      Color(0xffFAFBFF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      padding: EdgeInsets.symmetric(vertical: hh(context, 32)),
      decoration: BoxDecoration(
        color: Clrs.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            hh(context, 28),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Clrs.blue.withOpacity(0.1),
            offset: Offset(0, hh(context, -25)),
            blurRadius: hh(context, 32),
          ),
        ],
      ),
      child: Column(
        children: [
          postsHeader(context),
          SizedBox(height: hh(context, 27)),
          categoriedListCard(
            context,
            img: "assets/images/Img5.png",
            title: "BIG DATA",
            subtitle: "Why Big Data Needs Thick Data?",
          ),
          SizedBox(height: hh(context, 24)),
          categoriedListCard(
            context,
            img: "assets/images/Img6.png",
            title: "UX DESIGN",
            subtitle: "Step design sprint for UX beginner",
          ),
        ],
      ),
    );
  }
}

Widget postsHeader(BuildContext context) => paddingHorizontal(
      context,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "My Posts",
            style: TextStyle(
              color: Clrs.textDark,
              fontSize: hh(context, 20),
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
          Container(
            width: ww(context, 72),
            height: hh(context, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: hh(context, 24),
                  height: hh(context, 24),
                  child: SvgPicture.asset(
                    "assets/icons/Grid.svg",
                  ),
                ),
                Container(
                  width: hh(context, 24),
                  height: hh(context, 24),
                  child: SvgPicture.asset(
                    "assets/icons/Table.svg",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget profileCard(BuildContext context) => paddingHorizontal(
      context,
      child: Container(
        width: ww(context, 295),
        height: hh(context, 350),
        child: Stack(
          children: [
            profileCardDetail(context),
            userCards(context),
          ],
        ),
      ),
    );

Widget userCards(BuildContext context) => Padding(
      padding: EdgeInsets.only(bottom: hh(context, 32)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: ww(context, 231),
          height: hh(context, 68),
          child: Row(
            children: List.generate(3, (index) {
              return userAsset(context,
                  item: assets[index], isActive: index == 0);
            }),
          ),
          decoration: BoxDecoration(
            color: Clrs.blue,
            borderRadius: BorderRadius.circular(ww(context, 12)),
            boxShadow: [
              BoxShadow(
                color: Clrs.textDark.withOpacity(0.44),
                offset: Offset(0, hh(context, 16)),
                blurRadius: 32,
              ),
            ],
          ),
        ),
      ),
    );

class UserAssetModel {
  String title;
  String subtitle;

  UserAssetModel(this.title, this.subtitle);
}

List<UserAssetModel> assets = [
  UserAssetModel("52", "Post"),
  UserAssetModel("250", "Following"),
  UserAssetModel("4.5K", "Followers"),
];

Widget userAsset(BuildContext context,
        {Color color, UserAssetModel item, bool isActive}) =>
    Container(
      width: ww(context, 77),
      height: hh(context, 68),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.title,
            style: TextStyle(
              fontSize: hh(context, 20),
              color: Clrs.white,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),
          SizedBox(height: hh(context, 4)),
          Text(
            item.subtitle,
            style: TextStyle(
              fontSize: hh(context, 12),
              color: Clrs.white,
              height: 1.5,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: isActive ? Color(0xff2151CD) : Colors.transparent,
        borderRadius: BorderRadius.circular(ww(context, 12)),
      ),
    );

Widget profileCardDetail(BuildContext context) => Container(
      width: ww(context, 295),
      height: hh(context, 284),
      padding: EdgeInsets.all(ww(context, 32)),
      decoration: BoxDecoration(
        color: Clrs.white,
        borderRadius: BorderRadius.circular(ww(context, 16)),
        boxShadow: [
          BoxShadow(
            color: Clrs.blue.withOpacity(0.06),
            offset: Offset(0, hh(context, 10)),
            blurRadius: hh(context, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileUserInfo(context),
          SizedBox(height: hh(context, 24)),
          Text(
            "About me",
            style: TextStyle(
              fontSize: hh(context, 16),
              fontWeight: FontWeight.w700,
              color: Clrs.textDark,
              height: 1.4,
            ),
          ),
          SizedBox(height: hh(context, 8)),
          Text(
            "Madison Blackstone is a director of user experience design, with experience managing global teams.",
            style: TextStyle(
              fontSize: hh(context, 14),
              fontWeight: FontWeight.w500,
              color: Clrs.textBlueDark,
              height: 1.4,
            ),
          ),
        ],
      ),
    );

Widget profileUserInfo(BuildContext context) => Row(
      children: [
        Container(
          width: ww(context, 84),
          height: ww(context, 84),
          padding: EdgeInsets.all(ww(context, 2)),
          child: Container(
            width: ww(context, 80),
            height: ww(context, 80),
            padding: EdgeInsets.all(ww(context, 5)),
            child: Container(
              width: ww(context, 66.71),
              height: ww(context, 66.71),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/User1.png",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(ww(context, 22)),
              ),
            ),
            decoration: BoxDecoration(
              color: Clrs.white,
              borderRadius: BorderRadius.circular(
                ww(context, 26),
              ),
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff376AED),
                Color(0xff49B0E2),
                Color(0xff9CECFB),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(
              ww(context, 28),
            ),
          ),
        ),
        SizedBox(width: ww(context, 24)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@joviedan",
              style: TextStyle(
                fontSize: hh(context, 14),
                color: Clrs.textBlueDark,
                height: 1.3,
              ),
            ),
            Text(
              "Jovi Daniel",
              style: TextStyle(
                fontSize: hh(context, 18),
                fontWeight: FontWeight.w700,
                color: Clrs.textDark,
                height: 1.35,
              ),
            ),
            Text(
              "UX Designer",
              style: TextStyle(
                fontSize: hh(context, 16),
                fontWeight: FontWeight.w500,
                color: Clrs.blue,
                height: 1.25,
              ),
            ),
          ],
        ),
      ],
    );

Widget profileHeader(BuildContext context) => paddingHorizontal(
      context,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile",
            style: TextStyle(
              color: Clrs.textDark,
              fontSize: hh(context, 24),
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
          Container(
            width: ww(context, 32),
            height: ww(context, 32),
            child: SvgPicture.asset(
              "assets/icons/More.svg",
            ),
          ),
        ],
      ),
    );
