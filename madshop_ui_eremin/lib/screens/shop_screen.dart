import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/product_card.dart';

class ShopScreen extends StatelessWidget {
  static const routeName = '/shop';
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Shop'),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12)),
              child: Text('Cart: ${appState.totalItemsInCart}'),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/favorites'),
              icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/cart'),
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: .72),
          itemCount: appState.products.length,
          itemBuilder: (ctx, i) => ProductCard(product: appState.products[i]),
        ),
      ),
    );
  }
}
