import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:tmn_portfolio/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:webview_flutter/webview_flutter.dart';

import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // late final WebViewController _controller;
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..loadRequest(Uri.parse('https://auth.mpt.com.mm/userCenter/login/SignIn?redirect=https%3A%2F%2Fmpt4uclp.mpt.com.mm%2F%23%2Flogin&lang=mm'));
  // }

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
          /*SafeArea(
            child: WebViewWidget(controller: _controller),
          ),*/
        );
      }
    );
  }
}

