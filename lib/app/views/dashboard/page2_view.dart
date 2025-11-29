import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_new_app/app/theme/app_theme.dart';
import '../../controllers/dashboard/dashboard_controller.dart';

class Page2View extends GetView<DashboardController> {
  const Page2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bgLight,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "My Appointments",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------- UPCOMING --------------------
            const SizedBox(height: 10),
            const Text(
              "Upcoming Appointments",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(height: 12),

            appointmentCard(
              image: "assets/my_doc/doc.png",
              name: "Dr. Evelyn Reed",
              speciality: "Cardiology Specialist",
              date: "Oct 26, 2024",
              time: "10:30 AM",
              showRating: false,
              isPast: false,
            ),

            // -------------------- PAST APPOINTMENTS --------------------
            const SizedBox(height: 25),
            const Text(
              "Past Appointments",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(height: 12),

            appointmentCard(
              image: "assets/images/doctor.png",
              name: "Dr. Marcus Chen",
              speciality: "Dermatologist",
              date: "Aug 15, 2024",
              time: "02:00 PM",
              showRating: true,
              isPast: true,
            ),

            appointmentCard(
              image: "assets/images/doctor.png",
              name: "Dr. Evelyn Reed",
              speciality: "Cardiology Specialist",
              date: "Jun 01, 2024",
              time: "11:00 AM",
              showRating: true,
              isPast: true,
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  // -----------------------------------------------------------------
  // -------------------- Appointment CARD WIDGET ---------------------
  // -----------------------------------------------------------------

  Widget appointmentCard({
    required String image,
    required String name,
    required String speciality,
    required String date,
    required String time,
    required bool showRating,
    required bool isPast,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------------------- TOP INFO ROW --------------------
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      speciality,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(date,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 13)),
                        const SizedBox(width: 14),
                        const Icon(Icons.access_time,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(time,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),

          const SizedBox(height: 12),
          const Divider(),

          // -------------------- RATINGS (PAST ONLY) --------------------
          if (showRating)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index == 4 ? Icons.star_border : Icons.star,
                    size: 26,
                    color: index == 4 ? Colors.grey : Colors.amber,
                  ),
                ),
              ),
            ),

          const Divider(),

          const SizedBox(height: 10),

          // -------------------- BUTTONS --------------------
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8ECF2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      isPast ? "View Report" : "Reschedule",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue, // 🔵 BLUE BUTTON
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      isPast ? "Re-book" : "View Details",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
