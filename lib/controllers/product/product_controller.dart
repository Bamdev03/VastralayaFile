import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vastralaya/models/product/product_detail_model.dart';
import 'package:vastralaya/models/product/product_model.dart';
import 'package:vastralaya/services/product/product_service.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var products = ProductModel(
    products: [],
    totalPages: null,
    totalProducts: null,
  ).obs;
  var productDetail = ProductDetailModel(id: null, name: null, price: null, description: null, rating: null, category: null, imageUrl: [], stock: null, createdBy: null, createdAt: null, updatedAt: null, v: null, reviews: []).obs;

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

  Future fetchProductById(String id) async {
    try {
      isLoading.value = true;
      var response = await ProductService.getProductById(id);
      if (response != null) {
        productDetail.value = ProductDetailModel.fromJson(response.data);
      }
    } finally {
      isLoading.value = false;
    }
  }


  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

}
