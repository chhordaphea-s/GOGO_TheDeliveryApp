import 'package:flutter/material.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/cart.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/home.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/search.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/orders.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOGO The Fastest Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/search': (context) => SearchScreen(),
        '/cart': (context) => CartScreen(),
        '/orders': (context) => OrdersScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
