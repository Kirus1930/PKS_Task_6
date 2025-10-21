import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {'id': 1, 'name': 'Product 1', 'price': 29.99, 'quantity': 1},
    {'id': 3, 'name': 'Product 3', 'price': 19.99, 'quantity': 2},
    {'id': 4, 'name': 'Product 4', 'price': 49.99, 'quantity': 1},
  ];

  void _updateQuantity(int productId, int change) {
    setState(() {
      final product = _cartItems.firstWhere((p) => p['id'] == productId);
      final newQuantity = product['quantity'] + change;
      if (newQuantity > 0) {
        product['quantity'] = newQuantity;
      } else {
        _cartItems.removeWhere((p) => p['id'] == productId);
      }
    });
  }

  double get _totalPrice {
    return _cartItems.fold(0, (sum, item) {
      return sum + (item['price'] * item['quantity']);
    });
  }

  int get _totalItems {
    return _cartItems.fold(0, (sum, item) => sum + item['quantity']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart ($_totalItems)'),
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.image, color: AppColors.textSecondary),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: AppTextStyles.subtitle,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${item['price']}',
                                style: AppTextStyles.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => _updateQuantity(item['id'], -1),
                            ),
                            Text(
                              item['quantity'].toString(),
                              style: AppTextStyles.subtitle,
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => _updateQuantity(item['id'], 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.top: BorderSide(color: AppColors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$$_totalPrice',
                  style: AppTextStyles.title,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    'Checkout',
                    style: AppTextStyles.button,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}