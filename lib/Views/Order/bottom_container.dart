import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinalprojecthackton/Views/Order/order_detail.dart'; // Adjust the import as needed

class BottomSummaryContainer extends StatelessWidget {
  final String subtotal;
  final String deliveryFee;
  final String total;
  final VoidCallback onCheckout;

  BottomSummaryContainer({
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(30, 32, 83, 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Subtotal Row
            _buildSummaryRow("Subtotal", subtotal),
            SizedBox(height: 8),
            // Delivery Fee Row
            _buildSummaryRow("Delivery", deliveryFee),
            SizedBox(height: 8),
            // Total Row
            _buildSummaryRow("Total", total, isBold: true),
            SizedBox(height: 15),
            // Checkout Button
            ElevatedButton(
              onPressed: () {
                Get.to(() => OrderDetailsScreen());
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(42, 47, 117, 1.0),
                      Color.fromRGBO(30, 32, 83, 1.0),
                      Color.fromRGBO(55, 66, 157, 1.0),
                      Color.fromRGBO(90, 100, 206, 1.0)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 80.0, vertical: 12.0),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create each row in the summary
  Widget _buildSummaryRow(String label, String amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
