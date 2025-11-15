import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard/dashboard_controller.dart';

class Page1View extends GetView<DashboardController> {
  const Page1View({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final List<String> bannerImages = [
      "assets/advertise/add1.png",
      "assets/advertise/add2.png",
      "assets/advertise/add3.png",
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA6B28B), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Header (Logo + Notification)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 60,
                      ),
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),

                // ✅ Search Bar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search for products...",
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ✅ Category Boxes
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomBoxWidget(
                      imagePath: "assets/category/image.png",
                      label: "Essentials",
                    ),
                    CustomBoxWidget(
                      imagePath: "assets/category/natural.png",
                      label: "Naturals",
                    ),
                    CustomBoxWidget(
                      imagePath: "assets/category/beauty.png",
                      label: "Beauty",
                    ),
                    CustomBoxWidget(
                      imagePath: "assets/category/supplements.png",
                      label: "Supplements",
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                FlutterCarousel(
                  options: FlutterCarouselOptions(
                    height: 180,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.85,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    enableInfiniteScroll: true,
                    showIndicator: true,
                    slideIndicator: CircularSlideIndicator(
                      slideIndicatorOptions: const SlideIndicatorOptions(
                        currentIndicatorColor: Colors.black,
                        indicatorBackgroundColor: Colors.white,
                        indicatorRadius: 3,
                        itemSpacing: 15,
                        //indicatorBorderWidth: 1.5,
                      ),
                    ),
                    floatingIndicator: true,
                    clipBehavior: Clip.hardEdge,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  ),
                  items: bannerImages.map((imagePath) {
                    return Builder(
                      builder: (context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Box Widget
class CustomBoxWidget extends StatelessWidget {
  final String imagePath;
  final String label;

  const CustomBoxWidget({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 40,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
