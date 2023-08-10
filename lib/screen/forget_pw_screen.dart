import 'package:fashion_app_ui/screen/widgets/button_widgets.dart';
import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:fashion_app_ui/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../router/name.dart';

class ForgetPwScreen extends StatelessWidget {
  const ForgetPwScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            GoRouter.of(context).goNamed(RouterName.signIn);
          },
            child: const Icon(Icons.arrow_back_outlined)),
        title: Text('Reset Password',style: GoogleFonts.robotoCondensed(),),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
        child: Column(
          children: [
            const SmallText(text: 'Please enter your email address so '
                'that we can have you recover your account'),
            const SizedBox(height: 30,),
            textField('Email Address', 'email', (value) { }),
            const SizedBox(height: 50,),
            button('Send', double.maxFinite, () { })
          ],
        ),
      ),
    );
  }
}
