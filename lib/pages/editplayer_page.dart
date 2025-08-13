import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import '../models/player.dart';
import '../components/custom_textfield.dart';
import '../components/custom_button.dart';

class EditPlayerPage extends StatelessWidget {
  EditPlayerPage({super.key});

  final FootballController footballController = Get.find<FootballController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final int index = args['index'];
    final Player player = args['player'];

    // Set default values
    nameController.text = player.name;
    positionController.text = player.position;
    numberController.text = player.number.toString();
    imageController.text = player.image;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Player"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              label: "Name",
              controller: nameController,
              isPassword: false,
              isNumber: false,
            ),
            CustomTextField(
              label: "Position",
              controller: positionController,
              isPassword: false,
              isNumber: false,
            ),
            CustomTextField(
              label: "Number",
              controller: numberController,
              isPassword: false,
              isNumber: true,
            ),
            CustomTextField(
              label: "Image Path",
              controller: imageController,
              isPassword: false,
              isNumber: false,
            ),
            const SizedBox(height: 20),
            CustomButton(
              myText: "Save",
              myTextColor: Colors.white,
              onPressed: () {
                footballController.updatePlayer(
                  index,
                  nameController.text,
                  positionController.text,
                  int.tryParse(numberController.text) ?? 0,
                  imageController.text,
                );
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
