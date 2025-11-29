import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../custome_widgets/custome_arrow_back.dart';
import '../../custome_widgets/custome_no_data.dart';
import '../../custome_widgets/loader.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';
import '../../controllers/appointment/specialities_controller.dart';

class SpecialitiesView extends GetView<SpecialitiesController> {
  const SpecialitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = CustomTheme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: customTheme.bgColor,
      appBar: AppBar(
        backgroundColor: customTheme.bgColor,
        elevation: 0,
        centerTitle: false,
        leadingWidth: 30,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: const CustomeArrowBack(),
        title: Obx(() {
          return Text(
            '${controller.specialitiesData.length} Specialities',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.textLightGrayLight,
              fontSize: 14,
            ),
          );
        }),
      ),

      // -------------------------------------------------
      //                 BODY
      // -------------------------------------------------
      body: Column(
        children: [
          // SEARCH BAR
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: customTheme.borderLightBlue),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 14, right: 18),
                    height: 50,
                    child: TextField(
                      onChanged: (value) {
                        controller.serachKey.value = value;
                        controller.localFilter(value);
                      },
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        labelText: "Search Specialities",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textLightGrayLight,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFD0DCEC),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.borderLightBlueLight,
                            width: 1,
                          ),
                        ),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: AppColors.bgBlackLight,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // LIST OF SPECIALITIES
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return loader();
              } else if (controller.specialitiesData.isEmpty) {
                return noDataAvailable(
                  imagePath: "assets/nodata/no_speciality.png",
                  title: "No Data",
                );
              }

              return ListView.builder(
                itemCount: controller.specialitiesData.length,
                itemBuilder: (context, index) {
                  var data = controller.specialitiesData[index];

                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.doctorslist, arguments: {
                        "categoryId": data["id"],
                        "title": data["name"],
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderLightBlueLight),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    // ICON
                                    SvgPicture.asset(
                                      data["icon"]!,
                                      height: 30,
                                    ),
                                    const SizedBox(width: 15),

                                    // TEXT DETAILS
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data["name"]!,
                                            style: TextStyle(
                                              fontSize: textTheme
                                                  .labelLarge?.fontSize,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  AppColors.textLightGrayLight,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            data["desc"]!,
                                            style: TextStyle(
                                              fontSize: textTheme
                                                  .labelMedium?.fontSize,
                                              fontWeight: FontWeight.w300,
                                              color:
                                                  AppColors.textLightGrayLight,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: AppColors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
