import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/appointment/doctor_slot_controller.dart';

class DoctorReviewsView extends GetView<DoctorSlotController> {
  const DoctorReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    // STATIC SAMPLE REVIEWS
    final List<Map<String, String>> reviews = [
      {
        "name": "Mohammed Ali",
        "date": "2024-12-01",
        "rating": "4.5",
        "review":
            "The doctor was very patient and explained everything clearly.",
        "image": "assets/my_doc/doc.png"
      },
      {
        "name": "Sarah Khan",
        "date": "2024-11-25",
        "rating": "5.0",
        "review": "Excellent consultation, very professional!",
        "image": "assets/my_doc/doc.png"
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final data = reviews[index];

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFDDE0E6), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------------- ROW: Image + Name + Date + Rating ----------
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // PROFILE IMAGE
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          data["image"]!,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // NAME + DATE + RATING
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["name"]!,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF333333)),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            data["date"]!,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFADB4CB),
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 3),

                          // ⭐ RATING
                          Row(
                            children: [
                              Text(
                                data["rating"]!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.star,
                                  color: Colors.blue, size: 15),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // --------------- REVIEW TEXT ----------------
                  Text(
                    data["review"]!,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF555555),
                        height: 1.4,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
