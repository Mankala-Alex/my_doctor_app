import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/appointment/confirmation_page_controller.dart';
import 'package:my_new_app/app/routes/app_routes.dart';

class ConfirmationPageView extends GetView<ConfirmationPageController> {
  const ConfirmationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Appointment Confirmed",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // -------------------- GREEN TICK --------------------
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(28),
              decoration: const BoxDecoration(
                color: Color(0xFF00E676), // Green
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // -------------------- SUCCESS TEXT --------------------
            const Text(
              "Booking Successful!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Your appointment has been successfully booked.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 20),

            // -------------------- SUMMARY CARD --------------------
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Dr. Evelyn Reed",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Cardiology Specialist",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage("assets/images/doctor.png"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Date & Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _InfoColumn(
                        icon: Icons.calendar_month,
                        title: "Date",
                        value: "Tuesday, Oct 26, 2024",
                      ),
                      _InfoColumn(
                        icon: Icons.access_time,
                        title: "Time",
                        value: "10:30 AM",
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // Location
                  const _InfoColumn(
                    icon: Icons.location_on,
                    title: "Location",
                    value: "Wellness Medical Center,\n123 Health St.",
                  ),

                  const SizedBox(height: 20),

                  // Appointment ID
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Appointment ID",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        Text(
                          "#A1B2-C3D4",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // -------------------- FOOTER TEXT --------------------
            const Text(
              "Please arrive 15 minutes early for your appointment.\n"
              "Bring a valid ID and your insurance card.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 40),

            // -------------------- VIEW MY APPOINTMENTS BUTTON --------------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed(Routes.dashboard);
                },
                icon: const Icon(Icons.calendar_month, color: Colors.white),
                label: const Text(
                  "View My Appointments",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ------------------------- REUSABLE COLUMN -------------------------
class _InfoColumn extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoColumn(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.green, size: 18),
            const SizedBox(width: 6),
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(color: Colors.black87),
        ),
      ],
    );
  }
}
