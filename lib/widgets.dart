import 'package:flutter/material.dart';

double hh(BuildContext context, double height) {
  return (MediaQuery.of(context).size.height * height) / 812;
}

double ww(BuildContext context, double width) {
  return (MediaQuery.of(context).size.width * width) / 375;
}

Widget paddingHorizontal(BuildContext context, {Widget child}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: hh(context, 40)), child: child);
