import 'package:flutter/material.dart';

class RingsBackground extends StatelessWidget {
  const RingsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Neon blue
      body: Center(
      child: Stack(
      alignment: Alignment.center,
      children: [
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
        // Add more rings as needed
      ],
    ),
    ),
    );
  }
}
