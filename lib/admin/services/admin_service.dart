import 'package:vastralaya/utils/api_connect.dart';

class AdminService {
  static Future getAdminStat() async{
    var response = await ApiConnect.dio.get("/stats/admin-stats");
    return response;
  }
}