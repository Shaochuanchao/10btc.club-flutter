
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String appName = "10btc.club";
//全局夜间模式
bool isCurDarMode = false;
//是否开发模式
bool isDevMode = true;

//全局状态管理　
class AppGlobalState with ChangeNotifier {

  bool _isDarMode = isCurDarMode;

  bool get isDarkMode => _isDarMode;

  Future<void> init() async {
    final pref = await SharedPreferences.getInstance();
    _isDarMode = pref.getBool("isDarkMode") ?? false;
    isCurDarMode = _isDarMode;
    notifyListeners();
  }

  void toggleDarkMode() async {
    _isDarMode = !_isDarMode;
    isCurDarMode = _isDarMode;
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isDarkMode", _isDarMode);
    notifyListeners();
  }

}