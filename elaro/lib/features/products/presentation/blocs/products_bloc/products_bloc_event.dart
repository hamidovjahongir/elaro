part of 'products_bloc_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class ProductsFetchEvent extends ProductsEvent {}

final class ProductsFetchNewEvent extends ProductsEvent {}

final class ProductsFetchHitEvent extends ProductsEvent {}

final class ProductsFetchDiscountEvent extends ProductsEvent {}