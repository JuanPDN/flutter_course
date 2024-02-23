import 'package:teslo_shop/features/products/domain/domain.dart';

class ProductsDatasourceImpl extends ProductsDatasource{
  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}){
    throw UnimplementedError();
  }
  @override
  Future<Product> getProductsById(String id){
    throw UnimplementedError();
  }
  @override
  Future<List<Product>> searhProductByTerm(String term){
    throw UnimplementedError();
  }

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike){
    throw UnimplementedError();
  }
}
