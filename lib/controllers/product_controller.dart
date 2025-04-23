import 'package:get/get.dart';

import '../models/product_model.dart';
import '../services/api_services.dart';

class ProductController extends GetxController {
  List<Product> products = [];
  bool isLoading = true;
  List<String> categories = ["All","beauty","jewelery","clothing"];
  String selectedCategory = '';

  void updateState() => update();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    fetchCategories();
  }

  void fetchProducts() async {
    try {
      isLoading = true;
      update();
      products = await ApiService.fetchProducts();
    } finally {
      isLoading = false;
      update();
    }
  }

  void fetchCategories() async {
    try {
      categories = await ApiService.fetchCategories();
      update();
    } catch (_) {}
  }

  void searchProducts(String query) async {
    if (query.isEmpty) {
      fetchProducts();
    } else {
      try {
        isLoading = true;
        update();
        products = await ApiService.searchProducts(query);
      } finally {
        isLoading = false;
        update();
      }
    }
  }

  void filterByCategory(String category) async {
    selectedCategory = category;
    update();
    try {
      isLoading = true;
      update();
      if (category == 'All') {
        products = await ApiService.fetchProducts();
      } else{
      products = await ApiService.fetchByCategory(category);
      }
    } finally {
      isLoading = false;
      update();
    }
  }
}