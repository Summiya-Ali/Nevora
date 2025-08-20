import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async'; // Import for using Timer

// The `CongratsScreen` from the previous document, needed for navigation.
class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDD57A), // The background color is a yellowish-orange
      body: SafeArea(
        child: Column(
          children: [
            // Back button
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20), // more margin
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black12, width: 1.5), // thicker grey border
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder( // square with rounded corners
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16), // bigger inner padding
                    minimumSize: const Size(60, 60), // bigger button size
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 24),
                ),
              )


            ),
            const SizedBox(height: 50),
            // Badge image and number
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Using the new Image.asset widget for the badge
                      Image.asset(
                        'assets/images/badge.png',
                        width: 250,
                        height: 250,
                      ),

                    ],
                  ),
                  const SizedBox(height: 30),
                  // Congratulations text
                  const Text(
                    'Congrats!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'You just reached your\nfirst habit goal!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'This badge is a symbol of your commitment to yourself. Keep going and earn more badges along the way.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Claim button
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Claim',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget to draw the badge icon.
// The CustomBadge and CustomBadgePainter classes are no longer needed
// and have been removed as the badge is now an image asset.
//
// class CustomBadge extends StatelessWidget {
// ...
// }
//
// class CustomBadgePainter extends CustomPainter {
// ...
// }

// This is the content for the Explore screen

