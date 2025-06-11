part of 'card_bloc.dart';

@immutable
sealed class CardEvent {}

// ignore: must_be_immutable
class GetData extends CardEvent {

}

// ignore: must_be_immutable
class AddData extends CardEvent {
  Datum data;
  AddData(this.data);
}
