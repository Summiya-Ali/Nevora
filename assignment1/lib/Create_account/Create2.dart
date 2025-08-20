import 'package:assignment1/onboarding/Apppbar.dart';
import 'package:flutter/material.dart';
import 'Cards.dart';
import 'package:google_fonts/google_fonts.dart';
import '../onboarding/Apppbar.dart';
import 'Create1.dart';
import 'Create3.dart';
import '../onboarding/RingsBackground.dart';
class Create2 extends StatelessWidget {
  const Create2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

      appBar: CustomAppBar(
        title: "Create Account",
        onBack: () => Navigator.pop(context),
      ),
      body: Stack(
        children: [
          const RingsBackground(),
          Column(
          children: [
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Choose gender",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
            ),


            SizedBox(height: 6),

            Expanded( // 👈 This is the fix!
              child: InkWell(
                onTap: () {  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Create3()),
                );
              },
                child: Cards(
                  emojiList: ["👨", "👩"],
                  cardText: ["Male", "Female"],
                ),
              ),
            ),
          ],
        ),
        ],
      ),

    ),
    );
  }
}
