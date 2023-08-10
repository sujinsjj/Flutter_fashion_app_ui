import 'package:fashion_app_ui/screen/widgets/button_widgets.dart';
import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/product_model.dart';
import '../utils/color.dart';

class CartPage extends StatelessWidget {
  final List<Product> addToCartPro;
  const CartPage({Key? key, required this.addToCartPro, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: pageTitleText('Your Cart'),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: 6,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: SizedBox(
                      height: 110,
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(Product.productList[index].imageUrl[0],)
                                )
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TitleText(text: "Black T-shirt"),
                                      Icon(CupertinoIcons.trash,color: AppColor.primaryTextColor,)
                                    ],
                                  ),
                                  Text("Size M",style: TextStyle(fontSize: 15,color: Colors.grey.shade400),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      priceText(17.00),
                                      Container(
                                        height: 40,width: 100,
                                        padding: const EdgeInsets.all(7.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: AppColor.greyColor
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Colors.white
                                              ),
                                              child: const Icon(Icons.remove,color: Colors.black54,),
                                            ),
                                            const TitleText(text: "1"),
                                            Container(
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Colors.white
                                              ),
                                              child: const Icon(Icons.add,color: Colors.black54,),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>const Divider(color: AppColor.greyColor,)
              ),
              const SizedBox(height: 200,)
            ],
          ),
          Positioned(
            bottom: 0,left: 0,right: 0,
              child: Container(
                height: 130,
                color: CupertinoColors.white,
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price:",style: GoogleFonts.robotoCondensed(
                          fontSize: 18,fontWeight: FontWeight.w500
                        ),),
                        priceText1(150.65)
                      ],
                    ),
                    button("Check Out",double.maxFinite,(){}),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
