import 'package:get/get.dart';

class DoctorSlotController extends GetxController {
  var selectedSlotId = "".obs;
  var selectedTime = "".obs;
  RxString selectedDate = "".obs;

  // -------- STATIC SLOT DATA -------- //

  RxList<Map<String, String>> morningSlots = [
    {"id": "1", "time": "10:00 AM"},
    {"id": "2", "time": "10:30 AM"},
    {"id": "3", "time": "11:00 AM"},
  ].obs;

  RxList<Map<String, String>> afternoonSlots = [
    {"id": "4", "time": "12:00 PM"},
    {"id": "5", "time": "1:00 PM"},
    {"id": "6", "time": "3:00 PM"},
  ].obs;

  RxList<Map<String, String>> eveningSlots = [
    {"id": "7", "time": "5:00 PM"},
    {"id": "8", "time": "6:00 PM"},
    {"id": "9", "time": "7:00 PM"},
  ].obs;

  RxList<Map<String, String>> nightSlots = [
    {"id": "10", "time": "9:00 PM"},
    {"id": "11", "time": "9:30 PM"},
  ].obs;

  // No API – everything static
}
