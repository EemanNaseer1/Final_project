import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinalprojecthackton/Controllers/order_controller.dart';
import 'package:myfinalprojecthackton/Views/Order/order_items.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                Row(
                  children: [
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Get.back(); // Use Get.back() for navigation
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(children: [
                  SizedBox(width: 20),
                  Text(
                    'Order Details',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ]),
                SizedBox(height: 20),

                // Use Obx to listen for changes in orderItems
                Obx(() {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: orderController.orderItems.length,
                      itemBuilder: (context, index) {
                        final item = orderController.orderItems[index];
                        return OrderItemContainer(
                          imagePath: item.imagePath,
                          price: item.price,
                          description: item.description,
                          label: item.label,
                          onCountChanged: (count) {
                            print("Item count: $count");
                            // Update the item count if necessary
                          },
                        );
                      },
                    ),
                  );
                }),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
