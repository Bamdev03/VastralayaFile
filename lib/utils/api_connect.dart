import 'package:dio/dio.dart';

class ApiConnect{

     static Dio dio = Dio(
      BaseOptions(baseUrl: "http://localhost:5005/api"),
    );
}  
