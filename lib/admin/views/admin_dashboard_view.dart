import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:vastralaya/admin/controllers/admin_controller.dart';
import 'package:vastralaya/controllers/storage/storage_controller.dart';
import 'package:vastralaya/routes/app_routes.dart';

class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({super.key});

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
  late final AdminController adminController;
  late final StorageController storageController;

  @override
  void initState() {
    super.initState();
    adminController = Get.find<AdminController>();
    storageController = Get.find<StorageController>();
    adminController.fetchAdminStat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      drawer: _buildDrawer(),
      body: Obx(() {
        if (adminController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final stats = adminController.adminStats.value;
        return RefreshIndicator(
          onRefresh: adminController.fetchAdminStat,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Overview',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                const Gap(5),
                const Text(
                  'Manage and monitor Vastralaya',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Gap(25),
                _buildStatsGrid(stats),
                const Gap(30),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildStatsGrid(dynamic stats) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1,
      children: [
        _statCard(
          title: 'Users',
          value: stats.totalUsers.toString(),
          icon: Icons.people_outline,
        ),
        _statCard(
          title: 'Merchants',
          value: stats.totalMerchants.toString(),
          icon: Icons.store_outlined,
        ),
        _statCard(
          title: 'Products',
          value: stats.totalProducts.toString(),
          icon: Icons.inventory_2_outlined,
        ),
        _statCard(
          title: 'Orders',
          value: stats.totalOrders.toString(),
          icon: Icons.shopping_bag_outlined,
        ),
        _statCard(
          title: 'Reviews',
          value: stats.totalReviews.toString(),
          icon: Icons.star_outline,
        ),
        _statCard(
          title: 'Earnings',
          value: 'Rs. ${stats.totalEarnings}',
          icon: Icons.currency_rupee,
        ),
      ],
    );
  }

  Widget _statCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28),
            const Gap(8),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const Gap(3),
            Text(
              value,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vastralaya',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Gap(3),
                  Text(
                    'Administrator',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.dashboard_outlined),
              title: const Text('Dashboard'),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_outline),
              title: const Text('Users'),
              onTap: () async {
                Get.back();
                await adminController.fetchAllUsers();
                Get.toNamed(AppRoutes.users);
              },
            ),
            ListTile(
              leading: const Icon(Icons.store_outlined),
              title: const Text('Merchants'),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: const Text('Products'),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('Orders'),
              onTap: () {
                Get.back();
              },
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              textColor: Colors.red,
              iconColor: Colors.red,
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                storageController.removeToken();
                storageController.removeRole();
                Get.offAllNamed(AppRoutes.home);
              },
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
