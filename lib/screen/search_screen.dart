import 'package:fashion_app_ui/router/name.dart';
import 'package:fashion_app_ui/screen/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> _searchedList = [
    'hoodies','dress','long skirt','kids shoes','jacket','top','men shirt'
  ];
  final List<String> _popularSearched = [
    'Hoodies','women sweatshirt','men shirt','shoes','jacket','top',
  ];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    GoRouter.of(context).goNamed(RouterName.bottomBar);
                  },
                    child: const Icon(Icons.arrow_back_outlined)),
                Container(
                    height: 45,
                    width: w*0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColor.greyColor.withOpacity(0.9)
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.search,color: AppColor.primaryColor,),
                          suffixIcon: Icon(CupertinoIcons.clear,color: Colors.grey,size: 20,),
                          hintText: "Search",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                    )
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text('Search History',
              style: GoogleFonts.robotoCondensed(
                  fontSize: 18
              ),),
            const SizedBox(height: 20,),
            Wrap(
              spacing: 10,runSpacing: 7,
              children: List.generate(_searchedList.length, (index) => Chip(
                  label: Text(_searchedList[index],
                    style: GoogleFonts.robotoCondensed(fontSize: 15,color: Colors.grey),),
                onDeleted: (){},
                deleteIconColor: Colors.grey,
                backgroundColor: AppColor.greyColor.withOpacity(0.8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                side: BorderSide.none,
                padding: EdgeInsets.all(6),
              )),
            ),
            const SizedBox(height: 20,),
            Text('Popular Search',
              style: GoogleFonts.robotoCondensed(
                fontSize: 18
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _popularSearched.length,
                  itemBuilder: (context,index){
                    return SizedBox(
                      height: 40,
                      child: Text(
                        _popularSearched[index],style: GoogleFonts.robotoCondensed(fontSize: 15),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
