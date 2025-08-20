import 'package:flutter/material.dart';
import 'Apppbar.dart';
import 'Onboarding3.dart'; // 👈 import these two
import '../Create_account/Create1.dart';
import 'RingsBackground.dart';
class Onboarding4 extends StatefulWidget {
  const Onboarding4({super.key});

  @override
  State<Onboarding4> createState() => _Onboarding4State();
}

class _Onboarding4State extends State<Onboarding4> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child:

        Scaffold(
          appBar: CustomAppBar(
            title: "Create Account",
            onBack: () => Navigator.pop(context),
          ),
          body: Stack(
            children: [

            const RingsBackground(),Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    suffixIcon: emailController.text.isNotEmpty
                        ? GestureDetector(
                      onTap: () {
                        emailController.clear();
                        setState(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close, size: 22, color: Colors.black),
                      ),
                    )
                        : null,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEDC967)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    suffixIcon: passwordController.text.isNotEmpty
                        ? GestureDetector(
                      onTap: () => setState(() => passwordController.clear()),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: const Icon(Icons.close, size: 22, color: Colors.black),
                      ),
                    )
                        : null,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEDC967)),
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: const Text("I forgot my password"),
                ),
                const Spacer(),
                Center(
                  child: Text(
                    "Don't have an account? Let's create one!",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (

                        ) {
                      // Swipe Left → Go forward to Create1
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Create1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
            ],
        ),

      ),
    );
  }
}
