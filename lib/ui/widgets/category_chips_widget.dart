import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';

class CategoryChipsWidget extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final Function(String) onSelected;

  const CategoryChipsWidget({
    required this.categories,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selected;
          return GetBuilder<ProductController>(
            builder: (controller) {
              return ChoiceChip(
                label: Text(category,),
                checkmarkColor: isSelected ? Colors.white : Colors.black,
                selected: isSelected,
                onSelected: (_) =>  onSelected(category),
                selectedColor: Colors.pinkAccent,
                backgroundColor: Colors.transparent,
                labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
              );
            }
          );
        },
      ),
    );
  }
}