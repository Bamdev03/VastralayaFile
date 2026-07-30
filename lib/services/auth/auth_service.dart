import 'package:vastralaya/utils/api_connect.dart';

class AuthService {
  
  //register
  static Future register(String name, String email, String password, String phone, String address) async {
    final response = await ApiConnect.dio.post(
      "/auth/register",
      data: {"name": name, "email": email, "password": password, "phone": phone, "address":{
        "city": address
      }},
    );
    return response;
  }

  //login
  static Future login(String email, String password) async {
    final response = await ApiConnect.dio.post(
      "/auth/login",
      data: {"email": email, "password": password},
    );
    return response;
  }

}

