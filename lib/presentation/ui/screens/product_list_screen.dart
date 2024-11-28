import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/product_controller.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context);
    if (controller.products.isEmpty && !controller.isLoading) {
      controller.fetchProducts();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : controller.error != null
              ? Center(child: Text('Error: ${controller.error}'))
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return ProductCard(product: product);
                  },
                ),
    );
  }
}
