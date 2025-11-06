import 'dart:async';

import 'package:flutter/foundation.dart';


class DebounceServices {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  DebounceServices({this.milliseconds, this.action, this.timer});

  run(VoidCallback action) {
    if (null != timer) {
      timer?.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
