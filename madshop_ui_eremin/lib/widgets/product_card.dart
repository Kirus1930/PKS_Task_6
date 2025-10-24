import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/app_state.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: product.image.isNotEmpty
                        ? Image.asset(product.image, fit: BoxFit.cover)
                        : Container(color: Colors.grey[300]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(product.subtitle,
                          style: const TextStyle(fontSize: 12)),
                      const SizedBox(height: 6),
                      Text('\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
            // Heart top-left
            Positioned(
              top: 8,
              left: 8,
              child: GestureDetector(
                onTap: () => appState.toggleFavorite(product.id),
                child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.black38, shape: BoxShape.circle),
                    child: Image.asset('assets/images/heart.png',
                        width: 20,
                        height: 20,
                        color: product.favorite ? Colors.red : Colors.white)),
              ),
            ),
            // Bag bottom-left
            Positioned(
              bottom: 90,
              left: 8,
              child: GestureDetector(
                onTap: () => appState.toggleCart(product.id),
                child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.black38, shape: BoxShape.circle),
                    child: Image.asset('assets/images/bag.png',
                        width: 20,
                        height: 20,
                        color: product.inCart ? Colors.black : Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
