import 'dart:math';

import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Clrs.white,
      body: Container(
        width: s.width,
        height: s.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFF4F7FF).withOpacity(0.4),
              Color(0xffF4F7FF).withOpacity(0.8),
            ],
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerHome(context, s),
                  SizedBox(height: hh(context, 20)),
                  storyList(context, s, onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (contex) => Stories()));
                  }),
                  SizedBox(height: hh(context, 32)),
                  Carousel(),
                  categoriedListHeader(context),
                  SizedBox(height: hh(context, 24)),
                  categoriedListCard(
                    context,
                    img: "assets/images/Img5.png",
                    title: "BIG DATA",
                    subtitle: "Why Big Data Needs Thick Data?",
                  ),
                  SizedBox(height: hh(context, 135.5)),
                ],
              ),
            ),
            BlocBuilder<NewArticleCubit, NewArticleState>(
              builder: (context, state) {
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 240),
                  top: state.newArticle ? 0 : s.height,
                  left: 0,
                  child: AddNewArticle(),
                );
              },
            ),
            BlocBuilder<NewArticleCubit, NewArticleState>(
              builder: (context, state) {
                return AnimatedPositioned(
                  left: ww(context, 47),
                  bottom: hh(context, state.newArticle ? 132 : 0),
                  duration: Duration(milliseconds: 240),
                  child: newArticleSettings(context),
                );
              },
            ),
            bottomNavbar(context, s),
          ],
        ),
      ),
    );
  }
}

class AddNewArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      color: Clrs.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          newArticleHeader(context, s),
          SizedBox(height: hh(context, 39)),
          articleTitle(context, s),
          SizedBox(height: hh(context, 16)),
          articleSubtitle(context, s),
          SizedBox(height: hh(context, 32)),
          articleTags(context),
          SizedBox(height: hh(context, 32)),
          articleContent(context, s),
        ],
      ),
    );
  }
}

Widget articleContent(BuildContext context, Size s) => paddingHorizontal(
      context,
      child: Container(
        width: s.width,
        height: hh(context, 244),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: s.width,
              height: hh(context, 24),
              padding: EdgeInsets.only(bottom: hh(context, 4)),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: hh(context, 3),
                    color: Clrs.darkGrey.withOpacity(0.26),
                  ),
                ),
              ),
              child: Text(
                "Article Content",
                style: TextStyle(
                  fontSize: hh(context, 14),
                  fontWeight: FontWeight.w500,
                  color: Clrs.textDark,
                ),
              ),
            ),
            SizedBox(height: hh(context, 16)),
            Text(
              "This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny.",
              style: TextStyle(
                fontSize: hh(context, 14),
                fontWeight: FontWeight.w500,
                color: Clrs.textDark,
                height: 1.45,
              ),
            )
          ],
        ),
      ),
    );

Widget articleSubtitle(BuildContext context, Size s) => paddingHorizontal(
      context,
      child: Container(
        width: s.width,
        height: hh(context, 27),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: hh(context, 3),
              color: Clrs.darkGrey.withOpacity(0.26),
            ),
          ),
        ),
        child: Text(
          "Simplified products",
          style: TextStyle(
            fontSize: hh(context, 18),
            fontWeight: FontWeight.w500,
            color: Clrs.textDark,
          ),
        ),
      ),
    );

Widget articleTitle(BuildContext context, Size s) => paddingHorizontal(
      context,
      child: Container(
        width: s.width,
        height: hh(context, 37),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: hh(context, 3),
              color: Clrs.darkGrey.withOpacity(0.26),
            ),
          ),
        ),
        child: Text(
          "The art of beign an artist",
          style: TextStyle(
            fontSize: hh(context, 24),
            fontWeight: FontWeight.w700,
            color: Clrs.textDark,
          ),
        ),
      ),
    );

Widget articleTags(BuildContext context) => paddingHorizontal(
      context,
      child: Wrap(
        spacing: ww(context, 8),
        runSpacing: ww(context, 8),
        children: [
          Padding(
            padding: EdgeInsets.only(right: ww(context, 8)),
            child: Text(
              "Add Tags",
              style: TextStyle(
                color: Clrs.blue,
                fontSize: hh(context, 14),
                fontWeight: FontWeight.w700,
                height: 1.75,
              ),
            ),
          ),
          tag(context, title: "Art"),
          tag(context, title: "Design"),
          tag(context, title: "Culture"),
          tag(context, title: "Production"),
        ],
      ),
    );

Widget tag(BuildContext context, {String title}) => Container(
      height: hh(context, 32),
      child: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: ww(context, 16), right: ww(context, 36)),
            child: Text(
              title,
              style: TextStyle(
                color: Clrs.blue,
                fontSize: hh(context, 12),
                fontWeight: FontWeight.w700,
                height: 1.85,
              ),
            ),
          ),
          Positioned(
            top: hh(context, 2),
            right: hh(context, 2),
            child: Container(
              width: hh(context, 24),
              height: hh(context, 24),
              padding: EdgeInsets.all(6),
              child: Center(
                child: Transform.rotate(
                  angle: pi / 4,
                  child: SvgPicture.asset(
                    "assets/icons/Add.svg",
                    color: Clrs.blue,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Clrs.blue.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Clrs.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          width: hh(context, 2),
          color: Clrs.blue,
        ),
      ),
    );

Widget newArticleHeader(BuildContext context, Size s) => Container(
      width: s.width,
      height: hh(context, 101),
      child: Column(
        children: [
          Spacer(),
          paddingHorizontal(
            context,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Article",
                  style: TextStyle(
                    fontSize: hh(context, 24),
                    fontWeight: FontWeight.w700,
                    color: Clrs.textDark,
                    height: 1.33,
                  ),
                ),
                Container(
                  width: ww(context, 32),
                  height: ww(context, 32),
                  child: SvgPicture.asset(
                    "assets/icons/Download.svg",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget newArticleSettings(BuildContext context) => Container(
      width: ww(context, 280),
      height: hh(context, 48),
      child: Row(
        children: [
          SizedBox(width: ww(context, 4)),
          Transform.rotate(
            angle: pi / 4,
            child: Container(
              width: hh(context, 40),
              height: hh(context, 40),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/Add.svg",
                  color: Clrs.textDark,
                ),
              ),
              decoration: BoxDecoration(
                color: Clrs.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: ww(context, 16)),
          Container(
            width: ww(context, 200),
            height: hh(context, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: hh(context, 24),
                  height: hh(context, 24),
                  child: SvgPicture.asset(
                    "assets/icons/Image.svg",
                  ),
                ),
                Container(
                  width: hh(context, 24),
                  height: hh(context, 24),
                  child: SvgPicture.asset(
                    "assets/icons/Play.svg",
                  ),
                ),
                Container(
                  width: hh(context, 24),
                  height: hh(context, 24),
                  child: SvgPicture.asset(
                    "assets/icons/Align.svg",
                  ),
                ),
                Container(
                  width: hh(context, 24),
                  height: hh(context, 24),
                  child: SvgPicture.asset(
                    "assets/icons/Link.svg",
                  ),
                ),
                Container(
                  width: hh(context, 24),
                  height: hh(context, 24),
                  child: SvgPicture.asset(
                    "assets/icons/Scale.svg",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Clrs.textDark,
        borderRadius: BorderRadius.circular(48),
      ),
    );

class BottomNavbarItemModel {
  String img;
  String imgActive;
  String title;

  BottomNavbarItemModel(this.img, this.imgActive, this.title);
}

List<BottomNavbarItemModel> bottomNavbarItems = [
  BottomNavbarItemModel(
      "assets/icons/Home.svg", "assets/icons/HomeActive.svg", "Home"),
  BottomNavbarItemModel(
      "assets/icons/Articles.svg", "assets/icons/ArticleActive.svg", "Article"),
  BottomNavbarItemModel(
      "assets/icons/Search.svg", "assets/icons/SearchActive.svg", "Search"),
  BottomNavbarItemModel(
      "assets/icons/Menu.svg", "assets/icons/MenuActive.svg", "Menu"),
];

class BottomNavbarItem extends StatelessWidget {
  final BottomNavbarItemModel item;
  final bool isActive;
  final Function onTap;

  const BottomNavbarItem({Key key, this.item, this.isActive, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: ww(context, 53),
        height: ww(context, 44),
        color: Colors.white,
        child: Column(
          children: [
            SvgPicture.asset(
              isActive ? item.imgActive : item.img,
            ),
            Spacer(),
            Text(
              item.title,
              style: TextStyle(
                fontSize: hh(context, 10),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.12,
                color: isActive ? Clrs.darkBlue : Clrs.darkGrey,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomNavbar(BuildContext context, Size s) => Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: s.width,
        height: hh(context, 95.5),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: s.width,
                height: hh(context, 82.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(bottomNavbarItems.length, (index) {
                    return BlocBuilder<PagesCubit, PagesState>(
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: index == 1 ? ww(context, 10) : 0,
                            left: index == 2 ? ww(context, 10) : 0,
                          ),
                          child: BottomNavbarItem(
                            item: bottomNavbarItems[index],
                            isActive: index == state.page,
                            onTap: () {
                              BlocProvider.of<PagesCubit>(context)
                                  .changePage(index);
                            },
                          ),
                        );
                      },
                    );
                  }),
                ),
                decoration: BoxDecoration(
                  color: Clrs.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff9B8487).withOpacity(0.1421),
                      offset: Offset(0, hh(context, -4)),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<NewArticleCubit>(context)
                      .changeNewArticleState();
                },
                child: BlocBuilder<NewArticleCubit, NewArticleState>(
                  builder: (context, state) {
                    return Container(
                      width: ww(context, 56),
                      height: ww(context, 56),
                      child: Transform.rotate(
                        angle: state.newArticle ? pi / 4 : 0,
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/Add.svg",
                            color: state.newArticle
                                ? Clrs.white
                                : Color(0xff8FE6FF),
                            width: ww(context, 20),
                            height: ww(context, 20),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: state.newArticle ? Clrs.textDark : Clrs.blue,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff2D2D2D).withOpacity(0.1414),
                            offset: Offset(0, hh(context, -3)),
                            blurRadius: 20,
                          ),
                        ],
                        border: Border.all(
                          color: Clrs.white,
                          width: ww(context, 4),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget headerHome(BuildContext context, Size s) => Container(
      width: s.width,
      height: hh(context, 134),
      color: Clrs.white,
      child: Column(
        children: [
          SizedBox(height: hh(context, 69)),
          paddingHorizontal(
            context,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Jonathan!",
                      style: TextStyle(
                        fontSize: hh(context, 18),
                        color: Clrs.textBlueDark,
                      ),
                    ),
                    SizedBox(height: hh(context, 7)),
                    Text(
                      "Explore today's",
                      style: TextStyle(
                        fontSize: hh(context, 24),
                        color: Clrs.textDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: ww(context, 32),
                  height: ww(context, 32),
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Notification.svg",
                        width: ww(context, 32),
                        height: ww(context, 32),
                      ),
                      Positioned(
                        left: 6,
                        top: 4,
                        child: Container(
                          width: ww(context, 12),
                          height: ww(context, 12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Clrs.red,
                            border: Border.all(
                              color: Clrs.white,
                              width: ww(context, 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
