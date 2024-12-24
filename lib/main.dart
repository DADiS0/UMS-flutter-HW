import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controllers/theme_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'تطبيق السمات',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.theme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تغيير السمة'),
      ),
      body: Center(
        child: GetBuilder<ThemeController>(
          builder: (controller) => ElevatedButton(
            onPressed: controller.changeTheme,
            child: Text(
              controller.isDarkMode ? 'تفعيل الوضع الفاتح' : 'تفعيل الوضع الداكن',
            ),
          ),
        ),
      ),
    );
  }
}
