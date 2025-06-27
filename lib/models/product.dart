import 'dart:convert';

class Product {
  final String id;
  final String name;
  final int quantityInStock;
  final double price;
  final String supplier;

  Product({
    required this.id,
    required this.name,
    required this.quantityInStock,
    required this.price,
    required this.supplier,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      quantityInStock: json['quantityInStock'] as int,
      price: (json['price'] as num).toDouble(),
      supplier: json['supplier'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'price': price,
    'quantityInStock': quantityInStock,
    'supplier': supplier,
  };
}

List<Product> productsResponseFromJsonString(
  String jsonString,
) => List<Product>.from(
  jsonDecode(jsonString).map((json) => Product.fromJson(json)),
);