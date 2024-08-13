
import 'package:client/pages/home/home.dart';
import 'package:client/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logger.dart';

class RouterManger{

  static const String home  = "/home";

  static const String splash = '/splash';


  static Route<dynamic>? generateRouter(RouteSettings settings){

    Logger.debug("路由跳转 ${settings.name}");
     switch(settings.name)
     {
       case home :
         return MaterialPageRoute(builder: (_) => HomePage());
       case splash:
         return MaterialPageRoute(builder: (_) => const SplashPage());
       default:
         return MaterialPageRoute(builder: (context) => Scaffold(
           body: Center(
             child: Text("页面未定义: ${settings.name}",
               style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600,color: Colors.red),),
           ),
         ));
     }


  }

}