import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService extends GetxService {
  Future<bool> requestStorage() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  Future<bool> requestCamera() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  Future<bool> requestNotification() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  Future<bool> isGranted(Permission permission) async {
    return await permission.status == PermissionStatus.granted;
  }
}
