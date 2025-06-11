part of 'product_bloc_bloc.dart';

@immutable
sealed class ProductState {}
final class ProductLoadingState extends ProductState {}

final class ProductSuccessState extends ProductState {
  final ProductModel data;
  ProductSuccessState(this.data);
}

final class ProductFailureState extends ProductState {
  final FailureModel failure;
  ProductFailureState(this.failure);
}