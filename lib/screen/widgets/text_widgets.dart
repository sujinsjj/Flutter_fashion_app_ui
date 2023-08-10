import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  const BigText({Key? key,
    required this.text,
    this.color = Colors.black87}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: GoogleFonts.robotoCondensed(
        fontSize: 24,
        color: color,
        fontWeight: FontWeight.bold,
    )
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final Color color;
  final bool textAlign;
  const SmallText({Key? key,
    required this.text,
    this.color = Colors.grey,
    this.textAlign = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: textAlign==true?TextAlign.left:TextAlign.center,
      style: GoogleFonts.robotoCondensed(
        color: color,
        fontSize: 15,),
    );
  }
}

Widget textField(String hintText, String textType,
    void Function(String value)? func){
  return TextField(
    onChanged: (value)=>func!(value),
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
        )

    ),
    autocorrect: false,
    obscureText: textType=="password"?true:false,
  );
}

Widget optionText(String text,void Function()? onTap){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.robotoCondensed(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.bold
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            "View all",
            style: GoogleFonts.robotoCondensed(
              color: AppColor.primaryColor,
            ),
          ),
        )
      ],
    ),
  );
}

Widget priceText(double price){
  return Text("\$$price",
    style: GoogleFonts.robotoCondensed(
        fontWeight: FontWeight.w500,
        color: AppColor.primaryTextColor,
        fontSize: 17
    ),);
}
Widget priceText1(double price){
  return Text("\$$price",
    style: GoogleFonts.robotoCondensed(
        fontWeight: FontWeight.bold,color: AppColor.primaryTextColor,fontSize: 20),);
}

Widget priceAndRate(double price,double rate){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      priceText(price),
      Row(
        children: [
          const Icon(CupertinoIcons.star_fill,color: AppColor.starColor,size: 15,),
          Text( rate.toString(),
            style: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.w500,
                color: Colors.black87,fontSize: 15
            ),),
        ],
      )
    ],
  );
}

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  const TitleText({Key? key, required this.text,this.color=Colors.black54}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: GoogleFonts.robotoCondensed(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.w500),
    );
  }
}


Widget titleText1(String text){
  return Text(text,
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: GoogleFonts.robotoCondensed(
        fontSize: 20,
        fontWeight: FontWeight.w600),
  );
}
Widget pageTitleText(String text){
  return Text(text,
    style: GoogleFonts.robotoCondensed(fontWeight: FontWeight.w600),
  );
}
