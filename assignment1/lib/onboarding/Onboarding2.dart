import 'package:flutter/material.dart';
import 'Onboarding1.dart';
import 'RingsBackground.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'CustomList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Onboarding3.dart';
class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

//List icons =
//
//

class _Onboarding2State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            // Left swipe → go to Placeholder screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Onboarding3()),
            );
          } else if (details.primaryVelocity! > 0) {
            // Right swipe → go back to Onboarding1
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Onboarding1()),
            );
          }
        },
        child: Scaffold(
          body: Center(
            //stack to add rings background, dots background
            child: Stack(
              children: [
                const RingsBackground(),

                //main ortion
                Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(height: 6),
                          Text("Challenges",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                          SizedBox(height: 10),

                          //first listtile
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 40,),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,),
                            ),

                            child: ListTile(
                              leading: Icon(Icons.access_time),
                              title: Text("Best runner",
                                style: TextStyle(
                                  color: Color(0xFFEDC967),
                              ),),
                              subtitle: Text("5 days 13 hours left"),
                            ),
                          ),

                          SizedBox(height: 10),
                          Text("Habits",
                            style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 10),

                          // TILE 1: Original UI (plus icon, 2 avatars +3)
                          CustomComplexListItem(
                            progressPercent: 0.25,
                            leadingIcon: FontAwesomeIcons.droplet,
                            title: "Drink the water",
                            subtitle: "500/2000 ML",
                            imageUrls: const [
                              'https://images.unsplash.com/photo-1667857481427-382ee0b5207e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D',
                              'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ],
                            additionalUsersCount: 3,
                            trailingIcon: Icons.add,
                            // Plus icon
                            onTrailingButtonPressed: () {
                              print("Drink water item - Add button tapped!");
                            },
                          ),

                          SizedBox(height: 20),
                          // Spacing between items
                          // Example 2: New UI (tick icon, 2 avatars, no +X badge)
                          CustomComplexListItem(
                            progressPercent: 0.80,
                            // Different progress
                            leadingIcon: FontAwesomeIcons.personWalking,
                            // Different leading icon
                            title: "Walk",
                            subtitle: "2.5 / 3 KM",
                            imageUrls: const [
                              'https://plus.unsplash.com/premium_photo-1663099868219-51301da86d34?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              // New avatars
                              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ],
                            additionalUsersCount: 0,
                            // No "+X" badge
                            trailingIcon: Icons.add,
                            // Tick icon
                            onTrailingButtonPressed: () {
                              print("Daily run item - Tick button tapped!");
                            },
                          ),

                          SizedBox(height: 20),
                          // Spacing
                          // third tile
                          CustomComplexListItem(
                            progressPercent: 0.50,
                            leadingIcon: MdiIcons.meditation,

                            title: "Meditate",
                            subtitle: "30/30 chapters",
                            imageUrls: const [
                              'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              // Only one avatar
                            ],
                            additionalUsersCount: 0,
                            trailingIcon: Icons.check,
                            // Different trailing icon
                            onTrailingButtonPressed: () {
                              print("Read chapter item - Arrow button tapped!");
                            },
                          ),



                        ],
                      ),
                    ),

                Expanded(
                    flex: 4,
                    child: Column(
                      children : [
                        SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 21.0),

                          child: Text(
                            "Track",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 21.0),

                            child: Text(
                              "Your Progress. ",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                        ),
                        SizedBox(height: 9),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 21.0),
                            child: Text(
                              "Everyday you become one step closer to your goals.\nDont give up.",

                              style: TextStyle(
                                fontSize: 12,

                              ),
                            ),
                          ),
                        ),
                      SizedBox(height: 17), // Or any value like 8, 24 etc.
                      // PAGE INDICATOR
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 21.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildDot(isActive: false),
                              buildDot(isActive: true),
                              buildDot(isActive: false),
                            ],
                          ),
                        ),
                      ),

                        SizedBox(height: 20),
                        // CONTINUE WITH EMAIL BUTTON
                        SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.email),
                            label: Text("Continue with Email"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(height: 19), // Or any value like 8, 24 etc.
                        // SOCIAL LOGIN BUTTONS with fallback icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                )
                )
                  ],
                ),
              ],
            ),
          ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(iconData, size: 14),
            Text(label, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}


