import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget storyList(BuildContext context, Size s, {Function onTap}) => Container(
      width: s.width,
      height: hh(context, 92),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: ww(context, 10)),
            child: StoryItem(
              item: storyItems[index],
              onTap: onTap,
            ),
          );
        },
        itemCount: storyItems.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: ww(context, 40)),
        physics: BouncingScrollPhysics(),
      ),
    );

class StoryItemModel {
  String photo;
  String name;
  String category;

  StoryItemModel(this.photo, this.name, this.category);
}

List<StoryItemModel> storyItems = [
  StoryItemModel("User1", "Emilio", "Video"),
  StoryItemModel("User2", "Richard", "Lotus"),
  StoryItemModel("User3", "Jasmine", "Lamp"),
  StoryItemModel("User4", "Mary", "Heart"),
  StoryItemModel("User5", "Hendri", "Video"),
];

class StoryItem extends StatelessWidget {
  final StoryItemModel item;
  final Function onTap;

  const StoryItem({Key key, this.item, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: ww(context, 68),
        height: hh(context, 92),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: ww(context, 68),
                  height: ww(context, 68),
                  padding: EdgeInsets.all(ww(context, 2)),
                  child: Container(
                    width: ww(context, 64),
                    height: ww(context, 64),
                    padding: EdgeInsets.all(ww(context, 5)),
                    child: Container(
                      width: ww(context, 54),
                      height: ww(context, 54),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/${item.photo}.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(
                          ww(context, 18),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Clrs.white,
                      borderRadius: BorderRadius.circular(
                        ww(context, 22),
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
                      ww(context, 24),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  item.name,
                  style: TextStyle(
                    color: Clrs.textBlueDark,
                    fontSize: hh(context, 12),
                  ),
                )
              ],
            ),
            Positioned(
              right: 0,
              top: hh(context, 48),
              child: SvgPicture.asset(
                "assets/icons/${item.category}.svg",
                width: ww(context, 20),
                height: ww(context, 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
