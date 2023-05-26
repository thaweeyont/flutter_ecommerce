import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/models/category_model.dart';
import 'package:flutter_ecommerce/reponsitories/category/category_reponsitory.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryReponsitory _categoryReponsitory;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryReponsitory categoryReponsitory})
      : _categoryReponsitory = categoryReponsitory,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(evant, Emitter<CategoryState> emit) {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryReponsitory.getAllCategories().listen(
          (categories) => add(
            UpdateCategories(categories),
          ),
        );
  }

  void _onUpdateCategories(evant, Emitter<CategoryState> emit) {
    emit(CategoryLoaded(categories: evant.categories));
  }
}
