import 'package:flutter/material.dart';
import '../onboarding/CustomList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Habchal extends StatefulWidget {
  const Habchal({super.key});

  @override
  State<Habchal> createState() => _HabchalState();
}

class _HabchalState extends State<Habchal> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Challenges",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("View All",style: TextStyle(fontSize: 16,
                color: Colors.white70,
              ),
              ),

            ],
          ),
        ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 40,),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,),
            ),
      
            child: ListTile(
              leading: Icon(Icons.access_time, ),
              title: Text("Best runner",
                ),
              subtitle: Text("5 days 13 hours left",style: TextStyle(

              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Habits",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("View All",style: TextStyle(fontSize: 16,
                  color: Colors.white70,
                ),
                ),

              ],
            ),
          ),
          // TILE 1: Original UI (plus icon, 2 avatars +3)

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Slidable(

            startActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context)=> print("Drink water item - Add button tapped!"),
                  backgroundColor: Colors.white38,
                  foregroundColor: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.all(0 ),
                  spacing: 1,
                  icon: Icons.remove_red_eye,
                  label: 'View',
                ),
                SlidableAction(
                  onPressed: (context)=> print("Drink water item - Add button tapped!"),
                  backgroundColor: Colors.white38,
                  foregroundColor: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.all(0 ),
                  spacing: 1,
                  icon: Icons.done,
                  label: 'Done',
                ),

              ]

            ),
              // oppsoite slide
              endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                        onPressed: (context)=> print("Drink water item - Add button tapped!"),
                    backgroundColor: Colors.white38,
                      foregroundColor: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      padding: EdgeInsets.all(0 ),
                      spacing: 1,
                    icon: Icons.close,
                    label: 'Fail',

                    ),
                    SlidableAction(
                      onPressed: (context)=> print("Drink water item - Add button tapped!"),
                      backgroundColor: Colors.white38,
                      foregroundColor: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      padding: EdgeInsets.all(0 ),
                      spacing: 1,
                      icon: Icons.navigate_next,
                      label: 'Skip',

                    )

                  ]),
              child: CustomComplexListItem(
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
            ),
          ),

          SizedBox(height: 20),
          // Spacing between items
          // Example 2: New UI (tick icon, 2 avatars, no +X badge)
    Container(
    padding: const EdgeInsets.symmetric(horizontal: 7.0),
    child: Slidable(

    startActionPane: ActionPane(
    motion: ScrollMotion(),
    children: [
    SlidableAction(
    onPressed: (context)=> print("Drink water item - Add button tapped!"),
    backgroundColor: Colors.white38,
    foregroundColor: Colors.blue,
    borderRadius: BorderRadius.circular(10),
    padding: EdgeInsets.all(0 ),
    spacing: 1,
    icon: Icons.remove_red_eye,
    label: 'View',
    ),
    SlidableAction(
    onPressed: (context)=> print("Drink water item - Add button tapped!"),
    backgroundColor: Colors.white38,
    foregroundColor: Colors.green,
    borderRadius: BorderRadius.circular(10),
    padding: EdgeInsets.all(0 ),
    spacing: 1,
    icon: Icons.done,
    label: 'Done',
    ),

    ]

    ),
    // oppsoite slide
    endActionPane: ActionPane(
    motion: ScrollMotion(),
    children: [
    SlidableAction(
    onPressed: (context)=> print("Drink water item - Add button tapped!"),
    backgroundColor: Colors.white38,
    foregroundColor: Colors.red,
    borderRadius: BorderRadius.circular(10),
    padding: EdgeInsets.all(0 ),
    spacing: 1,
    icon: Icons.close,
    label: 'Fail',

    ),
    SlidableAction(
    onPressed: (context)=> print("Drink water item - Add button tapped!"),
    backgroundColor: Colors.white38,
    foregroundColor: Colors.black,
    borderRadius: BorderRadius.circular(10),
    padding: EdgeInsets.all(0 ),
    spacing: 1,
    icon: Icons.navigate_next,
    label: 'Skip',

    )

    ]),
    child: CustomComplexListItem(
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
    )
    ),

          SizedBox(height: 20),
          // Spacing
          // third tile
    Container(
    padding: const EdgeInsets.symmetric(horizontal: 7.0),
    child: Slidable(

    startActionPane: ActionPane(
    motion: ScrollMotion(),
    children: [
    SlidableAction(
    onPressed: (context)=> print("Drink water item - Add button tapped!"),
    backgroundColor: Colors.white38,
    foregroundColor: Colors.blue,
    borderRadius: BorderRadius.circular(10),
    padding: EdgeInsets.all(0 ),
    spacing: 1,
    icon: Icons.remove_red_eye,
    label: 'View',
    ),
    SlidableAction(
    onPressed: (context)=> print("Drink water item - Add button tapped!"),
    backgroundColor: Colors.white38,
    foregroundColor: Colors.green,
    borderRadius: BorderRadius.circular(10),
    padding: EdgeInsets.all(0 ),
    spacing: 1,
    icon: Icons.done,
    label: 'Done',
    ),

    ]

    ),
    // oppsoite slide
    endActionPane: ActionPane(
    motion: ScrollMotion(),
    children: [
    SlidableAction(
    onPressed: (context)=> print("Drink water item - Add button tapped!"),
    backgroundColor: Colors.white38,
    foregroundColor: Colors.red,
    borderRadius: BorderRadius.circular(10),
    padding: EdgeInsets.all(0 ),
    spacing: 1,
    icon: Icons.close,
    label: 'Fail',

    ),
    SlidableAction(
    onPressed: (context)=> print("Drink water item - Add button tapped!"),
    backgroundColor: Colors.white38,
    foregroundColor: Colors.black,
    borderRadius: BorderRadius.circular(10),
    padding: EdgeInsets.all(0 ),
    spacing: 1,
    icon: Icons.navigate_next,
    label: 'Skip',

    )

    ]),
        child:   CustomComplexListItem(
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
    )
    ),
        ],
      ),
    );
  }
}
