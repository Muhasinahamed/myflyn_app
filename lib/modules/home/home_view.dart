import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:myflyn/widgets/menu_item_tile.dart';
import '../../core/app_routes.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _askNotificationPermission();
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting + avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("안녕하세요,", style: TextStyle(fontSize: 18)),
                      Text(
                        "홍길동님",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      // Request camera permission
                      var status = await Permission.camera.status;
                      if (!status.isGranted) {
                        status = await Permission.camera.request();
                      }

                      if (status.isGranted) {
                        Get.snackbar("카메라 접근", "카메라 권한이 허용되었습니다.");
                      } else if (status.isDenied) {
                        Get.snackbar("카메라 접근", "카메라 권한이 거부되었습니다.");
                      } else if (status.isPermanentlyDenied) {
                        Get.snackbar("권한 필요", "설정에서 카메라 권한을 허용해주세요.");
                        await openAppSettings();
                      }
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(height: 2),
                          Text(
                            "이미지 등록",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              InkWell(
                onTap: () => Get.toNamed(AppRoutes.campaignMatching),
                borderRadius: BorderRadius.circular(12),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "나의 캠페인",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _stat("0", "신청", 0),
                            _stat("0", "진행중", 1),
                            _stat("0", "완료", 2),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Menu Items
              MenuItemTile(
                icon: Icons.person,
                title: "내 정보",
                onTap: () => Get.toNamed(AppRoutes.info),
              ),
              MenuItemTile(icon: Icons.campaign, title: "공지사항"),
              MenuItemTile(icon: Icons.chat, title: "1:1문의"),
              MenuItemTile(icon: Icons.help, title: "FAQ"),
              MenuItemTile(icon: Icons.policy, title: "약관 및 정책"),
              MenuItemTile(icon: Icons.logout, title: "로그아웃"),
              MenuItemTile(icon: Icons.delete, title: "회원탈퇴"),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _askNotificationPermission() async {
    var status = await Permission.notification.status;

    if (!status.isGranted) {
      status = await Permission.notification.request();
    }
  }

  static Widget _stat(String count, String label, int tabIndex) {
    return InkWell(
      onTap: () => Get.toNamed(
        AppRoutes.campaignMatching,
        arguments: {"initialTab": tabIndex},
      ),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
