import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myflyn/data/services/permissions_service.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/primary_button.dart';
import 'profile_controller.dart';

class ProfileBasicView extends GetView<ProfileController> {
  const ProfileBasicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWithTitle("기본정보"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _field(
                title: "아이디",
                value: controller.userId.value,
                enabled: false,
              ),
              const SizedBox(height: 12),
              _field(title: "이메일", value: controller.email.value),
              const SizedBox(height: 12),

              Text(
                "휴대폰 번호",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(
                        text: controller.phone.value,
                      ),
                      onChanged: (val) => controller.phone.value = val,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.snackbar("변경하기", "번호 변경 기능 호출됨");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("변경하기"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              _field(title: "닉네임", value: controller.nickname.value),
              const SizedBox(height: 12),
              _field(title: "인스타그램 아이디", value: controller.instagram.value),
              const SizedBox(height: 12),
              _field(title: "대표 작업 링크", value: controller.workLink.value),
              const SizedBox(height: 12),

              Text(
                "포트폴리오",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: TextEditingController(
                  text: controller.portfolio.value,
                ),
                onChanged: (val) => controller.portfolio.value = val,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: () async {
                      final permissions = PermissionsService();

                      final granted = await permissions.requestStorage();

                      if (granted) {
                        Get.snackbar("권한 허용", "스토리지 접근 권한이 허용되었습니다.");
                      } else {
                        Get.snackbar("권한 거부", "스토리지 접근 권한이 필요합니다.");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          label: "저장하기",
          onPressed: () {
            controller.saveProfile();
          },
        ),
      ),
    );
  }

  Widget _field({
    required String title,
    required String value,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: TextEditingController(text: value),
          enabled: enabled,
          onChanged: (val) {},
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
