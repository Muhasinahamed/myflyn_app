import 'package:get/get.dart';
import '../modules/home/home_controller.dart';
import '../modules/campaign/campaign_controller.dart';
import '../modules/profile/profile_controller.dart';
import '../data/services/permissions_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.put<PermissionsService>(PermissionsService(), permanent: true);

    // Controllers
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<CampaignController>(() => CampaignController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}
