//log打印

import 'global.dart';

class Logger {
  Logger._();

  // 获取当前时间戳，精确到毫秒
  static String _getTimestamp() {
    final now = DateTime.now();
    return now.toIso8601String();
  }

  // 打印普通日志
  static void log(String message) {
    if (isDevMode) {
      print("${_getTimestamp()} LOG: $message");
    }
  }

  // 打印调试日志
  static void debug(String message) {
    if (isDevMode) {
      print("${_getTimestamp()} DEBUG: $message");
    }
  }

  // 打印错误日志
  static void error(String message) {
    if (isDevMode) {
      print("${_getTimestamp()} ERROR: $message");
    }
  }
}
