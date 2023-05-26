import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/models/product_model.dart';
import 'package:flutter_ecommerce/reponsitories/product/product_reponsitory.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductReponsitory _productReponsitory;
  StreamSubscription? _productSubscription;
  ProductBloc({required ProductReponsitory productReponsitory})
      : _productReponsitory = productReponsitory,
        super(ProductLoading()) {
    on<LoadProduct>(_onLoadProduct);
    on<UpdateProduct>(_onUpdateProduct);
  }

  void _onLoadProduct(event, Emitter<ProductState> emit) {
    _productSubscription?.cancel();
    _productSubscription = _productReponsitory.getAllProduct().listen(
          (product) => add(
            UpdateProduct(product),
          ),
        );
  }

  void _onUpdateProduct(event, Emitter<ProductState> emit) {
    emit(ProductLoaded(product: event.product));
  }
}
