import 'package:flutter_ecommerce/models/product_model.dart';

abstract class BaseProductReponsitory {
  Stream<List<Product>> getAllProduct();
}
