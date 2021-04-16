import 'package:blog_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Clrs.white,
      body: Container(
        width: s.width,
        height: s.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: hh(context, 85)),
              SvgPicture.asset(
                "assets/images/Logo.svg",
                width: ww(context, 110.17),
                height: hh(context, 56),
              ),
              SizedBox(height: hh(context, 32)),
              Container(
                width: s.width,
                height: hh(context, 639),
                child: Column(
                  children: [
                    BlocBuilder<LogincontrolCubit, LogincontrolState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            tabMenu(context, s, state: state),
                            Container(
                              width: s.width,
                              height: hh(context, 639 - 66.0),
                              child: state.isLogin
                                  ? LoginLayout(
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (_) => Home(),
                                          ),
                                        );
                                      },
                                    )
                                  : SignUpLayout(),
                              decoration: BoxDecoration(
                                color: Clrs.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(hh(context, 28)),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Clrs.blue,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(hh(context, 28)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
