import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vastralaya/admin/controllers/admin_controller.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late final AdminController adminController;

  @override
  void initState() {
    super.initState();
    adminController = Get.find<AdminController>();
    adminController.fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: Obx(() {
        final users = adminController.allUsers.value.users;

        if (adminController.isLoading.value && users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (users.isEmpty) {
          return const Center(child: Text('No users found'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: users.length,
          separatorBuilder: (_, _) => Gap(12),
          itemBuilder: (context, index) {
            final user = users[index];
            return GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(user.name ?? 'Unknown user'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.email ?? '-'),
                      Text(user.role ?? 'user'),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}