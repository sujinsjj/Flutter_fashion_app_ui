import 'package:fashion_app_ui/router/name.dart';
import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/categories_list.dart';
import '../utils/color.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            GoRouter.of(context).goNamed(RouterName.bottomBar);
          },
            child: const Icon(Icons.arrow_back_ios_new_rounded,size: 22,)),
        title: pageTitleText('Categories'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: (){
                GoRouter.of(context).pushNamed(RouterName.search);
              },
                  icon: const Icon(Icons.search,color: Colors.black87,)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: categoryList.length,
          itemBuilder: (context,index){
            return Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColor.categoryColor
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleText1(categoryList[index]['text']),
                    Container(
                      width: w*0.3,
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
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>const SizedBox(height: 15,),
        ),
      ),
    );
  }
}
