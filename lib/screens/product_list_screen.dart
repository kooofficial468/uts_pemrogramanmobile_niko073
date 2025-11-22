import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryName;

  ProductListScreen({required this.categoryName});

  
  List<Product> getProductsByCategory() {
    Map<String, List<Product>> allProducts = {
      'Makanan': [
        Product(
          name: 'Nasi Goreng',
          category: 'Makanan',
          price: 25000,
          icon: Icons.rice_bowl,
        ),
        Product(
          name: 'Mie Ayam',
          category: 'Makanan',
          price: 20000,
          icon: Icons.ramen_dining,
        ),
        Product(
          name: 'Sate Ayam',
          category: 'Makanan',
          price: 30000,
          icon: Icons.kebab_dining,
        ),
        Product(
          name: 'Bakso',
          category: 'Makanan',
          price: 22000,
          icon: Icons.soup_kitchen,
        ),
      ],
      'Minuman': [
        Product(
          name: 'Es Teh',
          category: 'Minuman',
          price: 5000,
          icon: Icons.local_cafe,
        ),
        Product(
          name: 'Jus Jeruk',
          category: 'Minuman',
          price: 10000,
          icon: Icons.local_drink,
        ),
        Product(
          name: 'Kopi',
          category: 'Minuman',
          price: 15000,
          icon: Icons.coffee,
        ),
        Product(
          name: 'Milkshake',
          category: 'Minuman',
          price: 18000,
          icon: Icons.icecream,
        ),
      ],
      'Elektronik': [
        Product(
          name: 'Smartphone',
          category: 'Elektronik',
          price: 3000000,
          icon: Icons.smartphone,
        ),
        Product(
          name: 'Laptop',
          category: 'Elektronik',
          price: 8000000,
          icon: Icons.laptop,
        ),
        Product(
          name: 'Headphone',
          category: 'Elektronik',
          price: 500000,
          icon: Icons.headphones,
        ),
        Product(
          name: 'Smartwatch',
          category: 'Elektronik',
          price: 2000000,
          icon: Icons.watch,
        ),
      ],
    };

    return allProducts[categoryName] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final products = getProductsByCategory();
    
    
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Produk $categoryName'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isDesktop ? 1200 : double.infinity),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isDesktop ? 4 : 2,  
                crossAxisSpacing: 16,       
                mainAxisSpacing: 16,        
                childAspectRatio: isDesktop ? 0.75 : 0.85, 
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onTap: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          product: products[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}