class ProductModel {
    ProductModel({
        required this.products,
        required this.totalPages,
        required this.totalProducts,
    });

    final List<Product> products;
    final int? totalPages;
    final int? totalProducts;

    factory ProductModel.fromJson(Map<String, dynamic> json){ 
        return ProductModel(
            products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
            totalPages: json["totalPages"],
            totalProducts: json["totalProducts"],
        );
    }

}

class Product {
    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.rating,
        required this.category,
        required this.imageUrl,
        required this.stock,
        required this.createdBy,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String? id;
    final String? name;
    final int? price;
    final String? description;
    final int? rating;
    final String? category;
    final List<String> imageUrl;
    final int? stock;
    final CreatedBy? createdBy;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory Product.fromJson(Map<String, dynamic> json){ 
        return Product(
            id: json["_id"],
            name: json["name"],
            price: json["price"],
            description: json["description"],
            rating: json["rating"],
            category: json["category"],
            imageUrl: json["imageUrl"] == null ? [] : List<String>.from(json["imageUrl"]!.map((x) => x)),
            stock: json["stock"],
            createdBy: json["createdBy"] == null ? null : CreatedBy.fromJson(json["createdBy"]),
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
        );
    }

}

class CreatedBy {
    CreatedBy({
        required this.id,
        required this.name,
        required this.email,
    });

    final String? id;
    final String? name;
    final String? email;

    factory CreatedBy.fromJson(Map<String, dynamic> json){ 
        return CreatedBy(
            id: json["_id"],
            name: json["name"],
            email: json["email"],
        );
    }

}
