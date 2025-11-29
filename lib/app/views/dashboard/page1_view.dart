import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/dashboard/dashboard_controller.dart';
import 'package:my_new_app/app/routes/app_routes.dart';

import '../../theme/app_theme.dart';

class Page1View extends GetView<DashboardController> {
  const Page1View({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = CustomTheme.of(context);

    return Scaffold(
      backgroundColor: AppColors.bgLight,
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
                        color: Colors.green, size: 21),
                    const SizedBox(width: 7),
                    const Text(
                      "Languar House",
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
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: AppColors.borderGray)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        //contentPadding: EdgeInsets.all(20),
                        icon: Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search for doctors, clinics, symptoms...',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
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
                            MediaQuery.of(context).size.height * 0.15, //95.0,
                        showIndicator: true,
                        slideIndicator: CircularSlideIndicator(
                          slideIndicatorOptions: SlideIndicatorOptions(
                            currentIndicatorColor: customTheme.primaryColor,
                            indicatorBackgroundColor:
                                CustomTheme.of(context).borderLightGray,
                            indicatorRadius: 5,
                            itemSpacing: 15,
                          ),
                        ),
                        floatingIndicator: false,
                        autoPlay: true,
                        viewportFraction: 0.99,
                      ),
                      items: controller.advertisementList.map((img) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: AppColors.borderLightGrayLight,
                                      width: 1),
                                ),
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
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                //const SizedBox(height: 22),
                // Quick Actions
                Row(
                  children: [
                    Expanded(
                      child: quickActionCard(
                        Icons.add,
                        "Book Now",
                      ),
                    ),
                    const SizedBox(width: 14), // spacing between cards
                    Expanded(
                      child: quickActionCard(
                        Icons.calendar_today_rounded,
                        "My Appointments",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 27),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Browse by Specialty",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.specialities);
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: AppColors.textDefaultLight),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.specialities);
                        },
                        icon: Icon(Icons.arrow_forward))
                  ],
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
                        Get.toNamed(Routes.doctorslist);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: AppColors.bgLight,
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

  static Widget quickActionCard(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.all(20), // ↓ reduced
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // ⭐ aligns vertically
        children: [
          Icon(icon, color: Colors.blue, size: 20), // ↓ reduced size
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14, // ↓ slightly reduced
              ),
            ),
          ),
        ],
      ),
    );
  }
}
