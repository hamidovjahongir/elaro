import 'package:elaro/features/categories/data/model/categories_model.dart';

abstract class CategoriesRepository {
  Future<CategorieModel> getCategorie();
}