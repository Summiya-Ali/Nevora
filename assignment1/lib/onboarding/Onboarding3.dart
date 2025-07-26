import 'package:flutter/material.dart';
import 'custom_avatar_curve.dart';
import 'bottom_section.dart';
import 'Onboarding2.dart';
import 'RingsBackground.dart';
import 'Polygon.dart';
import 'Onboarding4.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Or your custom bg
      body: SafeArea(
        child: GestureDetector( onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            // Left swipe → go to Placeholder screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Onboarding4()),
            );
          } else if (details.primaryVelocity! > 0) {
            // Right swipe → go back to Onboarding1
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Onboarding2()),
            );
          }
        },

          child: Stack(
            children: [

              const RingsBackground(),
              const SizedBox(height: 10),

              const Polygon(),
              const SizedBox(height: 10),
              // 🔵 Top custom curved avatars section
              Positioned(
                top: 120,            // push it down by 80px from the top
                left: 0,
                right: 0,
                child: const AvatarWaveSection(),
              ),


              //const SizedBox(height: 10),

              // 🟡 Other elements below
              Positioned(
                bottom: 25,
                left: 0,
                right: 0,
                child: BottomSection(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
