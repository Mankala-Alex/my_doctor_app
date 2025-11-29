import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_new_app/app/controllers/appointment/payment_controller.dart';
import 'package:my_new_app/app/routes/app_routes.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          "Confirm & Pay",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------- APPOINTMENT SUMMARY ------------------
            _summaryCard(),

            const SizedBox(height: 25),

            // ------------------- PAYMENT METHOD TITLE ------------------
            const Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            // ------------------- SAVED CARDS ------------------
            Obx(() {
              return Column(
                children: controller.cards.map((card) {
                  final isSelected =
                      controller.selectedPayment.value == card["id"];

                  return GestureDetector(
                    onTap: () =>
                        controller.selectedPayment.value = card["id"] ?? "",
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? const Color(0xFFE9F2FF) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              isSelected ? Colors.blue : Colors.grey.shade300,
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(card["icon"] ?? "", width: 40),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              card["number"] ?? "",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: isSelected ? Colors.blue : Colors.grey,
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }),

            // ------------------- ADD NEW CARD ------------------
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add_circle_outline, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    "Add New Card",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ------------------- UPI PAYMENT ------------------
            _upiTile(),

            const SizedBox(height: 12),

            // ------------------- PAY AT HOSPITAL ------------------
            _payAtHospitalTile(),

            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _bottomPayBar(),
    );
  }

  // ------------------ SUMMARY CARD -------------------
  Widget _summaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Appointment Summary",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          _summaryRow("Doctor", "Dr. Emily Carter"),
          _summaryRow("Speciality", "Cardiologist"),
          _summaryRow("Date & Time", "Dec 15, 2024 at 10:30 AM"),
          const Divider(height: 30),
          _summaryRow("Consultation Fee", "\$75.00"),
          _summaryRow("Taxes & Fees", "\$5.00"),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // ------------------ UPI PAYMENT TILE -------------------
  Widget _upiTile() {
    return Obx(() {
      final isSelected = controller.selectedPayment.value == "upi";

      return GestureDetector(
        onTap: () => controller.selectedPayment.value = "upi",
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Image.asset("assets/images/calendar.png", width: 30),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  "UPI Payment",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(
                isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        ),
      );
    });
  }

  // ------------------ PAY AT HOSPITAL TILE -------------------
  Widget _payAtHospitalTile() {
    return Obx(() {
      final isSelected = controller.selectedPayment.value == "hospital";

      return GestureDetector(
        onTap: () => controller.selectedPayment.value = "hospital",
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.local_hospital,
                  size: 30, color: Colors.redAccent),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  "Pay at Hospital",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(
                isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        ),
      );
    });
  }

  // ------------------ BOTTOM PAY BAR -------------------
  Widget _bottomPayBar() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 6, offset: Offset(0, -2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Total Payable",
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              Text("\$80.00",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            ],
          ),
          const SizedBox(height: 16),

          // Pay Button
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.confirmationpage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Pay \$80.00 Now",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 8),

          const Center(
            child: Text(
              "Your payment is safe and secure.",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
