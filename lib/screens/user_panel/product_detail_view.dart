import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vastralaya/controllers/product/product_controller.dart';
import 'package:vastralaya/utils/app_constant.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return Scaffold(
      backgroundColor: AppConstant.backgroundColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.cardColor,
        foregroundColor: AppConstant.textPrimary,
        centerTitle: true,
        title: Text(
          "Product Details",
          style: GoogleFonts.sora(
            color: AppConstant.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: AppConstant.textPrimary,
            ),
          ),
        ],
      ),

      body: Obx(() {
        final product = productController.productDetail.value;

        if (product.id == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Product Images
              CarouselSlider(
                options: CarouselOptions(
                  height: 360,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false
                ),
                items: product.imageUrl.map((image) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),

              const Gap(24),

              /// Product Name
              Text(
                product.name ?? "",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppConstant.textPrimary,
                ),
              ),

              const Gap(8),

              /// Price
              Text(
                "Rs. ${product.price}",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppConstant.priceColor,
                ),
              ),

              const Gap(12),

              /// Category Chip
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppConstant.backgroundColor,
                  border: Border.all(
                    color: AppConstant.appSecondaryColor.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  product.category ?? "",
                  style: GoogleFonts.poppins(
                    color: AppConstant.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const Gap(24),

              /// Description
              Text(
                "Description",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppConstant.textPrimary,
                ),
              ),

              const Gap(10),

              Text(
                product.description ?? "",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: AppConstant.textSecondary,
                  height: 1.7,
                ),
              ),

              const Gap(25),

              /// Stock
              Row(
                children: [
                  const Icon(
                    Icons.inventory_2_outlined,
                    color: AppConstant.appPrimaryColor,
                  ),
                  const Gap(8),
                  Text(
                    "Stock: ${product.stock}",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppConstant.textPrimary,
                    ),
                  ),
                ],
              ),

              const Gap(35),

              /// Add To Cart Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppConstant.appPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Add to Cart",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const Gap(30),
            ],
          ),
        );
      }),
    );
  }
}