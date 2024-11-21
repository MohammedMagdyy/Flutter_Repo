import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/categorypage.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 8,
          ),
          child: Container(
            height: 85,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: const Color.fromARGB(255, 195, 127, 127),
              image: DecorationImage(
                image: AssetImage(category.categoryImage),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Text(
                category.categoryName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CategoryView(
                category: category.categoryName,
              ),
            ),
          );
        }
        );
  }
}
