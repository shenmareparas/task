import '../../data/models/product_model.dart';
import '../../data/services/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository(this.apiService);

  Future<List<ProductModel>> getProducts() {
    return apiService.fetchProducts();
  }
}
