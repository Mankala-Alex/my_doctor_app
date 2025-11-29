import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/appointment/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
