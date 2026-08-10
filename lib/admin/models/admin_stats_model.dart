class AdminStatsModel {
    AdminStatsModel({
        required this.totalOrders,
        required this.totalProducts,
        required this.totalReviews,
        required this.totalUsers,
        required this.totalMerchants,
        required this.totalEarnings,
        required this.monthlyEarnings,
    });

    final int? totalOrders;
    final int? totalProducts;
    final int? totalReviews;
    final int? totalUsers;
    final int? totalMerchants;
    final int? totalEarnings;
    final List<dynamic> monthlyEarnings;

    factory AdminStatsModel.fromJson(Map<String, dynamic> json){ 
        return AdminStatsModel(
            totalOrders: json["totalOrders"],
            totalProducts: json["totalProducts"],
            totalReviews: json["totalReviews"],
            totalUsers: json["totalUsers"],
            totalMerchants: json["totalMerchants"],
            totalEarnings: json["totalEarnings"],
            monthlyEarnings: json["monthlyEarnings"] == null ? [] : List<dynamic>.from(json["monthlyEarnings"]!.map((x) => x)),
        );
    }

}
