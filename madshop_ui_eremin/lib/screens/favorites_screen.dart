import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> favoriteProducts = [
      {'id': 1, 'name': 'Favorite Product 1', 'price': '29.99'},
      {'id': 2, 'name': 'Favorite Product 2', 'price': '39.99'},
      {'id': 3, 'name': 'Favorite Product 3', 'price': '49.99'},
      {'id': 4, 'name': 'Favorite Product 4', 'price': '19.99'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];
          return ProductCard(
            name: product['name'],
            price: product['price'],
            isFavorite: true,
            isInCart: false,
          );
        },
      ),
    );
  }
}
