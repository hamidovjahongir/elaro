import 'package:bloc/bloc.dart';
import 'package:elaro/features/categories/data/model/categories_model.dart';
import 'package:elaro/features/categories/data/repository/categories_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'categorie_event.dart';
part 'categorie_state.dart';

class CategorieBloc extends Bloc<CategorieEvent, CategorieState> {
  final CategoriesRepositoryImpl repository;
  CategorieBloc(this.repository) : super(CategorieInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      try {
        emit(CategorieLoading());
        final res = await repository.getCategorie();
        emit(CategorieSuccess([res]));
      } catch (e) {
        emit(CategorieError(e.toString()));
      }
    });
  }
}
