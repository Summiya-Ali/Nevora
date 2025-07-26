import 'package:flutter/material.dart';
import 'Onboarding1.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;





  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd : (details){
        if(details.primaryVelocity! < 0){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Onboarding1()),
          );
        }
      },
      child: Scaffold(
         // Neon blue
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer faded ring
              Container(
                width: 425,
                height: 425,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.03), width: 1),
                ),
              ),
              // Middle ring
              Container(
                width: 313,
                height: 313,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.05), width: 2),
                ),
              ),
              // Inner ring
              Container(
                width: 235,
                height: 235,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.07), width: 2.5),
                ),
              ),
              // Center text
              Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.1), width: 2.5),
                ),
              ),
              const Text(
                "Habits",
                style: TextStyle(
                  fontSize: 46,
                  fontWeight: FontWeight.bold,

                  letterSpacing: 4,
                  shadows: [
                    Shadow(
                      blurRadius: 12,
                      color: Colors.white70,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}