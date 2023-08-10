import 'package:dots_indicator/dots_indicator.dart';
import 'package:fashion_app_ui/router/name.dart';
import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:fashion_app_ui/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  final List<Map<String, dynamic>> _pageList = [
    {
      'image': 'p.png',
      'title': 'Find Your Best Outfit',
      'subTitle': 'Smart, gorgeous & fashionable collection makes you look cool',
      'button': 'Next',
    },
    {
      'image': 'p1.png',
      'title': 'Discover Trends',
      'subTitle': 'Now we are here to provide variety of the best fashion',
      'button': 'Next',
    },
    {
      'image': 'p2.png',
      'title': 'Latest Outfit',
      'subTitle': 'Express yourself through the art of fashion',
      'button': 'Get Start',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
              top: 0, left: 0, right: 0,
              child: ClipPath(
                clipper: AppClipper(),
                child: Container(
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/img/${_pageList[currentIndex]['image']}')
                    )
                  ),
                ),
              )
          ),
          PageView.builder(
              controller: pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
            itemCount: _pageList.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 500, 30, 120),
                  child: Column(
                    children: [
                      BigText(text: _pageList[index]['title'],color: Colors.white,),
                      const SizedBox(height: 15,),
                      SmallText(text: _pageList[index]['subTitle'],color: Colors.white70,textAlign: false,)
                    ],
                  ),
                );
              }
          ),
          Positioned(
              bottom: 40,left: 20,right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DotsIndicator(
                    dotsCount: _pageList.length,
                    position: currentIndex,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.white,
                        size: const Size.square(8.0),
                        activeSize: const Size(20, 8),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if (currentIndex < 2) {
                        currentIndex++;
                        if (currentIndex < 3) {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      }
                      else{
                        GoRouter.of(context).pushReplacementNamed(RouterName.signIn);
                      }
                    },
                    child: Container(
                      height: 45,width: w*0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                      ),
                      child: Center(
                        child: Text(_pageList[currentIndex]['button'],
                          style: const TextStyle(
                              fontSize: 18,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}

class AppClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/2, size.height-100, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}
