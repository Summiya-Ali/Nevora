import 'package:flutter/material.dart';
import '../onboarding/CustomList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'NavBar.dart';
class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<String> imageUrls = ['https://images.unsplash.com/photo-1667857481427-382ee0b5207e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D',
    'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1663099868219-51301da86d34?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // New avatars
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',];
   int additionalUsersCount = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //////////////// bottomNavigationBar: Navbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //BUTTONs AT TOP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        
                  //button 1
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white24,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey),
                        ),
                        padding: EdgeInsets.zero, // 👈 remove internal padding
                        minimumSize: Size(48, 48),
        
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_outlined)),
                  //button 2
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white24,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey),
                        ),
                        padding: EdgeInsets.zero, // 👈 remove internal padding
                        minimumSize: Size(48, 48),
        
                      ),
                      onPressed: () {},
                      child: Icon(Icons.add)),
                ],
        
              ),
        
              SizedBox(height: 37),
        // 3 TEXTS
              Text("🏃🏻‍♂️",
              style: TextStyle(
                fontSize: 35,
        
              ),),
              SizedBox(height: 20),
              Text("Best Runners!",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20),
              Text("May 28 to 4 June"),
              SizedBox(height: 25),
        
              // AVATARS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Loop through exactly 5 avatars and overlap them
                  for (int i = 0; i < imageUrls.length && i < 5; i++)
                    Transform.translate(
                      offset: Offset(-8.0 * i, 0),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(imageUrls[i]),
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
        
                  // Show "+X" users badge *after* the last avatar
                  if (additionalUsersCount > 0)
                    Transform.translate(
                      offset: Offset(-8.0 * imageUrls.length, 0), // Shift left after 5 avatars
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            "+$additionalUsersCount",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),
        // qoute
              SizedBox(height: 20),
              Text( "A genius is a man who can do the average thing\n"
                  "when everyone else around him\n"
                  "is losing his mind.",
                textAlign: TextAlign.center,),
              SizedBox(height: 25),
        
              // Elevated button
              ElevatedButton(
                onPressed: () {},
        
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(400, 50),
                  backgroundColor: Colors.white,         // Background color
                  foregroundColor: Colors.black, // Text/icon color
                  elevation: 3,                         // Shadow depth
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 18),      // Padding inside the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
                child: Text("Join the challenge",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 20),
        
              Padding(
                padding: const EdgeInsets.only(left:30.0),
                child: Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Tasks",
                    style: TextStyle(
                      fontSize: 16,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
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
              )
        
        
            ],
          ),
        ),
      ),
    );
  }
}
