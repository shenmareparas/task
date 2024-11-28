import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import '../../domain/repositories/product_repository.dart';

class ProductController with ChangeNotifier {
  final ProductRepository repository;
  List<ProductModel> _products = [];
  bool _isLoading = false;
  String? _error;

  ProductController(this.repository);

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await repository.getProducts();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
