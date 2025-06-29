import 'package:elaro/core/interceptor/interceptor.dart';
import 'package:elaro/core/utils/utils.dart';
import 'package:elaro/features/categories/data/model/categories_model.dart';
import 'package:elaro/features/categories/domain/repository/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final DioClient client;
  CategoriesRepositoryImpl(this.client);

  @override
  Future<CategorieModel> getCategorie() async {
    final data = await client.dioClient.get('/categories/3?price_min=10000000&price_max=20000000&color=#050505');
     if(Utils.isDioSuccess(data.statusCode)) {
      return CategorieModel.fromMap(data.data);
    }
    throw data.data;
  }
}