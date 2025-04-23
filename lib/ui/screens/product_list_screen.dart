import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';
import '../widgets/category_chips_widget.dart';
import '../widgets/product_card.dart';
import '../widgets/search_bar.dart';


class ProductListScreen extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        surfaceTintColor: Colors.transparent,
        title: Text('🛍️ Beauty Shop'),

      ),
      body: SafeArea(
        child: GetBuilder<ProductController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  SearchBarWidget(onSearch: controller.searchProducts),
                  CategoryChipsWidget(
                    categories: controller.categories,
                    selected: controller.selectedCategory,
                    onSelected: controller.filterByCategory,
                  ),
               controller.isLoading ? Center(child: CircularProgressIndicator()) :   Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) => ProductCard(product: controller.products[index]),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
