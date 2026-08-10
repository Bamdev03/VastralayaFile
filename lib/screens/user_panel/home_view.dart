import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vastralaya/controllers/product/product_controller.dart';
import 'package:vastralaya/models/product/product_model.dart';
import 'package:vastralaya/routes/app_routes.dart';
import 'package:vastralaya/utils/app_constant.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  final ProductController productController = Get.find<ProductController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.backgroundColor,

        appBar: AppBar(
          backgroundColor: AppConstant.cardColor,
          foregroundColor: AppConstant.textPrimary,
          title: Text(
            "Vastralaya",
            style: GoogleFonts.sora(
              color: AppConstant.textPrimary,
              letterSpacing: -3,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Icon(Icons.shopping_basket_rounded, color: Colors.blue),
            Gap(25),
            Icon(Icons.logout_rounded, color: Colors.red),
            Gap(10),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(10),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // =========================
                // SEARCH BAR
                // =========================
                Obx(() {
                  return SearchBar(
                    controller: searchController,

                    hintText: "Search Clothes",

                    leading: const Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                    ),

                    trailing: [
                      if (productController.searchQuery.value.isNotEmpty)
                        IconButton(
                          onPressed: () {
                            searchController.clear();
                            productController.clearSearch();
                          },
                          icon: const Icon(Icons.close),
                        ),
                    ],

                    elevation: const WidgetStatePropertyAll(1),

                    backgroundColor: WidgetStatePropertyAll(
                      AppConstant.searchBarColor,
                    ),

                    onSubmitted: (value) {
                      final query = value.trim();

                      if (query.isNotEmpty) {
                        productController.searchProducts(query);
                      }
                    },
                  );
                }),
                Gap(15),

                // =========================
                // FEATURED PRODUCTS
                // =========================
                Text(
                  "Featured Products",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppConstant.appPrimaryColor,
                  ),
                ),

                Gap(15),

                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),

                  items:
                      [
                        "images/banner1.webp",
                        "images/banner2.webp",
                        "images/banner3.webp",
                      ].map((image) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16),

                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      }).toList(),
                ),

                Gap(15),

                // =========================
                // PRODUCT TITLE
                // =========================
                Obx(() {
                  if (productController.searchQuery.value.isNotEmpty) {
                    return Text(
                      "Search Results",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }

                  return Text(
                    "Products",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }),

                Gap(15),

                // =========================
                // PRODUCT GRID
                // =========================
                Obx(() {
                  if (productController.isLoading.value ||
                      productController.isSearching.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final List<Product> displayedProducts =
                      productController.searchQuery.value.isNotEmpty
                      ? productController.searchResults.value.products
                      : productController.products.value.products;

                  if (displayedProducts.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Text("No products found"),
                      ),
                    );
                  }

                  return GridView.builder(
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: displayedProducts.length,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.62,
                        ),

                    itemBuilder: (context, index) {
                      final product = displayedProducts[index];

                      return GestureDetector(
                        onTap: () {
                          productController.fetchProductById(product.id!);

                          Get.toNamed(AppRoutes.productDetail);
                        },

                        child: Card(
                          elevation: 3,
                          color: AppConstant.cardColor,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(10),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                SizedBox(
                                  height: 115,
                                  width: double.infinity,

                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),

                                    child: Image.network(
                                      product.imageUrl.isNotEmpty
                                          ? product.imageUrl.first
                                          : "https://via.placeholder.com/300",

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Gap(8),

                                Text(
                                  product.name ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppConstant.textPrimary,
                                  ),
                                ),

                                Gap(4),

                                Text(
                                  "Rs. ${product.price}",

                                  style: GoogleFonts.poppins(
                                    color: AppConstant.priceColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),

                                Gap(4),

                                Text(
                                  product.category ?? "",

                                  style: GoogleFonts.poppins(
                                    color: AppConstant.textSecondary,
                                    fontSize: 13,
                                  ),
                                ),

                                const Spacer(),

                                SizedBox(
                                  width: double.infinity,

                                  child: FilledButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        AppConstant.appPrimaryColor,
                                      ),
                                    ),

                                    onPressed: () {},

                                    child: const Text("Add to Cart"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
