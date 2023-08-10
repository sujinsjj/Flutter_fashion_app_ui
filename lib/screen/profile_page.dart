import 'package:fashion_app_ui/screen/widgets/icon_and_text.dart';
import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        shadowColor: Colors.transparent,
        title: Text('Profile',
          style: GoogleFonts.robotoCondensed(fontWeight: FontWeight.w600,color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,left: 0,right: 0,
            child: Container(
              height: 130,
              color: AppColor.primaryColor,
            ),
          ),
          Positioned(
            top: 50,left: 15,right: 15,
              child: Column(
                children: [
                  Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColor.primaryColor,
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          spreadRadius: 1
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 70,width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2,color: AppColor.primaryColor),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/img/cat.jpg'
                                    )
                                )
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TitleText(text: 'Su Jin'),
                                SmallText(text: 'sujin0402@gmail.com'),
                              ],
                            ),

                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,size: 18,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  iconAndText(Icons.notifications_outlined, 'Notifications'),
                  iconAndText(CupertinoIcons.cart, 'My orders'),
                  iconAndText(Icons.location_on_outlined, 'Address'),
                  iconAndText(Icons.payment_outlined, 'Payment'),
                  iconAndText(Icons.message_outlined, 'Contact Us'),
                  iconAndText(Icons.settings_outlined, 'Setting'),

                ],
              ),
          )
        ],
      ),
    );
  }
}
