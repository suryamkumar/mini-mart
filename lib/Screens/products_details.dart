import 'package:flutter/material.dart';
import 'package:mini_mart/Models/products.dart';
import 'package:mini_mart/Providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();


}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool showFullDescription = false;
  int limit = 1;


  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 0.9,
              child: Stack(
                children: [
                  PageView(
                    children: [
                      Image.asset(product.imageUrl, fit: BoxFit.cover),
                    ],
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 8,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 4),
                  Text(
                    product.quantity,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          '₹${product.originalPrice.toInt()}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),

                      Text('₹${product.price.toInt()}',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Quantity Selection
                  Text('Quantity',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (limit > 1) limit--;
                                });
                                },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.black,
                                ),
                                padding: EdgeInsets.all(6),
                                child: Icon(Icons.remove, size: 16, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 16),
                            Text('$limit', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            ),
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  limit++;
                                });
                                },
                              child: Container(
                                decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.add, size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                    ],
                  ),
                  SizedBox(height: 20),

                  // Description Section
                  Text('Description',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showFullDescription = !showFullDescription;
                      });
                    },
                    child: Text(
                      showFullDescription
                          ? product.description
                          : product.description.length > 80
                          ? '${product.description.substring(0, 80)}... view more'
                          : product.description,
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cart.addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Your Product is Successfully Added to your Cart.',)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Add to Cart',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart',
                      arguments:1 );
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                    tooltip: 'Go to Cart',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

