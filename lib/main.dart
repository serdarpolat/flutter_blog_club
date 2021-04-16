import 'dart:async';

import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingpageCubit>(
            create: (BuildContext context) => OnboardingpageCubit()),
        BlocProvider<LogincontrolCubit>(
            create: (BuildContext context) => LogincontrolCubit()),
        BlocProvider<PagesCubit>(
            create: (BuildContext context) => PagesCubit()),
        BlocProvider<NewArticleCubit>(
            create: (BuildContext context) => NewArticleCubit()),
      ],
      child: MaterialApp(
        title: 'Blog Post',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Gilroy',
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Onboarding()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
        child: Center(
          child: SvgPicture.asset("assets/images/Logo.svg"),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splashscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
