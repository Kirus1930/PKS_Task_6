import 'package:flutter/foundation.dart';
import 'product.dart';

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, this.qty = 1});
}

class AppState extends ChangeNotifier {
  final List<Product> _products = [
    Product(
        id: 'p1',
        title: 'Red Sneakers',
        subtitle: 'Comfort shoes',
        price: 69.99,
        image: 'assets/images/product1.png'),
    Product(
        id: 'p2',
        title: 'Blue Jacket',
        subtitle: 'Waterproof',
        price: 129.99,
        image: 'assets/images/product2.png'),
    Product(
        id: 'p3',
        title: 'Wrist Watch',
        subtitle: 'Classic',
        price: 199.99,
        image: 'assets/images/product3.png'),
    Product(
        id: 'p4',
        title: 'Sunglasses',
        subtitle: 'UV protection',
        price: 49.99,
        image: 'assets/images/product4.png'),
  ];

  final List<CartItem> _cart = [];

  List<Product> get products => List.unmodifiable(_products);
  List<Product> get favorites => _products.where((p) => p.favorite).toList();
  List<CartItem> get cart => List.unmodifiable(_cart);

  int get totalItemsInCart => _cart.fold(0, (sum, item) => sum + item.qty);
  double get totalAmount =>
      _cart.fold(0.0, (sum, item) => sum + item.qty * item.product.price);

  void toggleFavorite(String productId, {bool? force}) {
    final p = _products.firstWhere((e) => e.id == productId);
    p.favorite = force ?? !p.favorite;
    notifyListeners();
  }

  void toggleCart(String productId, {bool? force}) {
    final p = _products.firstWhere((e) => e.id == productId);
    p.inCart = force ?? !p.inCart;
    if (p.inCart) {
      final exists = _cart.where((c) => c.product.id == productId).toList();
      if (exists.isEmpty) {
        _cart.add(CartItem(product: p, qty: 1));
      }
    } else {
      _cart.removeWhere((c) => c.product.id == productId);
    }
    notifyListeners();
  }

  void changeQty(String productId, int delta) {
    final idx = _cart.indexWhere((c) => c.product.id == productId);
    if (idx == -1) return;
    final item = _cart[idx];
    item.qty = (item.qty + delta).clamp(0, 999);
    if (item.qty == 0) {
      _cart.removeAt(idx);
      final p = _products.firstWhere((e) => e.id == productId);
      p.inCart = false;
    }
    notifyListeners();
  }
}
