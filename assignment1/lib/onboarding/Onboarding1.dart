import 'package:flutter/material.dart';
import 'RingsBackground.dart';

class Onboarding1 extends StatefulWidget {
  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        body: Stack(
          children: [
            const RingsBackground(),
            Column(
              children: [
                // TOP FLEXIBLE IMAGE STACK
                Expanded(
                  flex: 6,
                  child: Stack(
                    children: [
                      // 1st Circular Placeholder
                      Positioned(
                        top: 70,
                        left: 70,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            'https://plus.unsplash.com/premium_photo-1739201499625-bf074c38221d?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

                          ),
                        ),
                      ),
                      Positioned(
                        top: 85,
                        left: 150,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1694878981888-7a526050b455?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

                          ),
                        ),
                      ),

                      // 2nd Circular Placeholder
                      Positioned(
                        top: 100,
                        right: 50,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1634926878768-2a5b3c42f139?q=80&w=756&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        right: 40,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1694878981888-7a526050b455?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

                          ),
                        ),
                      ),

                      // 3rd Circular Placeholder
                      Positioned(
                        bottom: 30,
                        left: 120,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(
                            'https://plus.unsplash.com/premium_photo-1739206781762-6b28bac44141?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 89,
                        left: 180,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1694878981888-7a526050b455?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // BOTTOM SECTION
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Create ",
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
                            "Your Habits. ",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 14), // Or any value like 8, 24 etc.
                        // PAGE INDICATOR
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildDot(isActive: true),
                              buildDot(isActive: false),
                              buildDot(isActive: false),
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper: Dot for page indicator
  Widget buildDot({required bool isActive}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFEDC967) : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  // Updated: Now using built-in Flutter Icons instead of assets
  Widget customSocialButton(String label, IconData iconData) {
    return SizedBox(
      width: 130,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Icon(iconData, size: 14),
            Text(label, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
