import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/dashboard/dashboard_controller.dart';

import '../../theme/app_theme.dart';

class Page1View extends GetView<DashboardController> {
  const Page1View({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = CustomTheme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Location & Notification
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded,
                        color: Colors.blue, size: 21),
                    const SizedBox(width: 7),
                    const Text(
                      "New York, USA",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Icon(Icons.notifications_none, color: Colors.grey.shade700),
                  ],
                ),
                const SizedBox(height: 20),
                // Search Box
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 11),
                      icon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search for doctors, clinics, symptoms...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                // Promotion Card
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 1),
                  child: Container(
                    // decoration:
                    //     BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.borderLightGrayLight, width: 1)),
                    //color: const Color(0xFFFCE0D6),
                    padding: const EdgeInsets.only(bottom: 15),
                    child: FlutterCarousel(
                      options: FlutterCarouselOptions(
                        height:
                            MediaQuery.of(context).size.height * 0.1, //95.0,
                        showIndicator: true,
                        slideIndicator: CircularSlideIndicator(
                          slideIndicatorOptions: SlideIndicatorOptions(
                            currentIndicatorColor: customTheme.primaryColor,
                            indicatorBackgroundColor:
                                CustomTheme.of(context).borderLightGray,
                            indicatorRadius: 5,
                            itemSpacing: 13,
                          ),
                        ),
                        floatingIndicator: false,
                        autoPlay: true,
                        viewportFraction: 0.99,
                      ),
                      items: controller.advertisementList.map((img) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: AppColors.borderLightGrayLight,
                                      width: 1)),
                              width: double.infinity,
                              padding: const EdgeInsets.all(1),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    12), // Match the Container's border radius
                                child: Image.asset(
                                  // FIX: Pass 'img' (the asset path) here
                                  img,
                                  fit: BoxFit
                                      .cover, // Ensures the image fills the area
                                  width: double.infinity,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                // Quick Actions
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 2.45,
                  children: [
                    _quickActionCard(Icons.add, "Book Now", "Find a doctor"),
                    _quickActionCard(Icons.calendar_today_rounded,
                        "My Appointments", "Upcoming visits"),
                    // _quickActionCard(Icons.folder_open, "View Records",
                    //     "Your health history"),
                    // _quickActionCard(Icons.videocam_outlined, "Video Consult",
                    //     "Talk to a doctor"),
                  ],
                ),
                const SizedBox(height: 27),
                const Text(
                  "Browse by Specialty",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 18),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 17,
                  childAspectRatio: .85,
                  children: DashboardController.specialities.map((item) {
                    return GestureDetector(
                      onTap: () {
                        // Example navigation; replace route as needed
                        Get.toNamed('/doctorList', arguments: {
                          "categoryId": item['name'] ?? "",
                          "title": item['name'] ?? "",
                        });
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: const Color(0xFFE5F0FF),
                            child: SvgPicture.asset(item['icon'] ?? '',
                                height: 28),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['name'] ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black87),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _quickActionCard(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        color: Colors.white,
        elevation: 0,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Row(
              children: [
                Icon(icon, color: Colors.blue, size: 26),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 14),
                      Text(subtitle,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black54)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
