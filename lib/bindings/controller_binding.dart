import 'package:get/get.dart';
import 'package:vastralaya/controllers/auth/auth_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(),permanent: true);
  }
}
