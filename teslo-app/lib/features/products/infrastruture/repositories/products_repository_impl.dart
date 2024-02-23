import 'package:teslo_shop/features/products/domain/domain.dart';


class ProductsRepositoryImpl extends ProductsRepository{

  final ProductsDatasource datasource;
  ProductsRepositoryImpl(this.datasource);
  

  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}){
    return datasource.getProductsByPage(limit: limit, offset: offset);
  }
  @override
  Future<Product> getProductsById(String id){
    return datasource.getProductsById(id);
  }
  @override
  Future<List<Product>> searhProductByTerm(String term){
    return datasource.searhProductByTerm(term);
  }

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike){
    return datasource.createUpdateProduct(productLike);
  }
}