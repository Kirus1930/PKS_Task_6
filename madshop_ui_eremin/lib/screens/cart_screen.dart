import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Cart'),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12)),
              child: Text('${appState.totalItemsInCart} items'),
            )
          ],
        ),
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
                                    '\$${item.product.price.toStringAsFixed(2)}')
                              ],
                            ),
                          ),
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
                            ],
                          )
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
                ElevatedButton(onPressed: () {}, child: const Text('Checkout'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
