import 'package:flutter/material.dart';

import '../utils/color.dart';

class Product{
  final int id;
  final String proTitle;
  final String proType;
  final String brand;
  final List<String> size;
  final String category;
  final List<String> imageUrl;
  final double price;
  final double rating;
  final String description;
  final List<Color> color;
  bool isFavorite;
  bool isSelected;

  Product({
    required this.id,
    required this.proTitle,
    required this.proType,
    required this.brand,
    required this.size,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.description,
    required this.color,
    required this.isFavorite,
    required this.isSelected
  });

  static List<Product> productList = [
    Product(
        id: 0,
        proTitle: 'Black dress',
        proType: 'Dress',
        brand: 'DTfv hh',
        size: ['S','M','L','XL','XXL'],
        category: 'Women',
        imageUrl: [
          'https://i.pinimg.com/564x/ac/63/41/ac6341a863c76624a89649f37175c8e0.jpg',
        ],
        price: 34.56,
        rating: 3.5,
        description: 'jsbysiu xhgddb duyged whdgdbdhp  kjfgdd  wdud wwigd  dygo b ddbdvd'
            'jgd bdbd d cnhd gfio d kjdod g78f  jhuwdvwuidnd hbuinenvudg hgvbfuh fhbu  bbjn'
            'hhye dhvbff byg   ygeyef bif  uib  ug uh ffo hhf uf ifhh',
        color: [Colors.brown,Colors.black,AppColor.color1,AppColor.color2],
        isFavorite: false,
        isSelected: false
    ),
    Product(
        id: 1,
        proTitle: 'Long Black skirt',
        proType: 'Skirt',
        brand: 'DTfv hh',
        size: ['S','M','L','XL'],
        category: 'Women',
        imageUrl:[
          'https://i.pinimg.com/564x/37/98/12/3798129dd8c577f4fa7572975cadaf34.jpg',
        ],
        price: 34.56,
        rating: 3.5,
        description: 'jsbysiu xhgddb duyged whdgdbdhp  kjfgdd  wdud wwigd  dygo b ddbdvd'
            'jgd bdbd d cnhd gfio d kjdod g78f  jhuwdvwuidnd hbuinenvudg hgvbfuh fhbu  bbjn'
            'hhye dhvbff byg   ygeyef bif  uib  ug uh ffo hhf uf ifhh',
        color: [Colors.brown,Colors.black,AppColor.color2],
        isFavorite: false,
        isSelected: false
    ),
    Product(
        id: 2,
        proTitle: 'Long Black skirt',
        proType: 'Skirt',
        brand: 'DTfv hh',
        size: ['S','M','L','XL'],
        category: 'Women',
        imageUrl: [
          'https://i.pinimg.com/564x/e0/de/8a/e0de8a882ae9f9bdb27de19e9c20ac44.jpg',
          'https://i.pinimg.com/564x/0e/85/28/0e85284103f00f5ea7a08f216153f1e0.jpg',
          'https://i.pinimg.com/474x/38/2c/2d/382c2d96b1f8941b0ec41caafc49edfb.jpg'
        ],
        price: 34.56,
        rating: 3.5,
        description: 'jsbysiu xhgddb duyged whdgdbdhp  kjfgdd  wdud wwigd  dygo b ddbdvd'
            'jgd bdbd d cnhd gfio d kjdod g78f  jhuwdvwuidnd hbuinenvudg hgvbfuh fhbu  bbjn'
            'hhye dhvbff byg   ygeyef bif  uib  ug uh ffo hhf uf ifhh',
        color: [Colors.brown,Colors.black,AppColor.color2,AppColor.color1],
        isFavorite: true,
        isSelected: false
    ),
    Product(
        id: 3,
        proTitle: 'Black dress',
        proType: 'Dress',
        brand: 'DTfv hh',
        size: ['S','M','L','XL','XXL'],
        category: 'Women',
        imageUrl: [
          'https://i.pinimg.com/564x/ac/63/41/ac6341a863c76624a89649f37175c8e0.jpg'
        ],
        price: 34.56,
        rating: 3.5,
        description: 'jsbysiu xhgddb duyged whdgdbdhp  kjfgdd  wdud wwigd  dygo b ddbdvd'
            'jgd bdbd d cnhd gfio d kjdod g78f  jhuwdvwuidnd hbuinenvudg hgvbfuh fhbu  bbjn'
            'hhye dhvbff byg   ygeyef bif  uib  ug uh ffo hhf uf ifhh',
        color: [Colors.brown,Colors.black,AppColor.color1,AppColor.color2],
        isFavorite: false,
        isSelected: false
    ),
    Product(
        id: 4,
        proTitle: 'Long Black skirt',
        proType: 'Skirt',
        brand: 'DTfv hh',
        size: ['S','M','L','XL'],
        category: 'Women',
        imageUrl:['https://i.pinimg.com/474x/c2/9f/c7/c29fc723936592fef55a8c69b98a074f.jpg'],
        price: 34.56,
        rating: 3.5,
        description: 'jsbysiu xhgddb duyged whdgdbdhp  kjfgdd  wdud wwigd  dygo b ddbdvd'
            'jgd bdbd d cnhd gfio d kjdod g78f  jhuwdvwuidnd hbuinenvudg hgvbfuh fhbu  bbjn'
            'hhye dhvbff byg   ygeyef bif  uib  ug uh ffo hhf uf ifhh',
        color: [Colors.brown,Colors.black,AppColor.color2],
        isFavorite: false,
        isSelected: false
    ),
    Product(
        id: 5,
        proTitle: 'Long Black skirt',
        proType: 'Skirt',
        brand: 'DTfv hh',
        size: ['S','M','L','XL'],
        category: 'Women',
        imageUrl: [
          'https://i.pinimg.com/564x/4f/e2/e9/4fe2e9a5b187a3278a5f2eff44669329.jpg'
        ],
        price: 34.56,
        rating: 3.5,
        description: 'jsbysiu xhgddb duyged whdgdbdhp  kjfgdd  wdud wwigd  dygo b ddbdvd'
            'jgd bdbd d cnhd gfio d kjdod g78f  jhuwdvwuidnd hbuinenvudg hgvbfuh fhbu  bbjn'
            'hhye dhvbff byg   ygeyef bif  uib  ug uh ffo hhf uf ifhh',
        color: [Colors.brown,Colors.black,AppColor.color2,AppColor.color1],
        isFavorite: true,
        isSelected: false
    ),
    Product(
        id: 6,
        proTitle: 'Black dress',
        proType: 'Dress',
        brand: 'DTfv hh',
        size: ['S','M','L','XL','XXL'],
        category: 'Women',
        imageUrl: [
          'https://i.pinimg.com/564x/ac/63/41/ac6341a863c76624a89649f37175c8e0.jpg',
        ],
        price: 34.56,
        rating: 3.5,
        description: 'jsbysiu xhgddb duyged whdgdbdhp  kjfgdd  wdud wwigd  dygo b ddbdvd'
            'jgd bdbd d cnhd gfio d kjdod g78f  jhuwdvwuidnd hbuinenvudg hgvbfuh fhbu  bbjn'
            'hhye dhvbff byg   ygeyef bif  uib  ug uh ffo hhf uf ifhh',
        color: [Colors.brown,Colors.black,AppColor.color1,AppColor.color2],
        isFavorite: false,
        isSelected: false
    ),
    Product(
        id: 7,
        proTitle: 'Long Black skirt',
        proType: 'Skirt',
        brand: 'DTfv hh',
        size: ['S','M','L','XL'],
        category: 'Women',
        imageUrl:['https://i.pinimg.com/474x/c2/9f/c7/c29fc723936592fef55a8c69b98a074f.jpg'],
        price: 34.56,
        rating: 3.5,
        description: 'jsbysiu xhgddb duyged whdgdbdhp  kjfgdd  wdud wwigd  dygo b ddbdvd'
            'jgd bdbd d cnhd gfio d kjdod g78f  jhuwdvwuidnd hbuinenvudg hgvbfuh fhbu  bbjn'
            'hhye dhvbff byg   ygeyef bif  uib  ug uh ffo hhf uf ifhh',
        color: [Colors.brown,Colors.black,AppColor.color2],
        isFavorite: false,
        isSelected: false
    ),
    Product(
        id: 8,
        proTitle: 'Long Black skirt',
        proType: 'Skirt',
        brand: 'DTfv hh',
        size: ['S','M','L','XL'],
        category: 'Women',
        imageUrl: [
          'https://i.pinimg.com/564x/4f/e2/e9/4fe2e9a5b187a3278a5f2eff44669329.jpg'
        ],
        price: 34.56,
        rating: 3.5,
        description: 'jsbysiu xhgddb duyged whdgdbdhp  kjfgdd  wdud wwigd  dygo b ddbdvd'
            'jgd bdbd d cnhd gfio d kjdod g78f  jhuwdvwuidnd hbuinenvudg hgvbfuh fhbu  bbjn'
            'hhye dhvbff byg   ygeyef bif  uib  ug uh ffo hhf uf ifhh',
        color: [Colors.brown,Colors.black,AppColor.color2,AppColor.color1],
        isFavorite: true,
        isSelected: false
    ),
    Product(
        id: 9,
        proTitle: 'Long Black skirt',
        proType: 'Skirt',
        brand: 'DTfv hh',
        size: ['S','M','L','XL'],
        category: 'Women',
        imageUrl: [
          'https://i.pinimg.com/564x/e0/de/8a/e0de8a882ae9f9bdb27de19e9c20ac44.jpg',
          'https://i.pinimg.com/564x/0e/85/28/0e85284103f00f5ea7a08f216153f1e0.jpg',
          'https://i.pinimg.com/474x/38/2c/2d/382c2d96b1f8941b0ec41caafc49edfb.jpg'
        ],
        price: 34.56,
        rating: 3.5,
        description: 'jsbysiu xhgddb duyged whdgdbdhp  kjfgdd  wdud wwigd  dygo b ddbdvd'
            'jgd bdbd d cnhd gfio d kjdod g78f  jhuwdvwuidnd hbuinenvudg hgvbfuh fhbu  bbjn'
            'hhye dhvbff byg   ygeyef bif  uib  ug uh ffo hhf uf ifhh',
        color: [Colors.brown,Colors.black,AppColor.color2,AppColor.color1],
        isFavorite: true,
        isSelected: false
    ),
  ];

  static List<Product> getFavoriteProduct(){
    List<Product> _favList = Product.productList;
    return _favList.where((element) => element.isFavorite == true).toList();
  }

  static List<Product> addToCardProduct(){
    List<Product> _selectedProduct = Product.productList;
    return _selectedProduct.where((element) => element.isSelected == true).toList();
  }


}