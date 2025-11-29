import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialitiesController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<Map<String, String>> specialitiesData = <Map<String, String>>[].obs;
  RxList<Map<String, String>> originalList = <Map<String, String>>[].obs;
  TextEditingController searchController = TextEditingController();

  RxString serachKey = "".obs;

  @override
  void onInit() {
    loadStaticData();
    super.onInit();
  }

  void loadStaticData() {
    isLoading.value = true;

    specialitiesData.value = [
      {
        "id": "1",
        "name": "Cardiology",
        "desc": "Heart & blood vessel specialist",
        "icon": "assets/departments/Cardiology.svg"
      },
      {
        "id": "2",
        "name": "Dermatology",
        "desc": "Skin & hair specialist",
        "icon": "assets/departments/Dermatology.svg"
      },
      {
        "id": "3",
        "name": "Neurology",
        "desc": "Brain & nerves specialist",
        "icon": "assets/departments/Neurology.svg"
      },
      {
        "id": "4",
        "name": "Orthopedics",
        "desc": "Bone & joint specialist",
        "icon": "assets/departments/Orthopedics.svg"
      },
      {
        "id": "5",
        'name': 'Orthopedics',
        "desc": "Bone & joint specialist",
        'icon': 'assets/departments/Obstetrics & Gynecology Specialty.svg'
      },
      {
        "id": "6",
        'name': 'Pediatrics',
        "desc": "Bone & joint specialist",
        'icon': 'assets/departments/Pediatric Specialty.svg'
      },
      {
        "id": "7",
        'name': 'Psychiatry',
        "desc": "Bone & joint specialist",
        'icon': 'assets/departments/Sexual Health.svg'
      },
      {
        "id": "8",
        'name': 'Ophthalmology',
        "desc": "Bone & joint specialist",
        'icon':
            'assets/departments/Physical Medicine & Rehabilitation Specialty.svg'
      },
    ];

    originalList.value = List.from(specialitiesData);

    isLoading.value = false;
  }

  // ---------- SEARCH FUNCTIONALITY ----------
  void localFilter(String value) {
    if (value.isEmpty) {
      specialitiesData.value = originalList;
      return;
    }

    specialitiesData.value = originalList.where((item) {
      final name = item["name"]!.toLowerCase();
      final desc = item["desc"]!.toLowerCase();
      final key = value.toLowerCase();

      return name.contains(key) || desc.contains(key);
    }).toList();
  }
}
