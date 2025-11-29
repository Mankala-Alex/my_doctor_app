import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:my_new_app/app/controllers/appointment/doctor_slot_controller.dart';
import 'package:my_new_app/app/views/appointment/select_patient_bottomsheet_view.dart';
import '../../theme/app_theme.dart';
import 'about_doctor_view.dart';
import 'doctor_reviews_view.dart';

class DoctorSlotsView extends GetView<DoctorSlotController> {
  const DoctorSlotsView({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = CustomTheme.of(context);
    final args = Get.arguments ?? {};

    final doctorName = args["doctorName"] ?? "Dr. Jane Doe";
    final designation = args["designation"] ?? "Cardiologist";
    final experience = args["experience"] ?? "10 yrs experience";
    final starRating = args["starRating"] ?? "4.9";
    final consultationFee = args["consultationFee"] ?? "200";

    return Scaffold(
      backgroundColor: customTheme.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back()),
        title: const Text(
          "Book Hospital Visit",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 3, // ⭐ 3 TABS
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ---------------------- DOCTOR HEADER ----------------------
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                "assets/my_doc/doc.png",
                                width: 90,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(doctorName,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 6),
                                  Text("$experience  ⦁  $designation",
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.grey)),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          size: 16, color: Colors.blue),
                                      const SizedBox(width: 6),
                                      Text(
                                        starRating,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Text("Consultation Fee: ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                      const Icon(Icons.currency_rupee,
                                          size: 16, color: Colors.blue),
                                      Text(
                                        consultationFee,
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      Text(
                        "Select Date",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      // ---------------------- DATE PICKER ----------------------
                      DatePicker(
                        DateTime.now(),
                        height: 90,
                        width: 65,
                        daysCount: 30,
                        initialSelectedDate: DateTime.now(),
                        selectionColor: Colors.blue,
                        selectedTextColor: Colors.white,
                        dateTextStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        dayTextStyle: const TextStyle(
                            fontSize: 12, color: Colors.black54),
                        monthTextStyle: const TextStyle(
                            fontSize: 12, color: Colors.black54),
                        onDateChange: (date) {
                          controller.selectedDate.value = date.toString();
                        },
                      ),

                      const SizedBox(height: 20),

                      // ---------------------- TAB BAR ----------------------
                      const TabBar(
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.blue,
                        tabs: [
                          Tab(text: "Schedule"),
                          Tab(text: "About Doctor"),
                          Tab(text: "Reviews"),
                        ],
                      ),

                      SizedBox(
                        height: 900, // Required for scroll
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            // ⭐ TAB-1
                            _ScheduleTab(controller),

                            // ⭐ TAB-2
                            const AboutDoctorView(),

                            // ⭐ TAB-3
                            const DoctorReviewsView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // ---------------------- BOTTOM BUTTON ----------------------
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Obx(() {
          return ElevatedButton(
            onPressed: controller.selectedSlotId.value.isEmpty
                ? null
                : () {
                    Get.bottomSheet(
                      const SelectPatientBottomSheet(),
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                    );
                  },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.blue,
              disabledBackgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Book Appointment",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          );
        }),
      ),
    );
  }
}

// ---------------------- SCHEDULE TAB (Separate Widget) ----------------------
class _ScheduleTab extends StatelessWidget {
  final DoctorSlotController controller;
  const _ScheduleTab(this.controller);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _slotSection(context, controller,
              title: "Morning",
              timeRange: "10:00 AM - 12:00 PM",
              slotList: controller.morningSlots),
          _slotSection(context, controller,
              title: "Afternoon",
              timeRange: "12:00 PM - 5:00 PM",
              slotList: controller.afternoonSlots),
          _slotSection(context, controller,
              title: "Evening",
              timeRange: "5:00 PM - 9:00 PM",
              slotList: controller.eveningSlots),
          _slotSection(context, controller,
              title: "Night",
              timeRange: "9:00 PM - 10:00 AM",
              slotList: controller.nightSlots),
        ],
      ),
    );
  }
}

// ---------------------- SLOT SECTION REUSABLE WIDGET ----------------------
Widget _slotSection(
  BuildContext context,
  DoctorSlotController controller, {
  required String title,
  required String timeRange,
  required RxList<Map<String, String>> slotList,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text(timeRange, style: const TextStyle(color: Colors.grey)),
      const SizedBox(height: 10),
      Obx(() {
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: slotList.map((slot) {
            final isSelected = controller.selectedSlotId.value == slot["id"];

            return GestureDetector(
              onTap: () {
                controller.selectedSlotId.value = slot["id"]!;
                controller.selectedTime.value = slot["time"]!;
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade400,
                  ),
                ),
                child: Text(
                  slot["time"]!,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }),
      const SizedBox(height: 25),
    ],
  );
}
