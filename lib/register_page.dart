import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latihan_11pplg2/components/custom_button.dart';
import 'package:latihan_11pplg2/components/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String? selectedGender;

  void register(BuildContext context) {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        dateController.text.isEmpty ||
        selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("⚠️ Semua field wajib diisi"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("✅ Registrasi berhasil!"),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        dateController.text = DateFormat("yyyy-MM-dd").format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Register',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // Nama Lengkap
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                child: CustomTextField(
                  label: 'Nama Lengkap',
                  controller: nameController,
                  isPassword: false,
                  isNumber: false,
                  keyboardType: TextInputType.text,
                  labelColor: Colors.black,
                ),
              ),

              // Email
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                child: CustomTextField(
                  label: 'Email',
                  controller: emailController,
                  isPassword: false,
                  isNumber: false,
                  keyboardType: TextInputType.emailAddress,
                  labelColor: Colors.black,
                ),
              ),

              // Password
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                child: CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  isNumber: false,
                  keyboardType: TextInputType.visiblePassword,
                  labelColor: Colors.black,
                ),
              ),

              // Konfirmasi Password
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                child: CustomTextField(
                  label: 'Confirm Password',
                  controller: confirmPasswordController,
                  isPassword: true,
                  isNumber: false,
                  keyboardType: TextInputType.visiblePassword,
                  labelColor: Colors.black,
                ),
              ),

              // Gender
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                child: DropdownButtonFormField<String>(
                  value: selectedGender,
                  decoration: InputDecoration(
                    labelText: "Jenis Kelamin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: ["Laki-laki", "Perempuan"]
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(() {
                    selectedGender = value;
                  }),
                ),
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                child: TextField(
                  controller: dateController,
                  readOnly: true,
                  onTap: _selectDate,
                  decoration: InputDecoration(
                    labelText: "Tanggal Lahir",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                child: CustomButton(
                  myText: "Daftar",
                  myTextColor: Colors.white,
                  onPressed: () => register(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
