part of 'products_bloc_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsSuccessState extends ProductsState {
  final List<Datum> data;

  ProductsSuccessState(this.data);
}

final class ProductsFailureState extends ProductsState {
  final String error;
  ProductsFailureState(this.error);
}