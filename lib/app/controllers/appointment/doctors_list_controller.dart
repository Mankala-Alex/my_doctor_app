import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorsListController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<Map<String, dynamic>> doctors = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> originalDoctors = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    loadStaticDoctors();
    super.onInit();
  }

  void loadStaticDoctors() {
    doctors.value = [
      {
        "name": "Dr. Jane Doe, MD",
        "speciality": "Cardiologist",
        "rating": "4.9",
        "reviews": "212",
        "next": "Tomorrow, 10:00 AM",
        "image": "assets/images/doctor.png",
      },
      {
        "name": "Dr. Ben Carter, MD",
        "speciality": "Cardiologist",
        "rating": "4.8",
        "reviews": "189",
        "next": "Tomorrow, 11:30 AM",
        "image": "assets/images/doctor.png",
      },
      {
        "name": "Dr. Evelyn Reed, MD",
        "speciality": "Cardiologist",
        "rating": "4.7",
        "reviews": "156",
        "next": "Friday, 2:00 PM",
        "image": "assets/images/doctor.png",
      },
      {
        "name": "Dr. Evelyn Reed, MD",
        "speciality": "Cardiologist",
        "rating": "4.7",
        "reviews": "156",
        "next": "Friday, 2:00 PM",
        "image": "assets/images/doctor.png",
      },
      {
        "name": "Dr. Jane Doe, MD",
        "speciality": "Cardiologist",
        "rating": "4.9",
        "reviews": "212",
        "next": "Tomorrow, 10:00 AM",
        "image": "assets/images/doctor.png",
      },
      {
        "name": "Dr. Ben Carter, MD",
        "speciality": "Cardiologist",
        "rating": "4.8",
        "reviews": "189",
        "next": "Tomorrow, 11:30 AM",
        "image": "assets/images/doctor.png",
      },
    ];

    originalDoctors.value = List.from(doctors);
  }

  void searchDoctor(String query) {
    if (query.isEmpty) {
      doctors.value = originalDoctors;
      return;
    }

    doctors.value = originalDoctors.where((doc) {
      return doc["name"]!.toLowerCase().contains(query.toLowerCase()) ||
          doc["speciality"]!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
