import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vastralaya/controllers/product/product_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProductController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF3E4C9),
        appBar: AppBar(
          backgroundColor: Color(0xFF0A2947),
          title: Text(
            "Vastralaya",
            style: GoogleFonts.sora(
              color: Colors.white,
              letterSpacing: -1,
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
                SearchBar(
                  hintText: "Search Cloths",
                  trailing: [Icon(Icons.search_rounded, color: Colors.black)],
                  elevation: WidgetStatePropertyAll(1),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFD3D4C0)),
                ),
                Gap(15),
                Text(
                  "Featured Products",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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
                Text(
                  "Products",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(15),

                // product list

                Obx(() {
                  if (productController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          productController.products.value.products.length,
                      itemBuilder: (context, index) {
                        var product =
                            productController.products.value.products[index];
                        return ListTile(title: Text("${product.name}"));
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
