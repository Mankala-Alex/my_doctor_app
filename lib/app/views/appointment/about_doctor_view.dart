import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/appointment/doctor_slot_controller.dart';

class AboutDoctorView extends GetView<DoctorSlotController> {
  const AboutDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final doctorName = args["doctorName"] ?? "Dr. Jane Doe";
    final designation = args["designation"] ?? "Cardiologist";
    final experience = args["experience"] ?? "10 years experience";

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- TITLE ----------------
          Text(
            doctorName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            designation,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),

          // ---------------- ABOUT SECTION ----------------
          const Text(
            "About Doctor",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          const Text(
            "Dr. Jane Doe is a highly experienced cardiologist with over "
            "10 years of clinical practice. She specializes in cardiac care, "
            "preventive treatments, and advanced heart diagnostics.",
            style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
          ),

          const SizedBox(height: 20),

          // ---------------- EXPERIENCE ----------------
          const Text(
            "Experience",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          _infoCard(children: [
            _bullet("10+ years of experience in Cardiology"),
            _bullet("Former Senior Consultant at ABC Hospital"),
            _bullet("Performed 2000+ successful cardiac procedures"),
          ]),

          const SizedBox(height: 20),

          // ---------------- QUALIFICATIONS ----------------
          const Text(
            "Qualifications",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          _infoCard(children: [
            _bullet("MBBS – XYZ Medical College"),
            _bullet("MD – Internal Medicine"),
            _bullet("DM – Cardiology"),
          ]),

          const SizedBox(height: 20),

          // ---------------- SPECIALIZATIONS ----------------
          const Text(
            "Specializations",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          _infoCard(children: [
            _bullet("Heart Failure Management"),
            _bullet("Interventional Cardiology"),
            _bullet("ECG & Stress Test Analysis"),
            _bullet("Cardiac Preventive Care"),
          ]),

          const SizedBox(height: 20),

          // ---------------- LANGUAGES ----------------
          const Text(
            "Languages",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          _infoCard(children: [
            _bullet("English"),
            _bullet("Arabic"),
            _bullet("Hindi"),
          ]),

          const SizedBox(height: 20),

          // ---------------- CLINIC ADDRESS ----------------
          const Text(
            "Clinic Address",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          _infoCard(children: [
            const Text(
              "Wahat Al Shifa Hospital\nAl Riyadh, Saudi Arabia",
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
          ]),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // ---------------- REUSABLE INFO CARD ----------------
  Widget _infoCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDDE0E6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  // ---------------- BULLET TEXT ----------------
  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•  ", style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
