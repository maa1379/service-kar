import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(3.seconds).then((value) {
      Get.offAllNamed("/home");
    });
    super.onInit();
  }
}
