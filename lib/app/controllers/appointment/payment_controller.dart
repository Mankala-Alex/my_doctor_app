// lib/app/controllers/appointment/payment_controller.dart
import 'package:get/get.dart';

class PaymentController extends GetxController {
  /// Currently selected payment option id.
  /// Will be "card1", "card2", "upi", "hospital", etc.
  RxString selectedPayment = "card1".obs;

  /// Static list of saved cards (icon path + masked number)
  /// Replace icons/numbers with real data as needed.
  RxList<Map<String, String>> cards = <Map<String, String>>[
    {
      "id": "card1",
      "icon": "assets/images/calendar.png", // update asset path
      "number": "•••• 1234",
    },
    {
      "id": "card2",
      "icon": "assets/images/calendar.png",
      "number": "•••• 5678",
    },
  ].obs;

  /// Total payable amount (you can compute this dynamically)
  RxDouble total = 80.0.obs;

  /// Convenience getter (optional)
  String get selectedPaymentValue => selectedPayment.value;

  /// Example: method to add a card
  void addCard(String id, String icon, String number) {
    cards.add({"id": id, "icon": icon, "number": number});
  }

  /// Example: update total
  void setTotal(double amount) {
    total.value = amount;
  }
}
