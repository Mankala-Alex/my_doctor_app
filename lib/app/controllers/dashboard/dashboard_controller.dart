import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  void updateIndex(int index) {
    selectedIndex.value = index;
  }

  final List<String> advertisementList = [
    'assets/advertise/add1.png',
    'assets/advertise/add2.png',
    'assets/advertise/add3.png',
  ];
// Replace these with your actual SVG/icon asset paths
  static const List<Map<String, String>> specialities = [
    {'name': 'Cardiology', 'icon': 'assets/departments/Cardiology.svg'},
    {
      'name': 'Dermatology',
      'icon': 'assets/departments/Dermatology Specialty.svg'
    },
    {
      'name': 'Dentistry',
      'icon': 'assets/departments/Ear, Nose & Throat Specialty.svg'
    },
    {'name': 'Neurology', 'icon': 'assets/departments/Gastroenterology.svg'},
    {
      'name': 'Orthopedics',
      'icon': 'assets/departments/Obstetrics & Gynecology Specialty.svg'
    },
    {
      'name': 'Pediatrics',
      'icon': 'assets/departments/Pediatric Specialty.svg'
    },
    {'name': 'Psychiatry', 'icon': 'assets/departments/Sexual Health.svg'},
    {
      'name': 'Ophthalmology',
      'icon':
          'assets/departments/Physical Medicine & Rehabilitation Specialty.svg'
    },
  ];
}
