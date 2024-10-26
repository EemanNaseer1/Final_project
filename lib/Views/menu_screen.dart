import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfinalprojecthackton/Views/Order/order_detail.dart';
import 'package:myfinalprojecthackton/Views/Resturant/resturant_screen.dart';
import 'package:myfinalprojecthackton/Controllers/menu_controller.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the MenuController using Get.put()
    final MenuController1 menuController = Get.put(MenuController1());

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
            // Background Image
            Image.asset(
              'assets/images/menuImg.png',
              width: MediaQuery.of(context).size.width,
            ),
            // AppBar with Navigation Buttons
            _buildAppBar(context),
            // Quantity Selector
            _buildQuantitySelector(),
            // Noodle Type Title
            _buildNoodleTypeTitle(),
            // Noodle Type Checkboxes
            _buildNoodleTypeCheckboxes(menuController),
            // Add to Basket Button
            _buildAddToBasketButton(context),
          ],
        ),
      ),
    );
  }

  // AppBar Widget
  Widget _buildAppBar(BuildContext context) {
    return Positioned(
      top: 50,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Get.to(() => RestaurantScreen());
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
    );
  }

  // Quantity Selector Widget
  Widget _buildQuantitySelector() {
    return Positioned(
      bottom: 230,
      left: 20,
      child: Align(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(36, 28, 100, 1.0),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              backgroundColor: Color.fromRGBO(11, 18, 37, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove,
                      color: Color.fromRGBO(255, 255, 255, 0.6)),
                  onPressed: () {}, // Functionality can be added here
                ),
                Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {}, // Functionality can be added here
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Noodle Type Title Widget
  Widget _buildNoodleTypeTitle() {
    return Positioned(
      bottom: 140,
      left: 30,
      right: 20,
      child: Text(
        'Noodle Type',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  // Noodle Type Checkboxes Widget
  Widget _buildNoodleTypeCheckboxes(MenuController1 menuController) {
    return Positioned(
      bottom: 100,
      left: 30,
      right: 20,
      child: Column(
        children: [
          buildCheckbox(menuController, 'Thin'),
          buildCheckbox(menuController, 'Thick'),
          buildCheckbox(menuController, 'Udon'),
        ],
      ),
    );
  }

  // Checkbox Builder with Proper Obx Usage
  Widget buildCheckbox(MenuController1 menuController, String type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        Obx(() => Checkbox(
              value: menuController.selectedNoodleType.value == type,
              onChanged: (bool? value) {
                if (value == true) {
                  menuController.selectNoodleType(type);
                } else {
                  menuController.selectNoodleType('');
                }
              },
            )),
      ],
    );
  }

  // Add to Basket Button Widget
  Widget _buildAddToBasketButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 50,
      right: 20,
      child: Row(
        children: [
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
                    Color.fromRGBO(90, 100, 206, 1.0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 80.0, vertical: 12.0),
              child: Text(
                'Add to Basket',
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
    );
  }
}
