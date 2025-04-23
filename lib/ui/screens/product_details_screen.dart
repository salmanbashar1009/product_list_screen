import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../utils/utils.dart';
import '../widgets/image_carousel.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details"),centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCarousel(images: product.images),
              SizedBox(height: 20),
              Text(
                product.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 10),
              Text(
                product.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Price: \$${product.price}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      SizedBox(width: 5),
                      Text('${product.rating}',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      )),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),
              Utils.primaryButton(context: context,title: "Buy Now",height: 56, onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}