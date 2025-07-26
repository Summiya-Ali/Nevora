import 'package:flutter/material.dart';
import 'RingsBackground.dart';
import 'Onboarding2.dart';
import 'Polygon.dart';
class Onboarding1 extends StatefulWidget {
  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd : (details){
        if(details.primaryVelocity! < 0){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Onboarding2()),
          );
    }
      },
      child: SafeArea(
        bottom: true,
        child: Scaffold(
          body: Stack(
            children: [
              const RingsBackground(),
              const Polygon(),
              Column(
                children: [

                  // TOP FLEXIBLE IMAGE STACK
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        // 1st Circular Placeholder
                        Positioned(
                          top: 30,
                          left: 200,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.amber.withOpacity(0.4), // Light glow
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 35,
                          left: 284,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1694878981888-7a526050b455?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

                            ),
                          ),
                        ),

                        Positioned(
                          top: 220,
                          right: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.amber.withOpacity(0.4), // Soft glow
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1667857481427-382ee0b5207e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D',
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 200,
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
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.amber.withOpacity(0.4), // Soft amber glow
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              ),
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
                      child: Column(
                        children : [
                          SizedBox(height: 24),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 21.0),

                              child: Text(
                                "Create",
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
                                "Your Habits. ",
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
                                "Change your life by slowly adding new healthy habits and.\nsticking to them.",

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
                                  buildDot(isActive: true),
                                  buildDot(isActive: false),
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
                  ),
                ],
              ),
            ],
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
          children: [
            Icon(iconData, size: 14),
            Text(label, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
