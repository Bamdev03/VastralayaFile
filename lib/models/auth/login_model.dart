class LoginModel {
    LoginModel({
        required this.success,
        required this.message,
        required this.user,
        required this.token,
    });

    final bool? success;
    final String? message;
    final User? user;
    final String? token;

    factory LoginModel.fromJson(Map<String, dynamic> json){ 
        return LoginModel(
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
        required this.address,
        required this.phone,
        required this.email,
        required this.name,
        required this.role,
        required this.isActive,
    });

    final String? id;
    final Address? address;
    final String? phone;
    final String? email;
    final String? name;
    final String? role;
    final bool? isActive;

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            id: json["_id"],
            address: json["address"] == null ? null : Address.fromJson(json["address"]),
            phone: json["phone"],
            email: json["email"],
            name: json["name"],
            role: json["role"],
            isActive: json["isActive"],
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
