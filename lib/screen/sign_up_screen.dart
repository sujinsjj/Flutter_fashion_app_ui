import 'package:fashion_app_ui/screen/sign_in_screen.dart';
import 'package:fashion_app_ui/screen/widgets/button_widgets.dart';
import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/name.dart';
import '../utils/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ClipPath(
            clipper: AppClipper1(),
            child: Container(
                height: 250,
                color: AppColor.primaryColor,
                child: Center(
                  child: BigText(text: 'Sign up',color: Colors.white70,),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 230, 25, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textField('Email Address', 'email', (value) { }),
                const SizedBox(height: 20,),
                textField('Password', 'password', (value) { }),
                const SizedBox(height: 50,),
                button('Sign up', double.maxFinite, () {
                  GoRouter.of(context).pushReplacementNamed(RouterName.bottomBar);
                }),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SmallText(text: 'Already have account, '),
                    GestureDetector(
                      onTap: (){
                        GoRouter.of(context).goNamed(RouterName.signIn);
                      },
                        child: const SmallText(text: 'Sign in',color: AppColor.primaryColor,))
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
