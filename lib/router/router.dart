import 'package:fashion_app_ui/router/name.dart';
import 'package:fashion_app_ui/screen/bottom_bar.dart';
import 'package:fashion_app_ui/screen/categories_screen.dart';
import 'package:fashion_app_ui/screen/detail_screen.dart';
import 'package:fashion_app_ui/screen/forget_pw_screen.dart';
import 'package:fashion_app_ui/screen/home_screen.dart';
import 'package:fashion_app_ui/screen/onboarding_screen.dart';
import 'package:fashion_app_ui/screen/search_screen.dart';
import 'package:fashion_app_ui/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screen/sign_in_screen.dart';

class AppRouter{
  GoRouter router = GoRouter(
    //   initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            name: RouterName.initial,
            builder: (context,state)=>const OnBoardingScreen()
        ),
        GoRoute(
            path: '/sign_in',
            name: RouterName.signIn,
            builder: (context,state)=>const SignInScreen()
        ),
        GoRoute(
            path: '/sign_up',
            name: RouterName.signUp,
            builder: (context,state)=>const SignUpScreen()
        ),
        GoRoute(
            path: '/forgot_pw',
            name: RouterName.forgotPw,
            builder: (context,state)=>const ForgetPwScreen()
        ),
        GoRoute(
            path: '/bottom_bar',
            name: RouterName.bottomBar,
            builder: (context,state)=>const BottomBar()
        ),
        GoRoute(
            path: '/home',
            name: RouterName.home,
            builder: (context,state)=>const HomeScreen()
        ),
        GoRoute(
            path: '/search',
            name: RouterName.search,
            builder: (context,state)=>const SearchScreen()
        ),
        GoRoute(
            path: '/category',
            name: RouterName.category,
            builder: (context,state)=>const CategoryScreen()
        ),
      ]
  );
}