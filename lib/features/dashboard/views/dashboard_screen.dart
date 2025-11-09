import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:momentswrapadmin/features/auth/controllers/auth_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Welcome to Dashboard'),
            Text('User Email: ${controller.shopShopkeeperModel?.shopkeeper.email ?? 'N/A'}'),
            Text('Shop Name: ${controller.shopShopkeeperModel?.shopkeeper.firstName ?? 'N/A'}'),
            Text('Shop Address: ${controller.shopShopkeeperModel?.shopkeeper.createdAt ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}