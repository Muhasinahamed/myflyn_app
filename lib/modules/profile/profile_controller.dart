import 'package:get/get.dart';

class ProfileController extends GetxController {
  var oldPw = "".obs;
  var newPw = "".obs;
  var confirmPw = "".obs;

  // show/hide password toggles
  var showOldPw = false.obs;
  var showNewPw = false.obs;
  var showConfirmPw = false.obs;

  // computed validator
  bool get isPasswordValid {
    final oldOk = oldPw.isNotEmpty;
    final newOk = newPw.value.length >= 8;
    final confirmOk = confirmPw == newPw;
    return oldOk && newOk && confirmOk;
  }

  void savePassword() {
    if (isPasswordValid) {
      Get.snackbar("성공", "비밀번호가 저장되었습니다.");
    } else {
      Get.snackbar("오류", "비밀번호 조건을 확인해주세요.");
    }
  }

  var userId = "asdf123".obs;
  var email = "asdf123@naver.com".obs;
  var phone = "010-1234-5678".obs;
  var nickname = "장발산".obs;
  var instagram = "ffkdo_sa".obs;
  var workLink = "https://www.naver.com/".obs;
  var portfolio = "포트폴리오.pdf".obs;

  void saveProfile() {
    Get.snackbar("저장 완료", "프로필이 저장되었습니다");
  }

  void updatePhone(String v) => phone.value = v;
  void updateEmail(String v) => email.value = v;
}
