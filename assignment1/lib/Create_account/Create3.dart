import 'package:assignment1/onboarding/RingsBackground.dart';
import 'package:flutter/material.dart';
import '../onboarding/Apppbar.dart';
import 'Cards.dart';
import 'Create2.dart';
import '../Main_app/Screen1.dart';
import '../onboarding/RingsBackground.dart';

class Create3 extends StatefulWidget {
  const Create3({super.key});

  @override
  State<Create3> createState() => _Create3State();
}

class _Create3State extends State<Create3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! > 0) {
            // Swipe Right → Go back to Onboarding3
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Create2()),
            );
          } else if (details.primaryVelocity! < 0) {
            // Swipe Left → Go forward to Create1
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Screen1()),
            );
          }
        }
      },
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
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Choose habits",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Change whenever neccessary",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              SizedBox(height: 6),

              Expanded( // 👈 This is the fix!
                child: InkWell(
                  onTap: () {  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Screen1()),
                  );
                  },
                  child: Cards(
                    emojiList: ["💧", "🏃‍♂️", "📚", "🧘‍♀️", "📖", "📓", "🌱", "😴"],
                    cardText: ["Drink water", "Run","Read Books","Meditate","Study","Journal","Plantation","Sleep"],
                  ),
                ),
              ),
            ],
          ),
      ],
        ),

      ),
    ),
    );
  }
}
