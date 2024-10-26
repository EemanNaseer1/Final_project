import 'package:get/get.dart';

class ProductController extends GetxController {
  var cartItems = <String>[].obs; // Observable list to track cart items

  void addToCart(String productName) {
    cartItems.add(productName);
    Get.snackbar(
      'Product Added',
      '$productName has been added to your cart.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
