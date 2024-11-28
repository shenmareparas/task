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
        title: const Text('Products'),
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : controller.error != null
              ? Center(child: Text('Error: ${controller.error}'))
              : Container(
                  color: Colors.grey[200],
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two items per row
                      crossAxisSpacing: 10, // Space between columns
                      mainAxisSpacing: 10, // Space between rows
                      childAspectRatio: 3 / 4, // Aspect ratio of cards
                    ),
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return ProductCard(product: product);
                    },
                  ),
                ),
    );
  }
}
