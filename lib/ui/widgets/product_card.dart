import 'package:flutter/material.dart';
import 'package:product_list_screen/utils/utils.dart';
import '../../models/product_model.dart';
import '../screens/product_details_screen.dart';
import 'price_rating_row.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                padding: const EdgeInsets.only(top:8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                ),
                child: Image.network(
                  product.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(height: 8),
              PriceRatingRow(price: product.price, rating: product.rating),
              SizedBox(height: 8),
              Utils.primaryButton(context: context,title: "Details",height: 32, onPressed: (){
                Get.to(() => ProductDetailsScreen(product: product));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
