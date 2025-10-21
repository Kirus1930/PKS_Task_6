import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import 'favorites_screen.dart';
import 'cart_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _products = [
    {
      'id': 1,
      'name': 'Product 1',
      'price': '29.99',
      'isFavorite': false,
      'isInCart': false
    },
    {
      'id': 2,
      'name': 'Product 2',
      'price': '39.99',
      'isFavorite': true,
      'isInCart': false
    },
    {
      'id': 3,
      'name': 'Product 3',
      'price': '19.99',
      'isFavorite': false,
      'isInCart': true
    },
    {
      'id': 4,
      'name': 'Product 4',
      'price': '49.99',
      'isFavorite': true,
      'isInCart': true
    },
    {
      'id': 5,
      'name': 'Product 5',
      'price': '24.99',
      'isFavorite': false,
      'isInCart': false
    },
    {
      'id': 6,
      'name': 'Product 6',
      'price': '34.99',
      'isFavorite': true,
      'isInCart': false
    },
  ];

  void _toggleFavorite(int productId) {
    setState(() {
      final product = _products.firstWhere((p) => p['id'] == productId);
      product['isFavorite'] = !product['isFavorite'];
    });
  }

  void _toggleCart(int productId) {
    setState(() {
      final product = _products.firstWhere((p) => p['id'] == productId);
      product['isInCart'] = !product['isInCart'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ProductCard(
            name: product['name'],
            price: product['price'],
            isFavorite: product['isFavorite'],
            isInCart: product['isInCart'],
            onFavoriteTap: () => _toggleFavorite(product['id']),
            onCartTap: () => _toggleCart(product['id']),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
