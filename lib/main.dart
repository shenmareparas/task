import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/services/api_service.dart';
import 'domain/repositories/product_repository.dart';
import 'presentation/controllers/product_controller.dart';
import 'presentation/ui/screens/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ApiService()),
        ProxyProvider<ApiService, ProductRepository>(
          update: (_, apiService, __) => ProductRepository(apiService),
        ),
        ChangeNotifierProxyProvider<ProductRepository, ProductController>(
          create: (_) => ProductController(ProductRepository(ApiService())),
          update: (_, repository, __) => ProductController(repository),
        ),
      ],
      child: MaterialApp(
        title: 'Products App',
        home: ProductListScreen(),
      ),
    );
  }
}
