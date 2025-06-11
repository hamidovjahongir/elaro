import 'package:elaro/features/products/data/model/preduct_model.dart';
import 'package:elaro/features/products/data/model/products_model.dart';

abstract class ProductsRepository {
  Future<ProductsModel> fetchProducts();
  Future<ProductsModel> fetchHitProducts();
  Future<ProductsModel> fetchDiscountProducts();
  Future<ProductsModel> fetchNewProducts();
  Future<ProductModel> fetchProductById(int id);
}
