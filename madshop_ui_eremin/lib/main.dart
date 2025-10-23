import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/splash_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/login_screen.dart';
import 'screens/password_screen.dart';
import 'screens/shop_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/cart_screen.dart';
import 'models/app_state.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => AppState(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD Shopping',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        CreateAccountScreen.routeName: (_) => const CreateAccountScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        PasswordScreen.routeName: (_) => const PasswordScreen(),
        ShopScreen.routeName: (_) => const ShopScreen(),
        FavoritesScreen.routeName: (_) => const FavoritesScreen(),
        CartScreen.routeName: (_) => const CartScreen(),
      },
    );
  }
}
