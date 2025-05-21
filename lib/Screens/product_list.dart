import 'package:flutter/material.dart';
import 'package:mini_mart/Models/products.dart';
import 'package:mini_mart/components/product_tile.dart';

SliverList buildProductSliverList(List<Product> products) {
  return SliverList(
    delegate: SliverChildListDelegate([
      ProductGrid(products: products),
      const SizedBox(height: 100),
    ]),
  );
}
