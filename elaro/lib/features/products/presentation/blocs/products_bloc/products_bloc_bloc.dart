import 'package:bloc/bloc.dart';
import 'package:elaro/features/products/data/model/products_model.dart';
import 'package:elaro/features/products/data/repository/products_repository_impl.dart';
import 'package:meta/meta.dart';

part 'products_bloc_event.dart';
part 'products_bloc_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepositoryImpl impl;
  ProductsBloc(this.impl) : super(ProductsLoadingState()) {
    on<ProductsFetchEvent>(_productsFetchEvent);
    on<ProductsFetchNewEvent>(_productsFetchNewEvent);
    on<ProductsFetchHitEvent>(_productsFetchHitEvent);
    on<ProductsFetchDiscountEvent>(_productsFetchDiscountEvent);
  }

  Future<void> _productsFetchEvent(
    ProductsFetchEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoadingState());
      final request = await impl.fetchProducts();
      print("aslkjdnfaklsjdn: ${request}");
      emit(ProductsSuccessState(request.data));
    } catch (e) {
      emit(ProductsFailureState((e.toString())));
    }
  }

  Future<void> _productsFetchNewEvent(
    ProductsFetchNewEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoadingState());
      final request = await impl.fetchProducts();
      emit(ProductsSuccessState(request.data));
    } catch (e) {
      emit(ProductsFailureState((e.toString())));
    }
  }

  Future<void> _productsFetchHitEvent(
    ProductsFetchHitEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoadingState());
      final request = await impl.fetchHitProducts();
      emit(ProductsSuccessState(request.data));
    } catch (e) {
      emit(ProductsFailureState((e.toString())));
    }
  }

  Future<void> _productsFetchDiscountEvent(
    ProductsFetchDiscountEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoadingState());
      final request = await impl.fetchDiscountProducts();
      emit(ProductsSuccessState(request.data));
    } catch (e) {
      emit(ProductsFailureState((e.toString())));
    }
  }
}
