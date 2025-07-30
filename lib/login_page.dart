import 'package:flutter/material.dart';
import 'package:latihan_11pplg2/register_page.dart';
import 'components/text_field.dart';

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
              Image.asset('assets/maduraLogo.png', height: 100),
              const SizedBox(height: 24),
              InputField(label: "Username", controller: usernameController),
              InputField(
                label: "Password",
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: login, child: const Text("Login")),
              const SizedBox(height: 10),
              Text(status),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
