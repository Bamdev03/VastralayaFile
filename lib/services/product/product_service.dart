import 'package:dio/dio.dart';
import 'package:vastralaya/utils/api_connect.dart';

class ProductService {
  
  //get all products
  static Future getAllProducts() async {
  try {
    final response = await ApiConnect.dio.get("/products");
    print(response.statusCode);
    print(response.data);
    return response;
  } on DioException catch (e) {
    print(e.response?.statusCode);
    print(e.response?.data);
    rethrow;
  }
}
 

 }

