import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final double price;
  final IconData icon;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
  });
}