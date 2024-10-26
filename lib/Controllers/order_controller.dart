import 'package:get/get.dart';

class OrderController extends GetxController {
  var orderItems = <OrderItem>[].obs; // Observable list of order items

  void addOrderItem(OrderItem item) {
    orderItems.add(item);
  }

  void removeOrderItem(OrderItem item) {
    orderItems.remove(item);
  }

  // Add any additional methods needed for your order logic
}

class OrderItem {
  final String imagePath;
  final String price;
  final String description;
  final String label;

  var count;

  OrderItem({
    required this.imagePath,
    required this.price,
    required this.description,
    required this.label,
  });
}
