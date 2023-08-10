import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/product_model.dart';
import '../utils/color.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key,}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: pageTitleText('Your Favorite'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications_rounded,color: Colors.black87,),
          ),
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: SizedBox(
                height: 170,
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(Product.productList[index].imageUrl[0],)
                          )
                      ),
                    ),
                    const SizedBox(width: 10,),
                    SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Brand',
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          const SmallText(text: 'Type'),
                          priceText(50.00),
                          const SmallText(text: 'Size'),
                          Container(
                              height: 40,width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(width: 2,color: AppColor.primaryColor),
                                  color: Colors.white
                              ),
                              child: const Center(
                                child: Text("Add to cart",
                                  style: TextStyle(fontSize: 18,color: AppColor.primaryTextColor),),
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
