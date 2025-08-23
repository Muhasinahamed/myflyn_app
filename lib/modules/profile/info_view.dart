import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/app_routes.dart';
import '../../../widgets/custom_app_bar.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWithTitle("내정보"),
      body: ListView(
        children: [
          ListTile(
            title: const Text("기본 정보"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Get.toNamed(AppRoutes.profileBasic),
          ),
          const Divider(height: 1, thickness: 0.8, color: Colors.grey),
          ListTile(
            title: const Text("비밀번호 설정"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Get.toNamed(AppRoutes.profilePassword),
          ),
          const Divider(height: 1, thickness: 0.8, color: Colors.grey),
          ListTile(
            title: const Text("관심 카테고리"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Get.toNamed(AppRoutes.interestCategory),
          ),
          const Divider(height: 1, thickness: 0.8, color: Colors.grey),
        ],
      ),
    );
  }
}
