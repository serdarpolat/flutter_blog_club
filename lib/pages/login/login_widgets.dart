import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: hh(context, 32)),
        header(context, title: "Welcome", subtitle: "Create an account"),
        SizedBox(height: hh(context, 36)),
        Container(
          width: s.width,
          height: hh(context, 66),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddingHorizontal(
                context,
                child: Text(
                  "Username",
                  style: TextStyle(
                    fontSize: hh(context, 14),
                    fontWeight: FontWeight.w400,
                    color: Clrs.textBlueDark,
                    height: 1.25,
                  ),
                ),
              ),
              paddingHorizontal(
                context,
                child: Container(
                  width: s.width,
                  height: hh(context, 48),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your email address",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: hh(context, 20)),
        Container(
          width: s.width,
          height: hh(context, 66),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddingHorizontal(
                context,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: hh(context, 14),
                    fontWeight: FontWeight.w400,
                    color: Clrs.textBlueDark,
                    height: 1.25,
                  ),
                ),
              ),
              paddingHorizontal(
                context,
                child: Container(
                  width: s.width,
                  height: hh(context, 48),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: hh(context, 20)),
        Container(
          width: s.width,
          height: hh(context, 66),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddingHorizontal(
                context,
                child: Text(
                  "Password (again)",
                  style: TextStyle(
                    fontSize: hh(context, 14),
                    fontWeight: FontWeight.w400,
                    color: Clrs.textBlueDark,
                    height: 1.25,
                  ),
                ),
              ),
              paddingHorizontal(
                context,
                child: Container(
                  width: s.width,
                  height: hh(context, 48),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Re-Type your password",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: hh(context, 30)),
        loginButton(context, title: "SIGN UP"),
        SizedBox(height: hh(context, 16)),
      ],
    );
  }
}

class LoginLayout extends StatelessWidget {
  final Function onTap;

  const LoginLayout({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: hh(context, 32)),
        header(
          context,
          title: "Welcome back",
          subtitle: "Sign in with your account",
        ),
        SizedBox(height: hh(context, 36)),
        inputs(context, s),
        SizedBox(height: hh(context, 30)),
        loginButton(context, title: "LOGIN", onTap: onTap),
        SizedBox(height: hh(context, 16)),
        forgotPassword(context, s),
        SizedBox(height: hh(context, 32)),
        Container(
          width: s.width,
          child: Text(
            "OR SIGN IN WITH",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: hh(context, 12),
              fontWeight: FontWeight.w400,
              color: Clrs.textBlueDark,
              letterSpacing: 1.75,
            ),
          ),
        ),
        SizedBox(height: hh(context, 16)),
        socialLogin(context, s),
      ],
    );
  }
}

Widget forgotPassword(BuildContext context, Size s) => Container(
      width: s.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Forgot your password?",
            style: TextStyle(
              fontSize: hh(context, 14),
              fontWeight: FontWeight.w400,
              color: Clrs.textBlueDark,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Reset here",
              style: TextStyle(
                fontSize: hh(context, 14),
                fontWeight: FontWeight.w500,
                color: Clrs.blue,
              ),
            ),
          ),
        ],
      ),
    );

Widget loginButton(BuildContext context, {String title, Function onTap}) =>
    paddingHorizontal(
      context,
      child: MaterialButton(
        height: hh(context, 60),
        minWidth: ww(context, 295),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ww(context, 12)),
        ),
        color: Clrs.blue,
        textColor: Clrs.white,
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontSize: hh(context, 16),
            fontWeight: FontWeight.w600,
            color: Clrs.white,
          ),
        ),
      ),
    );

Widget inputs(BuildContext context, Size s) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: s.width,
          height: hh(context, 66),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddingHorizontal(
                context,
                child: Text(
                  "Username",
                  style: TextStyle(
                    fontSize: hh(context, 14),
                    fontWeight: FontWeight.w400,
                    color: Clrs.textBlueDark,
                    height: 1.25,
                  ),
                ),
              ),
              paddingHorizontal(
                context,
                child: Container(
                  width: s.width,
                  height: hh(context, 48),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your email address",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: hh(context, 20)),
        Container(
          width: s.width,
          height: hh(context, 66),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddingHorizontal(
                context,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: hh(context, 14),
                    fontWeight: FontWeight.w400,
                    color: Clrs.textBlueDark,
                    height: 1.25,
                  ),
                ),
              ),
              paddingHorizontal(
                context,
                child: Container(
                  width: s.width,
                  height: hh(context, 48),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

Widget header(BuildContext context, {String title, String subtitle}) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        paddingHorizontal(
          context,
          child: Text(
            title,
            style: TextStyle(
              fontSize: hh(context, 24),
              fontWeight: FontWeight.w600,
              color: Clrs.textDark,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: hh(context, 12)),
        paddingHorizontal(
          context,
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: hh(context, 14),
              fontWeight: FontWeight.w400,
              color: Clrs.textBlueDark,
              height: 1.5,
            ),
          ),
        ),
      ],
    );

Widget socialLogin(BuildContext context, Size s) => Container(
      width: s.width,
      height: hh(context, 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/Google.svg",
            height: hh(context, 36),
            width: hh(context, 36),
          ),
          SizedBox(width: ww(context, 32)),
          SvgPicture.asset(
            "assets/icons/Facebook.svg",
            height: hh(context, 36),
            width: hh(context, 36),
          ),
          SizedBox(width: ww(context, 32)),
          SvgPicture.asset(
            "assets/icons/Twitter.svg",
            height: hh(context, 36),
            width: hh(context, 36),
          ),
        ],
      ),
    );

Widget tabMenu(BuildContext context, Size s, {LogincontrolState state}) =>
    Container(
      width: s.width,
      height: hh(context, 66),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          textButton(
            context,
            title: "LOGIN",
            isActive: state.isLogin,
            onPressed: () {
              BlocProvider.of<LogincontrolCubit>(context).changetype(true);
            },
          ),
          textButton(
            context,
            title: "SIGN UP",
            isActive: !state.isLogin,
            onPressed: () {
              BlocProvider.of<LogincontrolCubit>(context).changetype(false);
            },
          ),
        ],
      ),
    );

Widget textButton(BuildContext context,
        {String title, bool isActive, Function onPressed}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: hh(context, 18),
          color: isActive ? Clrs.white : Clrs.white.withOpacity(0.25),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
