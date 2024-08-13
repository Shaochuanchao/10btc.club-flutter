

import 'package:client/tools/logger.dart';
import 'package:client/tools/router/router_manger.dart';
import 'package:client/tools/style/app_text_style.dart';
import 'package:client/widget/countdown_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  void _toHome() {
     Logger.debug("splash跳转主界面");
    Navigator.pushReplacementNamed(context, RouterManger.home);
  }

  @override
  Widget build(BuildContext context) {

    Logger.debug("splash 执行build");

    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        _splashBody(),
        Positioned(
          right: 40.w,
          top: 40.h,
          child: CountdownCircle(
            action: (_) => _toHome(),
            countdownSeconds: 3,
          ),
        )
      ],
    )));
  }

  Widget _splashBody() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Center(
          child: Text(
            "不止一个BTC",
            style: TextStyle(
                fontSize: 30.sp,
                color: Colors.orange,
                fontWeight: FontWeight.w600),
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Text(
            "@10btc.club, All rights reserved.",
            style: context.subTitle,
          ),
        )
      ],
    ));
  }
}
