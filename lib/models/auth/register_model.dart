class RegisterModel {
    RegisterModel({
        required this.success,
        required this.message,
        required this.user,
        required this.token,
    });

    final bool? success;
    final String? message;
    final User? user;
    final String? token;

    factory RegisterModel.fromJson(Map<String, dynamic> json){ 
        return RegisterModel(
            success: json["success"],
            message: json["message"],
            user: json["user"] == null ? null : User.fromJson(json["user"]),
            token: json["token"],
        );
    }

}

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.address,
        required this.role,
        required this.isActive,
        required this.createdAt,
    });

    final String? id;
    final String? name;
    final String? email;
    final String? phone;
    final Address? address;
    final String? role;
    final bool? isActive;
    final DateTime? createdAt;

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            id: json["_id"],
            name: json["name"],
            email: json["email"],
            phone: json["phone"],
            address: json["address"] == null ? null : Address.fromJson(json["address"]),
            role: json["role"],
            isActive: json["isActive"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
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
