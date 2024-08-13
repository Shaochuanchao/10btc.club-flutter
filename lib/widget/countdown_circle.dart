import 'dart:async';

import 'package:client/tools/logger.dart';
import 'package:flutter/material.dart';

//广告页倒计时
class CountdownCircle extends StatefulWidget {
  const CountdownCircle(
      {super.key,
      this.countdownSeconds = 3,
      this.circleBgColor = Colors.transparent,
      this.circleBorderColor = Colors.orange,
      this.circleStrokeWith = 2.0,
      this.skipText = "跳过",
      this.skipTextStyle = const TextStyle(fontSize: 13.0, color: Colors.black),
      this.action})
      : assert(countdownSeconds >= 1 && countdownSeconds < 60),
        assert(circleStrokeWith > 1.0);

  //倒计时 默认3秒
  final int countdownSeconds;

  //背景色
  final Color circleBgColor;

  //倒计时外边
  final Color circleBorderColor;

  //外边宽度
  final double circleStrokeWith;

  //跳过
  final String skipText;

  final TextStyle skipTextStyle;

  final void Function(bool isFinished)? action;

  @override
  State<StatefulWidget> createState() {
    return _CountdownCircleState();
  }
}

class _CountdownCircleState extends State<CountdownCircle> {
  Timer? _timer;
  final _curProgress = ValueNotifier<int>(0);
  final _isVisible = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    Logger.debug("_CountdownCircleState initState");
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _curProgress.value += 100;
      if (_curProgress.value >= widget.countdownSeconds * 1000) {
        _doFinish(true);
      }
    });
  }

  void _doFinish(bool isFinishCountdown) {
    _timer?.cancel();
    Logger.debug("_CountdownCircleState _doFinish = $isFinishCountdown");
    _isVisible.value = false;
    if (widget.action != null) {
      widget.action!( isFinishCountdown);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Logger.debug("_CountdownCircleState build");

    return ValueListenableBuilder(
        valueListenable: _isVisible,
        builder: (context, bool isVisible, child) {
          return Visibility(
              visible: isVisible,
              child: GestureDetector(
                onTap: () => {_doFinish(false)},
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ValueListenableBuilder(
                        valueListenable: _curProgress,
                        builder: (context, int progress, child) {
                          return CircularProgressIndicator(
                            strokeWidth: widget.circleStrokeWith,
                            color: widget.circleBorderColor,
                            backgroundColor: widget.circleBgColor,
                            value: _curProgress.value /
                                (widget.countdownSeconds * 1000),
                          );
                        }),
                    Text(
                      widget.skipText,
                      style: widget.skipTextStyle,
                    ),
                  ],
                ),
              ));
        });
  }
}
