import 'package:flutter/material.dart';
import '../models/category.dart';
import 'product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  // Data kategori
  final List<Category> categories = [
    Category(
      name: 'Makanan',
      icon: Icons.restaurant,
      color: Colors.orange,
    ),
    Category(
      name: 'Minuman',
      icon: Icons.local_drink,
      color: Colors.blue,
    ),
    Category(
      name: 'Elektronik',
      icon: Icons.devices,
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'MyShop Mini',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul dengan styling lebih baik
              Text(
                'Pilih Kategori',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Jelajahi produk berdasarkan kategori',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 24),
              
              // List kategori dengan spacing yang lebih baik
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Deteksi mode desktop
                    bool isDesktop = constraints.maxWidth > 600;
                    
                    if (isDesktop) {
                      // Mode Desktop: Grid Layout
                      return GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: constraints.maxWidth > 900 ? 3 : 2,
                          childAspectRatio: 4.5,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return _buildCategoryCard(
                            context,
                            categories[index],
                          );
                        },
                      );
                    } else {
                      // Mode Mobile: List Layout
                      return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: categories.length,
                        separatorBuilder: (context, index) => SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          return _buildCategoryCard(
                            context,
                            categories[index],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, Category category) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListScreen(
              categoryName: category.name,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.8),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: category.color.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Row(
            children: [
              // Icon container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  category.icon,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              SizedBox(width: 16),
              
              // Text
              Expanded(
                child: Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              
              // Arrow icon
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}