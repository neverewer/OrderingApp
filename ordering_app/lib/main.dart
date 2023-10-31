import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ordering_app/src/feature/app/colors.dart';

import 'src/feature/app/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColors.backgroundColor));
  runApp(const App());
}
