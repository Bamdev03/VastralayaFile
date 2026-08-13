import 'package:get/get.dart';
import 'package:vastralaya/controllers/storage/storage_controller.dart';
import 'package:vastralaya/utils/api_connect.dart';

class AdminService {
  static Future getAdminStat() async {
    var response = await ApiConnect.dio.get("/stats/admin-stats");
    return response;
  }

  static Future getAllUsers() async {
    var controller = Get.find<StorageController>();
    final token = controller.getToken();

    ApiConnect.dio.options.headers["Authorization"] = "Bearer $token";
    var response = await ApiConnect.dio.get("/users");
    return response;
  }

  static Future getUser(String id) async {
    var controller = Get.find<StorageController>();
    final token = controller.getToken();

    ApiConnect.dio.options.headers["Authorization"] = "Bearer $token";
    var response = await ApiConnect.dio.get("/users/$id");
    return response;
  }

  static Future deleteUser(String id) async {
    var controller = Get.find<StorageController>();
    final token = controller.getToken();

    ApiConnect.dio.options.headers["Authorization"] = "Bearer $token";
    var response = await ApiConnect.dio.delete("/users/$id");
    return response;
  }



}
