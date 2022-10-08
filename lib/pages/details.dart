import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/home_controller.dart';

class DetailsPage extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<HomeController>(builder: (_) {
              return Column(
                children: [
                  Text("User Name: ${controller.user.name}"),
                  Text("Count: ${controller.count}"),
                ],
              );
            }),
            TextField(
              onChanged: (text) {
                controller.updateUser(name: text);
              },
              decoration: const InputDecoration(
                label: Text("Name"),
              ),
            ),
            const Text("Details")
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
