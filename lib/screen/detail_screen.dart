import 'package:dots_indicator/dots_indicator.dart';
import 'package:fashion_app_ui/router/name.dart';
import 'package:fashion_app_ui/screen/widgets/button_widgets.dart';
import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/product_model.dart';
import '../utils/color.dart';

class DetailScreen extends StatefulWidget {
  final int proId;
  const DetailScreen({Key? key, required this.proId,}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  int currentSelectedColor = 0;
  int currentSelectedSize = 1;
  double rating = 0;

  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }
  @override
  Widget build(BuildContext context) {
    List<Product> _proList = Product.productList;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              GoRouter.of(context).goNamed(RouterName.bottomBar);
            },
            icon: const Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                const Icon(CupertinoIcons.bag),
                Positioned(
                  bottom: 14,
                  right: -1,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Product.productList[widget.proId].isSelected == true
                        ?Colors.red:Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: Colors.white,
              height: 800,
            ),
            Positioned(
              top: 0,left: 0,right: 0,
              child: SizedBox(
                height: 300,
                child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        currentIndex = page;
                      });
                    },
                    itemCount: _proList[widget.proId].imageUrl.length,
                    itemBuilder: (context,index){
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(_proList[widget.proId].imageUrl[index])
                            )
                        ),
                      );
                    }
                ),
              ),
            ),
            Positioned(
                top: 10,right: 5,
                child: IconButton(
                    onPressed: (){
                      setState(() {
                        bool isFavorite = toggleIsFavorite(
                            Product.productList[widget.proId].isFavorite
                        );
                        Product.productList[widget.proId].isFavorite = isFavorite;
                      });
                    },
                    icon: Icon(
                      Product.productList[widget.proId].isFavorite == true
                          ? CupertinoIcons.heart_fill: CupertinoIcons.heart,
                      color: AppColor.primaryTextColor,size: 27,))
            ),
            Positioned(
                top: 250,
                child: DotsIndicator(
                  dotsCount: _proList[widget.proId].imageUrl.length,
                  position: currentIndex,
                  decorator: DotsDecorator(
                    color: AppColor.greyColor,
                    activeColor: AppColor.primaryColor,
                    size: const Size.square(5.0),
                    activeSize: const Size(8.0, 5.0),
                    spacing: const EdgeInsets.all(2),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                )),
            Positioned(
              top: 280,left: 0,right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleText1(_proList[widget.proId].proTitle),
                        priceText1(_proList[widget.proId].price),

                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        RatingBar.builder(
                            itemBuilder: (context,index)=>const Icon(CupertinoIcons.star_fill,color: AppColor.starColor,),
                            itemSize: 18,
                            minRating: 1,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                            onRatingUpdate: (rating){
                              setState(() {
                                this.rating = rating;
                              });
                            }),
                        Text( rating.toString(),
                          style: GoogleFonts.robotoCondensed(fontWeight: FontWeight.w500,color: Colors.black87,fontSize: 18),),
                        const SizedBox(width: 10,),
                        Text( '(16 Review)',
                          style: GoogleFonts.robotoCondensed(fontWeight: FontWeight.w500,color: Colors.black87,fontSize: 15),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const TitleText(text: 'Select Color'),
                    const SizedBox(height: 15,),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(_proList[widget.proId].color.length, (index) =>
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                currentSelectedColor = index;
                              });
                            },
                            child: Container(
                        height: 30,width: 30,
                        decoration: BoxDecoration(
                              color: _proList[widget.proId].color[index],
                              shape: BoxShape.circle,
                              border: Border.all(width: 1,color: AppColor.primaryColor.withOpacity(0.3))
                        ),
                              child: Center(
                                child: Icon(CupertinoIcons.checkmark_alt,
                                  color: currentSelectedColor == index?AppColor.primaryTextColor:Colors.transparent,
                                ),
                              ),
                      ),
                          )),
                    ),
                    const SizedBox(height: 20,),
                    const TitleText(text: 'Select Size'),
                    const SizedBox(height: 15,),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(_proList[widget.proId].size.length, (index) =>
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                 currentSelectedSize = index;
                              });
                            },
                            child: Container(
                            height: 40,width: 45,
                            decoration: BoxDecoration(
                                color: currentSelectedSize == index?Colors.black87:Colors.white,
                                border: Border.all(width: 1.5,color: Colors.black87),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(child: TitleText(text:_proList[widget.proId].size[index],
                                color: currentSelectedSize == index?Colors.white:Colors.black54,
                            ))
                      ),
                          )),
                    ),
                    const SizedBox(height: 20,),
                    const TitleText(text: 'Detail'),
                    const SizedBox(height: 10,),
                    SmallText(text: _proList[widget.proId].description),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          decoration: const BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, -2),
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1
                )
              ]
          ),
          child: button("Buy Now", double.maxFinite,(){
            setState(() {
              bool isSelected = toggleIsFavorite(
                  Product.productList[widget.proId].isSelected
              );
              Product.productList[widget.proId].isSelected = isSelected;
            });
          })
      ),
    );
  }
}
