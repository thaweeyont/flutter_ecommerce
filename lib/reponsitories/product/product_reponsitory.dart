import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/models/product_model.dart';
import 'package:flutter_ecommerce/reponsitories/product/base_product_reponsitory.dart';

class ProductReponsitory extends BaseProductReponsitory {
  final FirebaseFirestore _firebaseFirestore;

  ProductReponsitory({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProduct() {
    return _firebaseFirestore.collection('product').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}
