part of 'categorie_bloc.dart';

@immutable
sealed class CategorieState {}

final class CategorieInitial extends CategorieState {}

final class CategorieError extends CategorieState {
  final String error;
  CategorieError(this.error);
}
final class CategorieLoading extends CategorieState {}

final class CategorieSuccess extends CategorieState {
  final List<CategorieModel> data;
  CategorieSuccess(this.data);
}
