import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vastralaya/admin/models/admin_stats_model.dart';
import 'package:vastralaya/admin/models/one_user_model.dart';
import 'package:vastralaya/admin/models/users_model.dart';
import 'package:vastralaya/admin/services/admin_service.dart';

class AdminController extends GetxController {
  var isLoading = false.obs;
  var adminStats = AdminStatsModel(
    totalOrders: null,
    totalProducts: null,
    totalReviews: null,
    totalUsers: null,
    totalMerchants: null,
    totalEarnings: null,
    monthlyEarnings: [],
  ).obs;
  var allUsers = UsersModel(users: []).obs;
  var oneUser = OneUserModel(success: false, user: null).obs;

  Future fetchAdminStat() async {
    try {
      isLoading.value = true;
      var response = await AdminService.getAdminStat();
      if (response != null) {
        adminStats.value = AdminStatsModel.fromJson(response.data);
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future fetchAllUsers() async {
    try {
      isLoading.value = true;
      var response = await AdminService.getAllUsers();
      if (response != null) {
        allUsers.value = UsersModel.fromJson(response.data);
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future fetchOneUser(String id) async {
    try {
      isLoading.value = true;
      var response = await AdminService.getUser(id);
      if (response != null) {
        oneUser.value = OneUserModel.fromJson(response.data);
      }
    } finally {
      isLoading.value = false;
    }
  }


}
