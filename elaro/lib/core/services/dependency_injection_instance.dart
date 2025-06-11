import 'package:elaro/core/interceptor/interceptor.dart';
import 'package:elaro/features/products/data/repository/products_repository_impl.dart';
import 'package:elaro/features/products/presentation/blocs/product_bloc/product_bloc_bloc.dart';
import 'package:elaro/features/products/presentation/blocs/products_bloc/products_bloc_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> serviceLocator() async {
  _client();
  _styles();
  _dataSources();
  _repositorys();
  _useCase();
  _block();
}

void _client() {
  sl.registerLazySingleton<DioClient>(() => DioClient());
}

void _styles() {}

void _repositorys() {
  sl.registerLazySingleton<ProductsRepositoryImpl>(
    () => ProductsRepositoryImpl(sl<DioClient>()),
  );
}

void _block() {
  sl.registerFactory(() => ProductsBloc(sl<ProductsRepositoryImpl>()));
  sl.registerFactory(() => ProductBloc(sl<ProductsRepositoryImpl>()));
}

void _dataSources() {}

void _useCase() {}
