import 'package:flutter/material.dart';

class PriceRatingRow extends StatelessWidget {
  final num price;
  final num rating;

  const PriceRatingRow({required this.price, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\$${price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            SizedBox(width: 4),
            Text(rating.toString(), style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}