import 'package:flutter/material.dart';
import 'package:to_do/screens/home_page.dart';
import 'package:to_do/screens/register_page.dart';
import 'package:to_do/widgets/custome_button.dart';
import 'package:to_do/widgets/custome_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailControler = TextEditingController();
    final TextEditingController passwordContrller = TextEditingController();
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
              "LoginScreen",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(height: 100),
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
              text: 'Login',
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },

              child: RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(color: Colors.white70),
                  children: [
                    TextSpan(
                      text: "register",
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
