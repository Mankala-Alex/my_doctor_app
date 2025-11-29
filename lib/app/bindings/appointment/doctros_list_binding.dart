import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/appointment/doctors_list_controller.dart';



class DoctrosListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
    DoctorsListController>(() => DoctorsListController());
  }
}