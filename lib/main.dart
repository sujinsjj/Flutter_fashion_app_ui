import 'package:fashion_app_ui/router/router.dart';
import 'package:fashion_app_ui/screen/bottom_bar.dart';
import 'package:fashion_app_ui/screen/detail_screen.dart';
import 'package:fashion_app_ui/screen/forget_pw_screen.dart';
import 'package:fashion_app_ui/screen/onboarding_screen.dart';
import 'package:fashion_app_ui/screen/search_screen.dart';
import 'package:fashion_app_ui/screen/sign_in_screen.dart';
import 'package:fashion_app_ui/screen/sign_up_screen.dart';
import 'package:fashion_app_ui/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        splashColor: Colors.transparent,
        useMaterial3: true,
      ),
      routerConfig: AppRouter().router,
      debugShowCheckedModeBanner: false,
    );
  }
}

