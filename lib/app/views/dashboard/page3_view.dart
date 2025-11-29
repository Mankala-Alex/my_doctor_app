import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_new_app/app/theme/app_theme.dart';
import '../../controllers/dashboard/dashboard_controller.dart';

class Page3View extends GetView<DashboardController> {
  const Page3View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "My Reports",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------- All Reports Heading --------------------
            const SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  "All Reports",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "Filter",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.filter_list, color: Colors.blue),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // -------------------- Reports Grid --------------------
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.78,
              children: [
                reportCard(
                  color: const Color(0xFFFFE8E7),
                  icon: Icons.bloodtype_rounded,
                  title: "Annual Blood Work",
                  date: "Oct 15, 2023",
                ),
                reportImageCard(
                  image: "assets/my_doc/chest_xray.png",
                  title: "Chest X-Ray Results",
                  date: "Sep 28, 2023",
                ),
                reportImageCard(
                  image: "assets/my_doc/ecg.png",
                  title: "ECG Report",
                  date: "Aug 05, 2023",
                ),
                reportCard(
                  color: const Color(0xFFFFF2DD),
                  icon: Icons.healing_rounded,
                  title: "Skin Biopsy Analysis",
                  date: "Jul 19, 2023",
                ),
                reportCard(
                  color: const Color(0xFFE3F1FF),
                  icon: Icons.vaccines_rounded,
                  title: "Vaccination Record",
                  date: "Jun 12, 2023",
                ),
                reportCard(
                  color: const Color(0xFFE4FFF5),
                  icon: Icons.visibility_rounded,
                  title: "Vision Test",
                  date: "May 20, 2023",
                ),
              ],
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // -------------------- Card With Colored Background --------------------
  Widget reportCard({
    required Color color,
    required IconData icon,
    required String title,
    required String date,
  }) {
    return Container(
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
          // TOP COLOR SECTION
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: Icon(icon, size: 38, color: Colors.black54),
            ),
          ),

          // TEXT SECTION
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(date, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // -------------------- Card With Image --------------------
  Widget reportImageCard({
    required String image,
    required String title,
    required String date,
  }) {
    return Container(
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
          // TOP IMAGE SECTION
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // TEXT SECTION
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(date, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
