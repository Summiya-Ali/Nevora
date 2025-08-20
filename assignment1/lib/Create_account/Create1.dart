import 'package:assignment1/onboarding/RingsBackground.dart';
import 'package:flutter/material.dart';
import '../onboarding/Apppbar.dart';
import '../onboarding/Onboarding4.dart';
import 'Create2.dart';
import '../onboarding/RingsBackground.dart';
class Create1 extends StatefulWidget {
  const Create1({super.key});

  @override
  State<Create1> createState() => _Create1State();
}


class _Create1State extends State<Create1> {
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

      child: Scaffold(
        backgroundColor: Colors.transparent,
        //  backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Create Account",
          onBack: () => Navigator.pop(context),
        ),
          body: Stack(
              children: [
          const Positioned.fill(
              child: RingsBackground()
          ),

      Padding(
        padding: const EdgeInsets.all(24.0),
              child:
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
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
                        child: const Icon(Icons.close, size: 22,color: Colors.black),
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
                  onChanged: (_) => setState(() {}), // Refresh suffix icon
                ),

                const SizedBox(height: 24),
                const Text(
                  "Surname",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: passwordController,

                  decoration: InputDecoration(
                    hintText: "Enter your surname",
                    suffixIcon: passwordController.text.isNotEmpty
                        ? GestureDetector(
                      onTap: () => setState(() => passwordController.clear()),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: const Icon(Icons.close, size: 22,color: Colors.black),
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

                // Align to left

                const Text(
                  "BirthDate",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "mm/dd/yyy",
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
                        child: const Icon(Icons.close, size: 22,color: Colors.black),
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
                  keyboardType: TextInputType.datetime,
                  onChanged: (_) => setState(() {}), // Refresh suffix icon
                ),
                const SizedBox(height: 12),
                const Spacer(),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                      // Swipe Left → Go forward to Create1
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Create2()),
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
        )
    );

















  }
}
