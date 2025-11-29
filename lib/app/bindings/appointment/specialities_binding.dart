import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/appointment/specialities_controller.dart';



class SpecialitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
    SpecialitiesController>(() => SpecialitiesController());
  }
}
