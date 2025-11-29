import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_new_app/app/routes/app_routes.dart';

class SelectPatientBottomSheet extends StatefulWidget {
  const SelectPatientBottomSheet({super.key});

  @override
  State<SelectPatientBottomSheet> createState() =>
      _SelectPatientBottomSheetState();
}

class _SelectPatientBottomSheetState extends State<SelectPatientBottomSheet> {
  String selectedPatient = "1";

  @override
  Widget build(BuildContext context) {
    final double sheetHeight = MediaQuery.of(context).size.height * 0.55;

    return Container(
      height: sheetHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- HEADER ----------------
          Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back, size: 24),
              ),
              const SizedBox(width: 5),
              const Text(
                "Select Patient",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),

          const SizedBox(height: 10),

          // ---------------- PATIENT CARD ----------------
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Row(
              children: [
                // DETAILS
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "John Doe",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "DOB: 12 Aug 1998",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Gender: Male",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                // RADIO BUTTON
                Radio(
                  value: "1",
                  groupValue: selectedPatient,
                  onChanged: (v) {
                    setState(() {
                      selectedPatient = v.toString();
                    });
                  },
                ),
              ],
            ),
          ),

          Spacer(),

          // ---------------- ADD PATIENT BOX ----------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.red, width: 1.2),
            ),
            child: const Center(
              child: Text(
                "Add Patient",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // ---------------- CONFIRM BUTTON ----------------
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.paymentview);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "Confirm Patient",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
