import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  var isChecked = false.obs;

  void toggleCheck() {
    isChecked.value = !isChecked.value;
  }
}
