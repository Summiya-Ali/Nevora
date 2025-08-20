// pfscreen1.dart

import 'package:assignment1/profile/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assignment1/Main_app/NavBar.dart'; // Make sure this path is correct
import 'package:assignment1/Main_app/Screen1.dart'; // Make sure this path is correct
import 'package:assignment1/Explore/ExploreScreen.dart'; // Make sure this path is correct
import 'package:assignment1/Main_app/Screen3.dart'; // Make sure this path is correct
import 'package:assignment1/Activity/activity_screen.dart'; // Make sure this path is correct
import 'package:assignment1/profile/pfscreen1.dart'; // Make sure this path is correct

class Pfscreen1 extends StatefulWidget {
  const Pfscreen1({super.key});

  @override
  State<Pfscreen1> createState() => _Pfscreen1State();
}

class _Pfscreen1State extends State<Pfscreen1> {
  String _selectedTab = 'Activity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //backgroundColor: Colors.black,
      body: Column(
        children: [
          _buildProfileAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    if (_selectedTab == 'Activity') _buildActivityContent(),
                    if (_selectedTab == 'Friends') _buildFriendsContent(),
                    if (_selectedTab == 'Achievements') _buildAchievementsContent(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileAppBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // rounded corners
                  ),
                  side: const BorderSide(color: Colors.black), // grey border
                  padding: const EdgeInsets.all(3), // space around the icon
                ),
                onPressed: (
                    ) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                  );
                },
                child: const Icon(
                  Icons.settings,
                  color: Colors.black, // black icon
                ),
              )

            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage('https://plus.unsplash.com/premium_photo-1669704098858-8cd103f4ac2e?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'JTS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.monetization_on, color: Color(0xFFEDC967), size: 16),
                        SizedBox(width: 4),
                        Text(
                          '1452 Points',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildTab('Activity'),
              const SizedBox(width: 10),
              _buildTab('Friends'),
              const SizedBox(width: 10),
              _buildTab('Achievements'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title) {
    bool isSelected = _selectedTab == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = title;
          });
        },
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey.shade200 : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityContent() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Showing last month activity',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // rounded corners
                ),
                side: const BorderSide(color: Colors.grey), // grey border
                padding: const EdgeInsets.all(3), // space around the icon
              ),
              onPressed: () {},
              child: const Icon(
                Icons.sort,
                color: Colors.white, // black icon
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        _buildActivityList(),
      ],
    );
  }


  Widget _buildFriendsContent() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '261 Friends',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 38, // square size
                  height: 38,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // rounded corners
                      ),
                      side: const BorderSide(color: Colors.grey), // grey border
                      padding: EdgeInsets.zero, // so the icon stays centered
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.add,
                      color: Colors.white, // black icon
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 38, // square size
                  height: 38,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // rounded corners
                      ),
                      side: const BorderSide(color: Colors.grey), // grey border
                      padding: EdgeInsets.zero, // so the icon stays centered
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white, // black icon
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildFriendsList(),
      ],
    );
  }

  Widget _buildAchievementsContent() {
    return Column(

      children: [
        SizedBox(height: 10),
        _buildAchievementCard(
          title: 'Best Runner!',
          subtitle: '1 months ago',
          icon: Icons.directions_run,
          iconColor: Colors.blue,
        ),
        _buildAchievementCard(
          title: 'Best of the month!',
          subtitle: '2 days ago',
          icon: Icons.emoji_events,
          iconColor: Colors.orange,
        ),
    ]
    );
  }

  Widget _buildAchievementCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



  Widget _buildActivityList() {
    return Column(
      children: [
        _buildActivityCard(
          title: '112 points earned!',
          subtitle: 'Today, 12:34 PM',
          icon: Icons.arrow_upward,
          iconColor: Colors.green,
          cardColor: Colors.grey.shade200,
        ),
        _buildActivityCard(
          title: '62 points earned!',
          subtitle: 'Today, 07:12 AM',
          icon: Icons.arrow_upward,
          iconColor: Colors.green,
          cardColor: Colors.grey.shade200,
        ),
        _buildActivityCard(
          title: 'Challenge completed!',
          subtitle: 'Yesterday, 14:12 PM',
          icon: Icons.emoji_events,
          iconColor: Colors.orange,
          cardColor: Colors.grey.shade200,
        ),
        _buildActivityCard(
          title: 'Weekly winning streak is broken!',
          subtitle: '12 Jun, 16:14 PM',
          icon: Icons.arrow_downward,
          iconColor: Colors.red,
          cardColor: Colors.grey.shade200,
        ),
        _buildActivityCard(
          title: '96 points earned!',
          subtitle: '11 Jun, 17:45 PM',
          icon: Icons.arrow_upward,
          iconColor: Colors.green,
          cardColor: Colors.grey.shade200,
        ),
        _buildActivityCard(
          title: '110 points earned!',
          subtitle: '10 Jun, 18:32 PM',
          icon: Icons.arrow_upward,
          iconColor: Colors.green,
          cardColor: Colors.grey.shade200,
        ),
      ],
    );
  }

  Widget _buildFriendsList() {
    List<Map<String, dynamic>> friendsData = [
      {'name': 'Sharie Bento', 'points': 912, 'image': 'https://plus.unsplash.com/premium_photo-1690579805307-7ec030c75543?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'name': 'Micah Dantoni', 'points': 912, 'image': 'https://plus.unsplash.com/premium_photo-1664879730638-0a5e94ae73fd?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'name': 'Oral Padlio', 'points': 912, 'image': 'https://plus.unsplash.com/premium_photo-1674777843190-6f060a67db98?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'name': 'Regina Stire', 'points': 912, 'image': 'https://plus.unsplash.com/premium_photo-1727976369428-435ad5e458c5?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'name': 'Maressa Mcdiarmid', 'points': 912, 'image': 'https://plus.unsplash.com/premium_photo-1705423486149-bd7307560478?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHx8'},
      {'name': 'Jennings Stohler', 'points': 912, 'image': 'https://plus.unsplash.com/premium_photo-1727976369557-93c748371ea2?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    ];

    return Column(
      children: friendsData.map((friend) {
        return _buildFriendCard(
          name: friend['name'],
          points: friend['points'],
          image: friend['image'],
        );
      }).toList(),
    );
  }

  Widget _buildActivityCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color cardColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendCard({
    required String name,
    required int points,
    required String image,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(image),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$points Points',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 38, // square size
            height: 38,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // rounded corners
                ),
                side: const BorderSide(color: Colors.grey), // grey border
                padding: EdgeInsets.zero, // so the icon stays centered
              ),
              onPressed: () {},
              child: const Icon(
                Icons.delete,
                color: Colors.grey, // black icon
              ),
            ),
          )

        ],
      ),
    );
  }


}

