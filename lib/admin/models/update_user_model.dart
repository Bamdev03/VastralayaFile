class UpdateUserModel {
    UpdateUserModel({
        required this.success,
        required this.user,
    });

    final bool? success;
    final User? user;

    factory UpdateUserModel.fromJson(Map<String, dynamic> json){ 
        return UpdateUserModel(
            success: json["success"],
            user: json["user"] == null ? null : User.fromJson(json["user"]),
        );
    }

}

class User {
    User({
        required this.address,
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.phone,
        required this.isActive,
        required this.role,
        required this.userType,
        required this.createdAt,
        required this.v,
    });

    final Address? address;
    final String? id;
    final String? name;
    final String? email;
    final String? password;
    final String? phone;
    final bool? isActive;
    final String? role;
    final String? userType;
    final DateTime? createdAt;
    final int? v;

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            address: json["address"] == null ? null : Address.fromJson(json["address"]),
            id: json["_id"],
            name: json["name"],
            email: json["email"],
            password: json["password"],
            phone: json["phone"],
            isActive: json["isActive"],
            role: json["role"],
            userType: json["userType"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            v: json["__v"],
        );
    }

}

class Address {
    Address({
        required this.city,
        required this.province,
    });

    final String? city;
    final String? province;

    factory Address.fromJson(Map<String, dynamic> json){ 
        return Address(
            city: json["city"],
            province: json["province"],
        );
    }

}
