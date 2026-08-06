import 'package:get/get.dart';
import 'package:vastralaya/models/product/product_model.dart';
import 'package:vastralaya/services/product/product_service.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var products = ProductModel(
    products: [],
    totalPages: null,
    totalProducts: null,
  ).obs;

  Future fetchAllProducts() async {
    try {
      isLoading.value = true;
      var response = await ProductService.getAllProducts();
      if (response != null) {
        products.value = ProductModel.fromJson(response.data);
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllProducts();
  }

}
