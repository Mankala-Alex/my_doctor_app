import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/appointment/doctor_slot_controller.dart';

class DoctorSlotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorSlotController>(() => DoctorSlotController());
  }
}
