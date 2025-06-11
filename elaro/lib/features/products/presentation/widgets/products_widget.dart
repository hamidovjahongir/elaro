import 'package:elaro/features/products/data/model/products_model.dart';
import 'package:elaro/features/products/presentation/widgets/re_product_list.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final List<Datum> data;
  const ProductWidget({super.key, required this.data});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.data.length,
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / 1.8,
      ),
      itemBuilder: (context, index) {
        return ReProductList(products: widget.data);
      },
    );
  }
}
