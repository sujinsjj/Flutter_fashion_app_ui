import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color.dart';

Widget iconAndText(IconData icon, String text){
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColor.primaryTextColor.withOpacity(0.5)
              ),
              child: Icon(icon,color: AppColor.primaryTextColor,),
            ),
            const SizedBox(width: 10,),
            Text(text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GoogleFonts.robotoCondensed(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.primaryTextColor,size: 20,)
      ],
    ),
  );
}