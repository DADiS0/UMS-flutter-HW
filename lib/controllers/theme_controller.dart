import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  bool get isDarkMode => _box.read(_key) ?? false;

  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    _box.write(_key, !isDarkMode);
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  @override
  void onInit() {
    Get.changeThemeMode(theme);
    super.onInit();
  }
} 