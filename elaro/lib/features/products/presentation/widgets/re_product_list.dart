import 'package:elaro/features/products/data/model/products_model.dart';
import 'package:elaro/features/products/presentation/pages/products_screen.dart';
import 'package:flutter/material.dart';

class ReProductList extends StatelessWidget {
  final List<Datum> products;
  const ReProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          Datum product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductsScreen(data: products),
                ),
              );
            },
            child: SizedBox(
              width: 180,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withAlpha(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.network(product.images[1].image),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.favorite_border_rounded,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 100 * 44,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      product.nameUz,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey.withAlpha(90),
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 100 * 50,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: Text(
                            product.price,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.deepOrange,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.black,
                                  size: 26,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
