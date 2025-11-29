import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/appointment/confirmation_page_controller.dart';

class ConfirmationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmationPageController>(() => ConfirmationPageController());
  }
}
