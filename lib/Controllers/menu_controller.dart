import 'package:get/get.dart';

class MenuController1 extends GetxController {
  var selectedNoodleType = ''.obs;

  void selectNoodleType(String type) {
    selectedNoodleType.value = type;
  }
}
