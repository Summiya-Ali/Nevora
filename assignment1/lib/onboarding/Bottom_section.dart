import 'package:flutter/material.dart';

class BottomSection extends StatefulWidget {
  const BottomSection({super.key});

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ← important
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Stay Together ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //ur habits text
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "And Strong. ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 14),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(
                  "Find friends to discuss common topics Discuss.\ncommon topics together.",

                  style: TextStyle(
                    fontSize: 12,

                  ),
                ),
              ),
            ),
            SizedBox(height: 14), // Or any value like 8, 24 etc.
            // PAGE INDICATOR
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildDot(isActive: false),
                  buildDot(isActive: false),
                  buildDot(isActive: true),
                ],
              ),
            ),
            SizedBox(height: 14), // Or any value like 8, 24 etc.
            // CONTINUE WITH EMAIL BUTTON
            ElevatedButton.icon(
              icon: Icon(Icons.email),
              label: Text("Continue with Email"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 14), // Or any value like 8, 24 etc.
            // SOCIAL LOGIN BUTTONS with fallback icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customSocialButton(" Google", Icons.g_mobiledata),
                customSocialButton(" Facebook", Icons.facebook),
                customSocialButton(
                  " Twitter",
                  Icons.alternate_email,
                ),
              ],
            ),
          ],
        ),
      );

  }


  Widget buildDot({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFEDC967) : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget customSocialButton(String label, IconData iconData) {
    return SizedBox(
      width: 110,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 14),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
