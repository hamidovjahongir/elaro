import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:elaro/features/categories/data/model/categories_model.dart';
import 'package:elaro/features/categories/data/repository/categories_repository_impl.dart';

import 'package:elaro/core/interceptor/interceptor.dart';

class MockDioClient extends Mock implements DioClient {}

void main() {
  late MockDioClient mockClient;
  late CategoriesRepositoryImpl repository;

  setUp(() {
    mockClient = MockDioClient();
    repository = CategoriesRepositoryImpl(mockClient);
  });

  test('getCategorie returns CategorieModel on success', () async {
    final jsonData = {
      'id': 3,
      'name': 'Elektronika',
    };

    final response = Response(
      requestOptions: RequestOptions(path: '/categories/3'),
      statusCode: 200,
      data: jsonData,
    );

    when(mockClient.dioClient.get(any?? '')).thenAnswer((_) async => response);

    final result = await repository.getCategorie();

    expect(result, isA<CategorieModel>());
    expect(result.data.id, 3);
    expect(result.data.nameUz, 'Kompyuter texnikasi');

    verify(mockClient.dioClient.get(any ?? '')).called(1);
  });
}
