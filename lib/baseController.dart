import 'package:flutter/cupertino.dart';

class BaseController {
  static var _instance;
  final ValueNotifier<bool> isDarkTheme = ValueNotifier(false);

  static getInstance() {
    if (_instance == null) _instance = BaseController();

    return _instance;
  }

  switchAppTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }
}
