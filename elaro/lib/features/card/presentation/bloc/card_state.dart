part of 'card_bloc.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

class CardLoadingState extends CardState {}

class CardErrorState extends CardState {
  final String error;

  CardErrorState(this.error);
}

class CardSuccessS extends CardState {
  final List<CardMode> products;
  CardSuccessS(this.products);
}
