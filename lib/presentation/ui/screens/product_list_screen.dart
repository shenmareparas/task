import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/product_controller.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context);

    // Call fetchProducts if no products are loaded
    if (controller.products.isEmpty && !controller.isLoading) {
      controller.fetchProducts();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : controller.error != null
              ? Center(child: Text('Error: ${controller.error}'))
              : ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return ListTile(
                      leading: Image.network(
                        product.image,
                        width: 50,
                        height: 50,
                        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                      ),
                      title: Text(product.title),
                      subtitle: Text('\$${product.price}'),
                    );
                  },
                ),
    );
  }
}
