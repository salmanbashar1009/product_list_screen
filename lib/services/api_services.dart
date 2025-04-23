import 'dart:convert';

import '../../models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://dummyjson.com/products';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl?limit=100'));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body)['products'];
      return products.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<List<Product>> searchProducts(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search?q=$query'));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body)['products'];
      return products.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Search failed');
    }
  }

  static Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  static Future<List<Product>> fetchByCategory(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/category/$category'));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body)['products'];
      return products.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Category fetch failed');
    }
  }
}
