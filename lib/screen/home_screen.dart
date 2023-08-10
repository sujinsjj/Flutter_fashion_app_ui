import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fashion_app_ui/model/product_model.dart';
import 'package:fashion_app_ui/router/name.dart';
import 'package:fashion_app_ui/screen/detail_screen.dart';
import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../model/categories_list.dart';
import '../utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int _currentIndex = 0;

  final List<String> _carouselSlider = [
    'b.jpg', 'b2.jpg', 'b1.jpg', 'b3.jpg', 'b4.jpg', 'b5.jpg',
  ];

  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///search bar
                GestureDetector(
                  onTap: (){
                    GoRouter.of(context).pushNamed(RouterName.search);
                  },
                  child: Container(
                    height: 45,
                    width: w*0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColor.greyColor.withOpacity(0.9)
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(CupertinoIcons.search,color: AppColor.primaryColor,),
                        SizedBox(width: 10,),
                        Text("Search here...",style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.notifications_rounded,color: Colors.black87,)
              ],
            ),
          ),
          const SizedBox(height: 30,),
          ///carousel slider
          Column(
            children: [
              CarouselSlider.builder(
                  itemCount:_carouselSlider.length,
                  itemBuilder: (context, index, pageViewIndex){
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                            image: AssetImage('assets/img/${_carouselSlider[index]}')
                        )
                      ),
                    );
                  },
                  options: CarouselOptions(
                      onPageChanged: (index, other){
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 18/8,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      viewportFraction: 1
                  )),
              const SizedBox(height: 10,),
              DotsIndicator(
                dotsCount: _carouselSlider.length,
                position: _currentIndex,
                decorator: DotsDecorator(
                  color: AppColor.greyColor,
                  activeColor: AppColor.primaryColor,
                  size: const Size.square(5.0),
                  activeSize: const Size(8.0, 5.0),
                  spacing: const EdgeInsets.all(2),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              )
            ],
          ),
          const SizedBox(height: 15,),
          optionText('Categories', () {
            GoRouter.of(context).pushNamed(RouterName.category);
          }),
          const SizedBox(height: 15,),
          Container(
              height: 70,
              padding: const EdgeInsets.only(left: 15),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context,index){
                  return Container(
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColor.categoryColor
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          padding: const EdgeInsets.only(left: 10,),
                          child: Text(categoryList[index]['text'],
                            style: GoogleFonts.robotoCondensed(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(7),
                                  bottomRight: Radius.circular(7)
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/img/${categoryList[index]['image']}')
                              )
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>const SizedBox(width: 10,),
              )
          ),
          const SizedBox(height: 20,),
          optionText('Popular Product', () { }),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.6,
                    //  mainAxisExtent: 200,
                    crossAxisCount: 2),
                itemCount: Product.productList.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, PageTransition(
                          child: DetailScreen(proId: Product.productList[index].id),
                          type: PageTransitionType.rightToLeft));
                    },
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 185,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: NetworkImage(Product.productList[index].imageUrl[0],)
                                )
                              ),
                            ),
                            priceAndRate(67, 4.0),
                            const TitleText(text: 'Product title')
                          ],
                        ),
                        Positioned(
                            top:0,right:0,
                            child: IconButton(
                                onPressed: (){
                                  setState(() {
                                    bool isFavorite = toggleIsFavorite(
                                        Product.productList[index].isFavorite
                                    );
                                    Product.productList[index].isFavorite = isFavorite;
                                  });
                                },
                                icon: Icon(
                                  Product.productList[index].isFavorite == true
                                      ? CupertinoIcons.heart_fill: CupertinoIcons.heart,
                                  color: AppColor.primaryTextColor,size: 27,))
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
