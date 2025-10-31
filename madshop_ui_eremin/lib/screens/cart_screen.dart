import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed('/shop');
        break;
      case 1:
        Navigator.of(context).pushReplacementNamed('/favorites');
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed('/cart');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('${appState.totalItemsInCart} items'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: appState.cart.length,
                itemBuilder: (ctx, i) {
                  final item = appState.cart[i];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(item.product.image,
                              width: 64, height: 64),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.product.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    '\$${item.product.price.toStringAsFixed(2)}'),
                              ],
                            ),
                          ),
                          // --- Кнопки изменения количества и удаления ---
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () =>
                                      appState.changeQty(item.product.id, -1),
                                  icon: const Icon(Icons.remove)),
                              Text('${item.qty}',
                                  style: const TextStyle(fontSize: 16)),
                              IconButton(
                                  onPressed: () =>
                                      appState.changeQty(item.product.id, 1),
                                  icon: const Icon(Icons.add)),
                              IconButton(
                                onPressed: () => appState
                                    .toggleCart(item.product.id, force: false),
                                icon: const Icon(Icons.delete_outline,
                                    color: Colors.redAccent),
                                tooltip: 'Remove item',
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
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text('\$${appState.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ],
        ),
      ),

      // --- Навигационное меню ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 8,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
