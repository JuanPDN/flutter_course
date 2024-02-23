import 'package:dio/dio.dart';
import 'package:teslo_shop/config/constants/environment.dart';

import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/products/infrastruture/mappers/product_mapper.dart';

class ProductsDatasourceImpl extends ProductsDatasource {
  late final Dio? dio;
  final String accesToken;
  ProductsDatasourceImpl({required this.accesToken})
      : dio = Dio(BaseOptions(
            baseUrl: Enviroment.apiUrl,
            headers: {'Authorization': 'Bearer $accesToken'}));

  @override
  Future<List<Product>> getProductsByPage(
      {int limit = 10, int offset = 0}) async {
    final response = await dio!.get<List>('/products',
        queryParameters: {'limit': limit, 'offset': offset});
    final List<Product> products = [];
    for (final product in response.data ?? []) {
      products.add(ProductMapper.jsonToEntity(product));
    }
    return products;
  }

  @override
  Future<Product> getProductsById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> searhProductByTerm(String term) {
    throw UnimplementedError();
  }

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) {
    throw UnimplementedError();
  }
}
