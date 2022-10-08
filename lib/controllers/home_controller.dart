import 'package:get/get.dart';
import 'package:notes_app/models/user.dart';

class HomeController extends GetxController {
  var count = 0;
  var user = User();

  void increment() {
    count++;
    update();
  }

  updateUser({String? name, int? age}) {
    user.name = name ?? user.name;
    user.age = age ?? user.age;
    update();
  }
}
