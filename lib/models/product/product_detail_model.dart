class ProductDetailModel {
    ProductDetailModel({
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
        required this.reviews,
    });

    final String? id;
    final String? name;
    final int? price;
    final String? description;
    final int? rating;
    final String? category;
    final List<String> imageUrl;
    final int? stock;
    final String? createdBy;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final List<dynamic> reviews;

    factory ProductDetailModel.fromJson(Map<String, dynamic> json){ 
        return ProductDetailModel(
            id: json["_id"],
            name: json["name"],
            price: json["price"],
            description: json["description"],
            rating: json["rating"],
            category: json["category"],
            imageUrl: json["imageUrl"] == null ? [] : List<String>.from(json["imageUrl"]!.map((x) => x)),
            stock: json["stock"],
            createdBy: json["createdBy"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
            reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        );
    }
}
