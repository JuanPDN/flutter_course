import 'package:dio/dio.dart';
import 'package:teslo_shop/config/constants/environment.dart';

import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/products/infrastruture/errors/product_errors.dart';
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
  Future<Product> getProductsById(String id) async {
    try {
      final response = await dio!.get('/products/$id');
      final product = ProductMapper.jsonToEntity(response.data);
      return product;
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) throw ProductNotFound();
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Product>> searhProductByTerm(String term) {
    throw UnimplementedError();
  }

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) async {
    try {
      final String? productId = productLike['id'];
      final String method = (productId == null) ? 'POST' : 'PATCH';
      final String url =
          (productId == null) ? '/products' : '/products/$productId';
      productLike.remove('id');
      final response = await dio!
          .request(url, data: productLike, options: Options(method: method));
      final product = ProductMapper.jsonToEntity(response.data);

      return product;
    } catch (e) {
      throw Exception();
    }
  }
}
