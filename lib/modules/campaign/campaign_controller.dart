import 'package:get/get.dart';

class CampaignController extends GetxController
    with GetTickerProviderStateMixin {
  var applied = 0.obs;
  var inProgress = 0.obs;
  var completed = 0.obs;

  void apply() => applied++;
  void start() {
    if (applied > 0) {
      applied--;
      inProgress++;
    }
  }

  void finish() {
    if (inProgress > 0) {
      inProgress--;
      completed++;
    }
  }
}
