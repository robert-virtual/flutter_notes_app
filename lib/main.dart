import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/home_controller.dart';
import 'package:notes_app/pages/details.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatelessWidget {
  Home({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<HomeController>(
              builder: (_) => Column(
                children: [
                  Text("User Name: ${controller.user.name}"),
                  Text("Count: ${controller.count}"),
                ],
              ),
            ),
            TextField(
              onChanged: (text) {
                controller.updateUser(name: text);
              },
              decoration: const InputDecoration(
                label: Text("Name"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  DetailsPage(),
                );
              },
              child: const Text("Details"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
