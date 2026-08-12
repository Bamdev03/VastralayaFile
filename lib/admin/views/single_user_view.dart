import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vastralaya/admin/controllers/admin_controller.dart';

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
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
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
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundColor:
                          Theme.of(context).colorScheme.primary,
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
                            user.isActive == true
                                ? 'Active'
                                : 'Inactive',
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
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
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
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(0.08),
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
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
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