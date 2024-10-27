// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myfinalprojecthackton/Controllers/home_controller.dart';
// import 'package:myfinalprojecthackton/Views/Home/containers.dart';
// import 'package:myfinalprojecthackton/Views/Home/different_containers.dart';

// class HomeScreen extends StatelessWidget {
//   final HomeController homeController = Get.put(HomeController());

//    HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Container
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/backgroundImage.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 50),
//                     _buildTopRow(),
//                     _buildLocationText(),
//                     _buildSearchField(),
//                     SizedBox(height: 15),
//                     _buildCategoriesRow(),
//                     _buildCategoriesScroll(),
//                     SizedBox(height: 10),
//                     _buildOffersScroll(),
//                     SizedBox(height: 10),
//                     _buildSectionTitle('Fastest near you'),
//                     SizedBox(height: 10),
//                     Image.asset('assets/images/dish.png'),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           _buildBottomNavBar(),
//         ],
//       ),
//     );
//   }

//   Widget _buildTopRow() {
//     return Row(
//       children: [
//         Icon(Icons.menu, color: Colors.white, size: 30),
//         SizedBox(width: 15),
//         Text(
//           'Delivery',
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//             color: Colors.white.withOpacity(0.6),
//           ),
//         ),
//         Spacer(),
//         Image.asset('assets/images/segmentedControl.png'),
//       ],
//     );
//   }

//   Widget _buildLocationText() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0),
//       child: Text(
//         'Maplewood Suites',
//         style: TextStyle(
//           fontSize: 17,
//           fontWeight: FontWeight.w500,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchField() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10.0),
//       child: Container(
//         height: 55,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Color.fromRGBO(76, 116, 140, 1.0)),
//         ),
//         child: TextField(
//           decoration: InputDecoration(
//             prefixIcon: Icon(Icons.search, color: Colors.white, size: 25),
//             hintText: 'Your Order?',
//             hintStyle: TextStyle(
//               color: Colors.white.withOpacity(0.6),
//               fontSize: 16,
//             ),
//             border: InputBorder.none,
//             contentPadding: EdgeInsets.symmetric(vertical: 20.0),
//           ),
//           style: TextStyle(color: Colors.white.withOpacity(0.6)),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoriesRow() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           'Categories',
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w500,
//             color: Colors.white,
//           ),
//         ),
//         Text(
//           'See All',
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//             color: Colors.white.withOpacity(0.6),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCategoriesScroll() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           DifferentContainers(imagePath: 'assets/images/burger.png'),
//           SizedBox(width: 10),
//           DifferentContainers(imagePath: 'assets/images/cake.png'),
//           SizedBox(width: 10),
//           DifferentContainers(imagePath: 'assets/images/sushi.png'),
//           SizedBox(width: 10),
//           DifferentContainers(imagePath: 'assets/images/taco.png'),
//         ],
//       ),
//     );
//   }

//   Widget _buildOffersScroll() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//           3,
//           (index) => Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: Containers(
//               imagePath: 'assets/images/soap.png',
//               heading: '30% OFF',
//               text: 'Discover Discounts in your',
//               secondText: 'favorite local restaurants',
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: TextStyle(
//         fontSize: 17,
//         fontWeight: FontWeight.w500,
//         color: Colors.white,
//       ),
//     );
//   }

//   Widget _buildBottomNavBar() {
//     return Positioned(
//       bottom: 10,
//       left: 5,
//       right: 5,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(25),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//           child: Container(
//             height: 80,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(25),
//               border: Border.all(
//                 color: Colors.white.withOpacity(0.4),
//                 width: 1,
//               ),
//             ),
//             child: Obx(
//               () => Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildNavItem(Icons.home, "Home", 0),
//                   _buildNavItem(Icons.search, "Browse", 1),
//                   _buildNavItem(Icons.shopping_cart, "Cart", 2, onTap: () {
//                     // Get.to(() => MenuScreen());
//                   }),
//                   _buildNavItem(Icons.receipt, "Order", 3),
//                   _buildNavItem(Icons.person, "Account", 4),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNavItem(IconData icon, String label, int index,
//       {VoidCallback? onTap}) {
//     return GestureDetector(
//       onTap: () {
//         homeController.changeIndex(index);
//         if (onTap != null) onTap();
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: homeController.selectedIndex.value == index
//                 ? Colors.white
//                 : Colors.white.withOpacity(0.7),
//             size: 25,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: homeController.selectedIndex.value == index
//                   ? Colors.white
//                   : Colors.white.withOpacity(0.7),
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
