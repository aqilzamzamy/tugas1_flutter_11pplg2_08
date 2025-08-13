import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/components/custom_button.dart';
import 'package:latihan_11pplg2/components/custom_text.dart';
import 'package:latihan_11pplg2/components/custom_textfield.dart';
import 'package:latihan_11pplg2/controllers/calculator_controller.dart';
import 'package:latihan_11pplg2/routes/routes.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final CalculatorController calculatorController =
      Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              label: "Input Angka 1",
              controller: calculatorController.txtAngka1,
              isPassword: false,
              isNumber: true,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: "Input Angka 2",
              controller: calculatorController.txtAngka2,
              isPassword: false,
              isNumber: true,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  myText: "+",
                  myTextColor: Colors.black,
                  onPressed: calculatorController.tambah,
                ),
                CustomButton(
                  myText: "-",
                  myTextColor: Colors.black,
                  onPressed: calculatorController.kurang,
                ),
                CustomButton(
                  myText: "x",
                  myTextColor: Colors.black,
                  onPressed: calculatorController.kali,
                ),
                CustomButton(
                  myText: "/",
                  myTextColor: Colors.black,
                  onPressed: calculatorController.bagi,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() {
              return CustomText(
                myText: "Hasil ${calculatorController.textHasil.value}",
                myTextColor: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                align: TextAlign.center,
              );
            }),
            const SizedBox(height: 20),
            CustomButton(
              myText: "Clear / Main Menu",
              myTextColor: Colors.red,
              onPressed: () {
                calculatorController.clear();
                Get.toNamed(AppRoutes.football_page);
              },
            ),
          ],
        ),
      ),
    );
  }
}
