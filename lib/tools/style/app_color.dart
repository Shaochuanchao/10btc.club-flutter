import 'package:client/tools/global.dart';
import 'package:flutter/material.dart';

//颜色配置
extension AppColor on BuildContext {
  //标题颜色
  Color get titleColor {
    return isCurDarMode ? Colors.white : Colors.black;
  }

  //副标题
  Color get subTitleColor {
    return isCurDarMode ? const Color(0xFFB0BEC5) : const Color(0xFF616161);
  }

  //主体字体颜色　
  Color get bodyTextColor {
    return isCurDarMode ? const Color(0xFFE0E0E0) : const Color(0xFF212121);
  }

  //导航栏颜色　
  Color get appBarColor{
    return isCurDarMode ? const Color(0xFF1F1F1F) : const Color(0xFFF5F5F5);
  }

  //背景色　
  Color get bgColor{
    return isCurDarMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  }



}
