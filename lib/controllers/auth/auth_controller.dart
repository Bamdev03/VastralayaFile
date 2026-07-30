import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:vastralaya/models/auth/login_model.dart';
import 'package:vastralaya/models/auth/register_model.dart';
import 'package:vastralaya/routes/app_routes.dart';
import 'package:vastralaya/services/auth/auth_service.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var registeredUser = RegisterModel(
    success: false,
    message: null,
    user: null,
    token: null,
  ).obs;
  var loginUser = LoginModel(
    success: false,
    message: null,
    user: null,
    token: null,
  ).obs;

  var isVisible = true.obs;

  Future register(
    String name,
    String email,
    String password,
    String phone,
    String address,
  ) async {
    try {
      isLoading.value = true;
      final response = await AuthService.register(
        name,
        email,
        password,
        phone,
        address,
      );
      registeredUser.value = RegisterModel.fromJson(response.data);

      if (registeredUser.value.success == true) {
        Get.snackbar("Success", "Registered successfully");
        Get.toNamed(AppRoutes.login);
      } else {
        Get.snackbar(
          "Failed",
          "${registeredUser.value.message}",
          backgroundColor: const Color.fromARGB(255, 229, 11, 11),
        );
      }
    } on DioException catch (e) {
      final errorMsg = _extractErrorMessage(e);
      Get.snackbar(
        "Failed",
        errorMsg,
        backgroundColor: const Color.fromARGB(255, 229, 11, 11),
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        backgroundColor: const Color.fromARGB(255, 229, 11, 11),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future login(String email, String password) async {
    try {
      isLoading.value = true;
      final response = await AuthService.login(email, password);
      loginUser.value = LoginModel.fromJson(response.data);

      if (loginUser.value.success == true) {
        Get.snackbar("Success", "Logged in successfully");
      } else {
        Get.snackbar(
          "Failed",
          "${loginUser.value.message}",
          backgroundColor: const Color.fromARGB(255, 229, 11, 11),
        );
      }
    } on DioException catch (e) {
      final errorMsg = _extractErrorMessage(e);
      Get.snackbar(
        "Failed",
        errorMsg,
        backgroundColor: const Color.fromARGB(255, 229, 11, 11),
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        backgroundColor: const Color.fromARGB(255, 229, 11, 11),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Helper to pull a readable message out of Dio's error response
  String _extractErrorMessage(DioException e) {
    final data = e.response?.data;

    if (data is Map) {
      // Try the standard { message: "..." } shape
      if (data['message'] != null) {
        return data['message'].toString();
      }
      // Try the Zod field-level errors array shape
      if (data['errors'] is List && (data['errors'] as List).isNotEmpty) {
        final first = data['errors'][0];
        if (first is Map && first['message'] != null) {
          return first['message'].toString();
        }
      }
    }

    // Fallback for connection issues, timeouts, no response at all
    switch (e.type) {
      case DioExceptionType.connectionError:
        return "Cannot connect to server. Check your connection.";
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return "Request timed out. Please try again.";
      default:
        return "Something went wrong. Please try again.";
    }
  }

  // toggle the password eye
  void toggleEye() {
    isVisible.value = !isVisible.value;
  }
}
