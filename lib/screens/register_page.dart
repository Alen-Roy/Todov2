import 'package:flutter/material.dart';
import 'package:to_do/screens/home_page.dart';
import 'package:to_do/screens/login_page.dart';
import 'package:to_do/widgets/custome_button.dart';
import 'package:to_do/widgets/custome_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailControler = TextEditingController();
    final TextEditingController passwordContrller = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 15,
          bottom: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "RegisterScreen",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(height: 100),
            customTextField(hint: "Name", controller: nameController),
            customTextField(
              hint: "Enter Your Email",
              controller: emailControler,
            ),
            customTextField(
              hint: "Enter Your Password",
              controller: passwordContrller,
            ),
            customeButton(
              ontap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              text: 'Register',
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },

              child: RichText(
                text: TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(color: Colors.white70),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
