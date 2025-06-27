import 'package:dio/dio.dart';
import 'package:fe_petmaster/data/utils/constants.dart';
import 'package:fe_petmaster/models/product.dart';

abstract class ProductServiceImpl {
  Future<List<Product>> getProducts();
  Future<void> postProduct(Product product);
  Future<Product> getProductById(String id);
}

class ProductService implements ProductServiceImpl {
  ProductService() {
    _configService();
  }

  late final Dio _client;

  void _configService() {
    _client = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        baseUrl: Constants.apiBaseUrl,
        connectTimeout: const Duration(milliseconds: Constants.defaultTimeout),
        receiveTimeout: const Duration(milliseconds: Constants.defaultTimeout),
      ),
    );

    _client.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  @override
  Future<List<Product>> getProducts() async {
    final response = await _client.get("/produtos");

    final List<dynamic> data = response.data;

    return data.map((item) => Product.fromJson(item)).toList();
  }

  @override
  Future<Product> getProductById(String id) async {
    final response = await _client.get(
      "/produtos",
      queryParameters: {"id": id},
    );

    return response.data;
  }

  @override
  Future<dynamic> postProduct(Product product) async {
    final response = await _client.post("/produtos", data: product.toJson());

    return response.data;
  }
}
