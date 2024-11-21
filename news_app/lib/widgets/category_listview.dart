import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

// ignore: must_be_immutable
class CategoryListview extends StatelessWidget {
  CategoryListview({super.key});

 final List<CategoryModel> categoryList = [
   CategoryModel(categoryImage: 'assets/images/general.avif', categoryName: 'General'),
    CategoryModel(categoryImage: 'assets/images/business.avif', categoryName: 'Business'),
    CategoryModel(categoryImage: 'assets/images/entertaiment.avif',categoryName: 'Entertainment'),
    CategoryModel(categoryImage: 'assets/images/technology.jpeg',categoryName: 'Technology'),
    CategoryModel(categoryImage: 'assets/images/sports.avif', categoryName: 'Sports'),
    CategoryModel(categoryImage: 'assets/images/science.avif', categoryName: 'Science'),
    CategoryModel(categoryImage: 'assets/images/health.avif', categoryName: 'Health'),
    
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            //final category = categoryList[index];
            return CategoryCard(category:categoryList[index]);
          }),
    );
  }
}
