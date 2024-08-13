import 'package:client/tools/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//字体大小、颜色　
extension AppTestStyle on BuildContext{

  TextStyle get appBarTitle {
    return TextStyle(fontSize: 20.sp, color: titleColor);
  }

  TextStyle get title {
    return TextStyle(fontSize: 16.sp, color: titleColor);
  }

  TextStyle get subTitle {
    return TextStyle(fontSize: 13.sp, color: subTitleColor);
  }

  TextStyle get bodyText {
    return TextStyle(fontSize: 15.sp, color: bodyTextColor);
  }

}

