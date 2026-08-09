import 'package:vastralaya/models/product/product_model.dart';

class SearchModel {
  SearchModel({
    required this.products,
    required this.totalPages,
    required this.totalProducts,
  });

  final List<Product> products;
  final int? totalPages;
  final int? totalProducts;

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"].map(
                (x) => Product.fromJson(x),
              ),
            ),
      totalPages: json["totalPages"],
      totalProducts: json["totalProducts"],
    );
  }
}