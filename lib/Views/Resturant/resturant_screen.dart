import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinalprojecthackton/Controllers/resturant_controller.dart';
import 'package:myfinalprojecthackton/Views/Home/home_screen.dart';
import 'package:myfinalprojecthackton/Views/Resturant/product.dart';

class RestaurantScreen extends StatelessWidget {
  final RestaurantController controller = Get.put(RestaurantController()); // Instantiate the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundImage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Deal image
            Image.asset(
              'assets/images/deal.png',
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: 50,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Container with glass effect
            Positioned(
              top: 260,
              left: 20,
              right: 20,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    // Top part with glass effect
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            color: Color.fromRGBO(20, 20, 71, 1.0)
                                .withOpacity(0.2),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Image.asset('assets/images/star.png'),
                                SizedBox(width: 10),
                                Text(
                                  'Kinka Izakaya',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Bottom part with dark blue color and text
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(11, 18, 37, 1),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(10)),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Delivery Fee',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.6),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '3.99',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 240,
              left: 20,
              child: Align(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    backgroundColor: Color.fromRGBO(11, 18, 37, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(42, 47, 117, 1.0),
                              Color.fromRGBO(30, 32, 83, 1.0),
                              Color.fromRGBO(55, 66, 157, 1.0),
                              Color.fromRGBO(90, 100, 206, 1.0),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Delivery',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Take Out',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 200,
              left: 20,
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 20),
                    Obx(() => _buildSelectableText("Featured Items", 0)),
                    SizedBox(width: 35),
                    Obx(() => _buildSelectableText("Sushi", 1)),
                    SizedBox(width: 35),
                    Obx(() => _buildSelectableText("Burgers", 2)),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 160,
              left: 30,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Featured Items',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Product(
                    imagePath: 'assets/images/soupBowl.png',
                    title: 'Soup Bowl',
                    subtitle: 'Delicious soup',
                    price: '\$9.99',
                  ),
                  // Add more ProductItems as needed
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10, left: 20),
                width: 120,
                height: 5,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to create selectable text items
  Widget _buildSelectableText(String text, int index) {
    return GestureDetector(
      onTap: () => controller.updateSelectedIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: controller.selectedIndex.value == index
                      ? Colors.white
                      : Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              )),
          Obx(() {
            if (controller.selectedIndex.value == index) {
              return Container(
                height: 1,
                width: 100,
                color: Colors.blue,
                margin: EdgeInsets.only(top: 5),
              );
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
