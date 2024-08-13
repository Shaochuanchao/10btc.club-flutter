import 'package:client/pages/splash/splash.dart';
import 'package:client/tools/global.dart';
import 'package:client/tools/router/router_manger.dart';
import 'package:client/tools/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appState = AppGlobalState();
  await appState.init();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appName,
          themeMode: isCurDarMode ? ThemeMode.dark : ThemeMode.light,
          home: child,
          onGenerateRoute: RouterManger.generateRouter,
          // initialRoute: RouterManger.splash,
          theme: ThemeData(
              pageTransitionsTheme: _pageTransitionsTheme(),
              useMaterial3: true,
              brightness: Brightness.light,
              scaffoldBackgroundColor: context.bgColor),
          darkTheme: ThemeData(
              pageTransitionsTheme: _pageTransitionsTheme(),
              useMaterial3: true,
              brightness: Brightness.dark,
              scaffoldBackgroundColor: context.bgColor),
        );
      },
      child: const SplashPage(),
    );
  }

  PageTransitionsTheme _pageTransitionsTheme() {
    return const PageTransitionsTheme(builders: {
      TargetPlatform.android: SlideTransitionBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    });
  }
}

class SlideTransitionBuilder extends PageTransitionsBuilder {
  const SlideTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const Offset begin = Offset(1.0, 0.0); // 从右侧滑入
    const Offset end = Offset.zero;
    final Tween<Offset> tween = Tween(begin: begin, end: end);
    final Animation<Offset> offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
