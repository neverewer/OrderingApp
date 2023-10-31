import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/date_symbol_data_local.dart';

import 'src/feature/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await initializeDateFormatting('en', null);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColors.backgroundColor));
  runApp(const App());
}
