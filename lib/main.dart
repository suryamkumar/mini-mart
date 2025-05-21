import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_mart/Providers/cart_provider.dart';
import 'package:mini_mart/Providers/product_provider.dart';
import 'package:mini_mart/Screens/cart.dart';
import 'package:mini_mart/Screens/home_Screen.dart';
import 'package:mini_mart/Screens/products_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(backgroundColor: Colors.teal[200])
        ),
        home: HomeScreen(),
        routes: {
          CartScreen.routeName: (_) => CartScreen(),
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
        },
      ),
    );
  }
}
