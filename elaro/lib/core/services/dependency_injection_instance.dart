import 'package:elaro/core/interceptor/interceptor.dart';
import 'package:elaro/features/card/data/repository/local_repository.dart';
import 'package:elaro/features/card/presentation/bloc/card_bloc.dart';
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

void _styles() {
  // Bu yerda UI style servislari bo‘lsa, yoziladi
}

void _repositorys() {
  sl.registerLazySingleton<ProductsRepositoryImpl>(
    () => ProductsRepositoryImpl(sl<DioClient>()),
  );

  // ✅ LocalCardRepository ni ham ro‘yxatdan o‘tkazamiz
  sl.registerLazySingleton<LocalCardRepository>(
    () => LocalCardRepository(),
  );
}

void _block() {
  sl.registerFactory(() => ProductsBloc(sl<ProductsRepositoryImpl>()));
  sl.registerFactory(() => ProductBloc(sl<ProductsRepositoryImpl>()));
  sl.registerFactory(() => CardBloc(sl<LocalCardRepository>()));
}

void _dataSources() {
  // Agar network yoki database uchun data source bo‘lsa, shu yerga yoziladi
}

void _useCase() {
  // Agar useCase lar bo‘lsa, bu yerda ro‘yxatdan o‘tkazamiz
}
