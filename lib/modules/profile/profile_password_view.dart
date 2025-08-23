import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/required_field.dart';

class ProfilePasswordView extends GetView<ProfileController> {
  const ProfilePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWithTitle("비밀번호 설정"),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            children: [
              RequiredField(
                title: "기본 비밀번호 *",
                hint: "8-16자리 영문, 숫자, 특수문자 조합",
                obscure: !controller.showOldPw.value,
                onChanged: (val) => controller.oldPw.value = val,
                suffixIcon: controller.oldPw.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          controller.showOldPw.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () => controller.showOldPw.value =
                            !controller.showOldPw.value,
                      )
                    : null,
              ),
              const SizedBox(height: 12),
              RequiredField(
                title: "새 비밀번호 *",
                hint: "8-16자리 영문, 숫자, 특수문자 조합",
                obscure: !controller.showNewPw.value,
                onChanged: (val) => controller.newPw.value = val,
                suffixIcon: controller.newPw.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          controller.showNewPw.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () => controller.showNewPw.value =
                            !controller.showNewPw.value,
                      )
                    : null,
              ),
              const SizedBox(height: 12),
              RequiredField(
                title: "비밀번호 확인 *",
                hint: "비밀번호를 재입력해 주세요.",
                obscure: !controller.showConfirmPw.value,
                onChanged: (val) => controller.confirmPw.value = val,
                suffixIcon: controller.confirmPw.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          controller.showConfirmPw.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () => controller.showConfirmPw.value =
                            !controller.showConfirmPw.value,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => PrimaryButton(
            label: "저장하기",
            onPressed: controller.isPasswordValid
                ? controller.savePassword
                : null,
          ),
        ),
      ),
    );
  }
}
