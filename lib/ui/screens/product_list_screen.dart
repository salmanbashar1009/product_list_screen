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
        title: Text('🛍️ GetX Shop'),
        centerTitle: true,
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              SearchBarWidget(onSearch: controller.searchProducts),
              CategoryChipsWidget(
                categories: controller.categories,
                selected: controller.selectedCategory,
                onSelected: controller.filterByCategory,
              ),
              Expanded(
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
          );
        },
      ),
    );
  }
}
