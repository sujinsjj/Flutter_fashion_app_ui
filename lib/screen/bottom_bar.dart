import 'package:fashion_app_ui/screen/cart_page.dart';
import 'package:fashion_app_ui/screen/favorite_screen.dart';
import 'package:fashion_app_ui/screen/forget_pw_screen.dart';
import 'package:fashion_app_ui/screen/home_screen.dart';
import 'package:fashion_app_ui/screen/onboarding_screen.dart';
import 'package:fashion_app_ui/screen/profile_page.dart';
import 'package:fashion_app_ui/screen/sign_in_screen.dart';
import 'package:fashion_app_ui/screen/sign_up_screen.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utils/color.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final List<Widget> _option = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartPage(addToCartPro: []),
    const ProfilePage(),
  ];

  int _selectedIndex = 0;

  void _onTappedItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _option[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.primaryColor,
          onTap: _onTappedItem,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.home_24_regular,color: CupertinoColors.white,),
              label: "home",
              activeIcon: Icon(FluentIcons.home_24_filled,color: CupertinoColors.white,),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart,color: CupertinoColors.white,),
              label: "favorite",
              activeIcon: Icon(CupertinoIcons.heart_fill,color: CupertinoColors.white,),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag,color: CupertinoColors.white,),
              label: "cart",
              activeIcon: Icon(CupertinoIcons.bag_fill,color: CupertinoColors.white,),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person,color: CupertinoColors.white,),
              label: "profile",
              activeIcon: Icon(CupertinoIcons.person_fill,color: CupertinoColors.white,),
            ),
          ]),
    );
  }
}

