import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinalprojecthackton/Views/Order/bottom_container.dart';
import 'package:myfinalprojecthackton/Views/Order/order_items.dart';
import 'package:myfinalprojecthackton/Views/menu_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroundImage.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 60),
                // Back Button
                Row(
                  children: [
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Get.to(() => MenuScreen());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Order Details Title
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'Order Details',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Order Items
                OrderItemContainer(
                  imagePath: 'assets/images/salad.jpg',
                  price: '\$12.99',
                  description: 'Delicious Burger',
                  label: 'Cheese Sauce',
                  onCountChanged: (count) {
                    print("Item count: $count");
                  },
                ),
                OrderItemContainer(
                  imagePath: 'assets/images/curry.jpg',
                  price: '\$12.99',
                  description: 'Delicious Burger',
                  label: 'Cheese Sauce',
                  onCountChanged: (count) {
                    print("Item count: $count");
                  },
                ),
                SizedBox(height: 36),
                // Bottom Summary Container
                BottomSummaryContainer(
                  subtotal: "\$25.00",
                  deliveryFee: "\$5.00",
                  total: "\$30.00",
                  onCheckout: () {
                    // Handle checkout action with GetX navigation
                    Get.snackbar(
                      "Checkout",
                      "Proceeding to payment",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
