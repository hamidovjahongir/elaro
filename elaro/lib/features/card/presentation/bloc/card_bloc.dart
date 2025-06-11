import 'package:bloc/bloc.dart';
import 'package:elaro/features/card/data/model/card_mode.dart';
import 'package:elaro/features/card/data/repository/local_repository.dart';
import 'package:elaro/features/products/data/model/products_model.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  LocalCardRepository repository;
  CardBloc(this.repository) : super(CardInitial()) {
    on<AddData>(_addData);
    on<GetData>(_getData);
  }
  Future<void> _addData(AddData event, Emitter<CardState> emit) async {
    try {
      emit(CardLoadingState());
      final a = event.data;
      await repository.addData(
        CardMode(
          id: a.id,
          nameUz: a.nameUz,
          nameCrl: a.nameCrl,
          nameRu: a.nameRu,
          color: a.color,
          price: a.price,
          qty: a.qty,
          discountedPrice: a.discountedPrice,
          discount: a.discount,
          discountType: a.discountType,
          discountStart: a.discountStart,
          discountEnd: a.discountEnd,
          descriptionUz: a.descriptionUz,
          descriptionCrl: a.descriptionCrl,
          descriptionRu: a.descriptionRu,
          categoryId: a.categoryId,
          brandId: a.brandId,
          images: [],
          attributes: [],
        ),
      );
      add(GetData());
    } catch (e) {
      emit(CardErrorState(e.toString()));
    }
  }

  Future<void> _getData(GetData event, Emitter<CardState> emit) async {
    try {
      emit(CardLoadingState());
      List<CardMode> data = await repository.getData();
      emit(CardSuccessS(data));
    } catch (e) {
      emit(CardErrorState(e.toString()));
    }
  }
}
