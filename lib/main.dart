import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:tmn_portfolio/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, _) {
        return MaterialApp(
          title: 'Thant Mon Naing',
          debugShowCheckedModeBanner: false,
          builder: FlutterSmartDialog.init(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen()
        );
      }
    );
  }
}

