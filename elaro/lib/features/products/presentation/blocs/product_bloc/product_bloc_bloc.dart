import 'package:bloc/bloc.dart';
import 'package:elaro/core/error/failure_model.dart';
import 'package:elaro/features/products/data/model/preduct_model.dart';
import 'package:elaro/features/products/data/repository/products_repository_impl.dart';
import 'package:meta/meta.dart';

part 'product_bloc_event.dart';
part 'product_bloc_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepositoryImpl impl;

  ProductBloc(this.impl) : super(ProductLoadingState()) {
    on<ProductFetchByIdEvent>(_productFetchByIdEvent);
  }

  Future<void> _productFetchByIdEvent(
    ProductFetchByIdEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(ProductLoadingState());
      final request = await impl.fetchProductById(event.id);
      emit(ProductSuccessState(request));
    } catch (e) {
      emit(ProductFailureState(FailureModel(e.toString())));
    }
  }
}
