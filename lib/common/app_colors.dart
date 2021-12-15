import 'package:flutter/material.dart';

abstract class IAppColors {
  /// 主色板
  MaterialColor get primarySwatch;
}

class LightAppColors extends IAppColors {
  @override
  MaterialColor get primarySwatch => Colors.blue;
}

class DarkAppColors extends IAppColors {
  @override
  MaterialColor get primarySwatch => Colors.blue;
}