import 'package:get/get.dart';
import 'package:vastralaya/controllers/auth/auth_controller.dart';
import 'package:vastralaya/controllers/product/product_controller.dart';
import 'package:vastralaya/controllers/storage/storage_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(),permanent: true);
    Get.put<StorageController>(StorageController(),permanent: true);
    Get.put<ProductController>(ProductController(),permanent: true);
  }
}
