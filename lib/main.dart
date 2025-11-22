import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyShopMiniApp());
}

class MyShopMiniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop Mini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}