
import 'package:fashion_app_ui/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button(String text,double wSize,void Function()? func){
  return ElevatedButton(
      onPressed: func,
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
          fixedSize: MaterialStateProperty.all(Size(wSize, 45))
      ),
      child: Text(text,style: const TextStyle(fontSize: 18),)
  );
}

Widget socialMediaButton(String icon,){
  return Container(
    height: 50,width: 120,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(width: 2,color: AppColor.primaryColor),
        image: DecorationImage(
            image: AssetImage('assets/icon/$icon.png'))
    ),
  );
}
