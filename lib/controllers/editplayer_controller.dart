import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/components/custom_button.dart';
import 'package:latihan_11pplg2/components/custom_text.dart';
import 'package:latihan_11pplg2/components/custom_textfield.dart';
import 'package:latihan_11pplg2/controllers/football_controller.dart';
import 'package:latihan_11pplg2/models/player.dart';

class EditPlayerPage extends StatelessWidget {
  final int index;
  final Player player;

  EditPlayerPage({super.key, required this.index, required this.player});

  final FootballController footballController = Get.find();

  // Controller untuk form
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Set default value ketika masuk halaman
    nameController.text = player.name;
    positionController.text = player.position;
    numberController.text = player.number.toString();
    imageController.text = player.image;

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          myText: "Edit Player",
          myTextColor: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          align: TextAlign.center,
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
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
                footballController.players[index] = Player(
                  name: nameController.text,
                  position: positionController.text,
                  number: int.tryParse(numberController.text) ?? 0,
                  image: imageController.text,
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
