import 'package:flutter/material.dart';
import 'package:latihan_11pplg2/components/custom_textfield.dart';
import 'package:latihan_11pplg2/register_page.dart';
import 'components/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String status = "";

  void login() {
    setState(() {
      if (usernameController.text == "admin" &&
          passwordController.text == "admin") {
        status = "Login Berhasil";
      } else {
        status = "Login Gagal.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Login Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome to our Application',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.orange,
                ),
              ),
              const Text(
                'Please fill username & password below',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Center(child: Image.asset('assets/maduraLogo.png', height: 100)),

              // Username Field
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                child: CustomTextField(
                  label: "Username",
                  controller: usernameController,
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  labelColor: Colors.black,
                  isNumber: false,
                ),
              ),

              // Password Field
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                child: CustomTextField(
                  label: "Password",
                  controller: passwordController,
                  isPassword: true,
                  isNumber: false,
                  keyboardType: TextInputType.text,
                  labelColor: Colors.black,
                ),
              ),

              // Tombol Login
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                child: CustomButton(
                  myText: "Login",
                  myTextColor: Colors.white,
                  onPressed: login,
                ),
              ),

              // Status Text
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  status,
                  style: TextStyle(
                    color: status == "Login Berhasil"
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),

              // Tombol Register
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                child: CustomButton(
                  myText: "Belum punya akun? Register",
                  myTextColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
