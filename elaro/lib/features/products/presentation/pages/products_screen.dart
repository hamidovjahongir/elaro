import 'package:elaro/features/products/data/model/products_model.dart';
import 'package:elaro/features/products/presentation/widgets/products_widget.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
    final List<Datum> data;
  const ProductsScreen({
    super.key,
    required this.data,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProductWidget(
        data: widget.data,
      ),
    );
  }
}