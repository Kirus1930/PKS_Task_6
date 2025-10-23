import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final favs = appState.favorites;
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: favs.isEmpty
            ? const Center(child: Text('No favorites yet'))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: .72),
                itemCount: favs.length,
                itemBuilder: (ctx, i) => ProductCard(product: favs[i]),
              ),
      ),
    );
  }
}
