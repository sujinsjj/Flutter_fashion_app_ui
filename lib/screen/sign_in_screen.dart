import 'package:fashion_app_ui/router/name.dart';
import 'package:fashion_app_ui/screen/widgets/button_widgets.dart';
import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:fashion_app_ui/utils/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
              child: const Center(
                child: BigText(text: 'Sign In',color: Colors.white70,),
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
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){
                    GoRouter.of(context).pushNamed(RouterName.forgotPw);
                  },
                  child: const Text("Forgot Password",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.primaryColor,
                        fontSize: 14
                    ),
                  ),

                ),
                const SizedBox(height: 30,),
                button('Sign in', double.maxFinite, () {
                  GoRouter.of(context).pushReplacementNamed(RouterName.bottomBar);
                }),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      GoRouter.of(context).pushNamed(RouterName.signUp);
                    },
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(AppColor.primaryColor),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
                        fixedSize: MaterialStateProperty.all(const Size(double.maxFinite, 45))
                    ),
                    child: const Text('Sign up',style: TextStyle(fontSize: 18),)
                ),
                const SizedBox(height: 30,),
                const Center(child: SmallText(text: 'Or Sign in with')),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    socialMediaButton('facebook'),
                    socialMediaButton('google')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppClipper1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height-100);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-100);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
