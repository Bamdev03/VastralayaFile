import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vastralaya/admin/controllers/admin_controller.dart';
import 'package:vastralaya/routes/app_routes.dart';

class SingleUserView extends StatelessWidget {
  const SingleUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final adminController = Get.find<AdminController>();
    final user = adminController.oneUser.value.user!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'User Details',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Profile Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        (user.name?.isNotEmpty ?? false)
                            ? user.name![0].toUpperCase()
                            : '?',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Gap(14),
                    Text(
                      user.name ?? 'Unknown User',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(5),
                    Text(
                      user.email ?? '-',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Gap(14),

                    // Status
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: user.isActive == true
                            ? Colors.green.withOpacity(0.12)
                            : Colors.red.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 9,
                            color: user.isActive == true
                                ? Colors.green
                                : Colors.red,
                          ),
                          const Gap(7),
                          Text(
                            user.isActive == true ? 'Active' : 'Inactive',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: user.isActive == true
                                  ? Colors.green.shade700
                                  : Colors.red.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(20),

              // Account Information
              _sectionTitle('Account Information'),

              const Gap(10),

              _infoCard(
                context,
                icon: Icons.person_outline,
                title: 'Username',
                value: user.name ?? '-',
              ),

              _infoCard(
                context,
                icon: Icons.email_outlined,
                title: 'Email',
                value: user.email ?? '-',
              ),

              _infoCard(
                context,
                icon: Icons.phone_outlined,
                title: 'Phone',
                value: user.phone ?? '-',
              ),

              _infoCard(
                context,
                icon: Icons.location_on_outlined,
                title: 'Address',
                value: user.address?.city ?? '-',
              ),

              _infoCard(
                context,
                icon: Icons.admin_panel_settings_outlined,
                title: 'Role',
                value: user.role ?? '-',
              ),

              const Gap(10),

              // Status Information
              _sectionTitle('Account Status'),

              const Gap(10),

              _infoCard(
                context,
                icon: user.isActive == true
                    ? Icons.check_circle_outline
                    : Icons.cancel_outlined,
                title: 'Account Status',
                value: user.isActive == true ? 'Active' : 'Inactive',
              ),

              const Gap(20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 124, 196, 254),
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {
                        final nameController = TextEditingController(
                          text: user.name ?? '',
                        );

                        final emailController = TextEditingController(
                          text: user.email ?? '',
                        );

                        final phoneController = TextEditingController(
                          text: user.phone ?? '',
                        );

                        final cityController = TextEditingController(
                          text: user.address?.city ?? '',
                        );


                        String selectedRole = user.role ?? 'user';
                        bool isActive = user.isActive ?? true;

                        Get.dialog(
                          StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                title: const Text(
                                  'Edit User',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),

                                content: SizedBox(
                                  width: 400,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Name
                                        TextField(
                                          controller: nameController,
                                          decoration: const InputDecoration(
                                            labelText: 'Name',
                                            prefixIcon: Icon(
                                              Icons.person_outline,
                                            ),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),

                                        const Gap(12),

                                        // Email
                                        TextField(
                                          controller: emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: const InputDecoration(
                                            labelText: 'Email',
                                            prefixIcon: Icon(
                                              Icons.email_outlined,
                                            ),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),

                                        const Gap(12),

                                        // Phone
                                        TextField(
                                          controller: phoneController,
                                          keyboardType: TextInputType.phone,
                                          decoration: const InputDecoration(
                                            labelText: 'Phone',
                                            prefixIcon: Icon(
                                              Icons.phone_outlined,
                                            ),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),

                                        const Gap(12),

                                        // City
                                        TextField(
                                          controller: cityController,
                                          decoration: const InputDecoration(
                                            labelText: 'City',
                                            prefixIcon: Icon(
                                              Icons.location_city_outlined,
                                            ),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),

                                        const Gap(12),

                                        // Role
                                        DropdownButtonFormField<String>(
                                          initialValue: selectedRole,
                                          decoration: const InputDecoration(
                                            labelText: 'Role',
                                            prefixIcon: Icon(
                                              Icons
                                                  .admin_panel_settings_outlined,
                                            ),
                                            border: OutlineInputBorder(),
                                          ),
                                          items: const [
                                            DropdownMenuItem(
                                              value: 'user',
                                              child: Text('User'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Merchant',
                                              child: Text('Merchant'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Admin',
                                              child: Text('Admin'),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            if (value != null) {
                                              setState(() {
                                                selectedRole = value;
                                              });
                                            }
                                          },
                                        ),

                                        const Gap(8),

                                        // Active / Inactive
                                        SwitchListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: const Text('Active Account'),
                                          subtitle: Text(
                                            isActive
                                                ? 'User can access the account'
                                                : 'User account is inactive',
                                          ),
                                          value: isActive,
                                          onChanged: (value) {
                                            setState(() {
                                              isActive = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                actions: [
                                  // Cancel
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('Cancel'),
                                  ),

                                  // Update
                                  ElevatedButton(
                                    onPressed: () async {
                                      // Basic validation
                                      if (nameController.text.trim().isEmpty ||
                                          emailController.text.trim().isEmpty ||
                                          phoneController.text.trim().isEmpty) {
                                        Get.snackbar(
                                          'Invalid Input',
                                          'Name, email and phone are required.',
                                        );
                                        return;
                                      }

                                      // Close dialog
                                      Get.back();

                                      // Show loader
                                      Loader.show(context);

                                      try {
                                        await adminController.updateUser(
                                          id: user.id!,
                                          name: nameController.text.trim(),
                                          email: emailController.text.trim(),
                                          phone: phoneController.text.trim(),
                                          city: cityController.text.trim(),
                                          role: selectedRole,
                                          isActive: isActive,
                                        );

                                        // Refresh users and dashboard statistics
                                        await adminController.fetchAllUsers();
                                        await adminController.fetchAdminStat();

                                        Loader.hide();

                                        Get.offNamed(AppRoutes.adminDashboard);

                                        Get.snackbar(
                                          'Success',
                                          'User updated successfully',
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } catch (e) {
                                        Loader.hide();

                                        Get.snackbar(
                                          'Error',
                                          'Failed to update user',
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                      }
                                    },
                                    child: const Text('Update'),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },

                      child: Text("Edit"),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 255, 137, 137),
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () async {
                        Loader.show(context);
                        await adminController.deleteUser(user.id!);
                        await adminController.fetchAllUsers();
                        await adminController.fetchAdminStat();
                        Loader.hide();
                        Get.offNamed(AppRoutes.adminDashboard);
                      },
                      child: Text("Delete"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _infoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 21,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const Gap(3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
