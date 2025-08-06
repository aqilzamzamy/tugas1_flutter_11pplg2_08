import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/components/custom_button.dart';
import 'package:latihan_11pplg2/components/custom_text.dart';
import 'package:latihan_11pplg2/components/custom_textfield.dart';
import 'package:latihan_11pplg2/controllers/calculator_controller.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: "Input Angka 1",
              controller: widget.calculatorController.txtAngka1,
              isPassword: false,
              isNumber: true,
            ),
            CustomTextField(
              label: "Input Angka 2",
              controller: widget.calculatorController.txtAngka2,
              isPassword: false,
              isNumber: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  myText: "+",
                  myTextColor: Colors.black,
                  onPressed: () {
                    widget.calculatorController.tambah();
                  },
                ),
                CustomButton(
                  myText: "-",
                  myTextColor: Colors.black,
                  onPressed: () {
                    widget.calculatorController.kurang();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  myText: "x",
                  myTextColor: Colors.black,
                  onPressed: () {
                    widget.calculatorController.kali();
                  },
                ),
                CustomButton(
                  myText: "/",
                  myTextColor: Colors.black,
                  onPressed: () {
                    widget.calculatorController.bagi();
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Obx(() {
              return CustomText(
                myText: "Hasil: ${widget.calculatorController.textHasil.value}",
                myTextColor: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                align: TextAlign.center,
              );
            }),
            SizedBox(height: 20),
            CustomButton(
              myText: "Clear",
              myTextColor: Colors.red,
              onPressed: () {
                widget.calculatorController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
