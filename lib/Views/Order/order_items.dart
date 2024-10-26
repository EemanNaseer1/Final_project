import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinalprojecthackton/Controllers/order_item_controller.dart';

class OrderItemContainer extends StatelessWidget {
  final String imagePath;
  final String price;
  final String description;
  final String label;

  OrderItemContainer({
    required this.imagePath,
    required this.price,
    required this.description,
    required this.label, required Null Function(dynamic count) onCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    final OrderItemController orderItemController = Get.put(OrderItemController());

    return Obx(() {
      final orderItem = orderItemController.orderItem.value;

      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                orderItem.imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderItem.price,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    orderItem.description,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    orderItem.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              color: Colors.white,
                              onPressed: orderItemController.decrementCount,
                            ),
                            Text(
                              orderItem.count.toString(),
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              color: Colors.white,
                              onPressed: orderItemController.incrementCount,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.delete,
                            color: Color.fromRGBO(255, 255, 255, 0.6)),
                        onPressed: () {
                          // Implement delete logic here if needed
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
