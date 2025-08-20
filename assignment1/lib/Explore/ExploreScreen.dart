import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async'; // Import for using Timer
import 'success_screen.dart';
import '../onboarding/RingsBackground.dart';

// The `CongratsScreen` from the previous document, needed for navigation.

// This is the content for the Explore screen
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // A Timer to handle the 6-second delay
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 10), () {
      // Navigate to the CongratsScreen after 6 seconds
      if (mounted) { // Check if the widget is still in the tree
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CongratsScreen()),

        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // --- Helper Methods to build sections ---

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            // Handle "VIEW ALL" button press
          },
          child: const Text(
            'VIEW ALL',
            style: TextStyle(color: Colors.white54),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestedHabits() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildHabitCard(
            emoji: '🏃‍♂️',
            title: 'Walk',
            subtitle: '10 km',
            cardColor: const Color(0xFFEDC967),
          ),
          _buildHabitCard(
            emoji: '🏊‍♀️',
            title: 'Swim',
            subtitle: '30 min',
            cardColor: const Color(0xFFEDC967),
          ),
          _buildHabitCard(
            emoji: '📚',
            title: 'Read',
            subtitle: '20 min',
            cardColor: const Color(0xFFEDC967),
          ),
        ],
      ),
    );
  }

  Widget _buildHabitClubs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildClubCard(
            emoji: '🐱',
            title: 'Cat Lovers',
            members: '462 members',
            cardColor: Colors.pink.shade100.withOpacity(0.7),
          ),
          _buildClubCard(
            emoji: '🕌',
            title: 'Istanbul',
            members: '+500 members',
            cardColor: Colors.blue.shade100.withOpacity(0.7),
          ),
          _buildClubCard(
            emoji: '🏃‍♀️',
            title: 'Runners',
            members: '336 members',
            cardColor: Colors.green.shade100.withOpacity(0.7),
          ),
        ],
      ),
    );
  }

  Widget _buildChallenges() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildChallengeCard(
            title: 'Best Runners!',
            members: '2 friends joined',
            cardColor: Colors.grey,
          ),
          _buildChallengeCard(
            title: 'Best Bikers!',
            members: '1 friends joined',
            cardColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildLearningCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildLearningCard(
            title: 'Why should we drink water often?',
            imagePath: 'https://plus.unsplash.com/premium_photo-1661780086689-279235e482da?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          _buildLearningCard(
            title: 'Benefits of regular walking',
            imagePath: 'https://plus.unsplash.com/premium_photo-1713184149472-4a880dc6981c?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
        ],
      ),
    );
  }

  // --- Reusable Card Widgets ---

  Widget _buildHabitCard({required String emoji, required String title, required String subtitle, required Color cardColor}) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildClubCard({required String emoji, required String title, required String members, required Color cardColor}) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text(members, style: const TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }

  Widget _buildChallengeCard({required String title, required String members, required Color cardColor}) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('⏱️', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
              const Text('5 days 13 hours left', style: TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 64, // slightly bigger than radius * 2
                child: Stack(
                  children: [
                    const Positioned(
                      left: 0,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1713392899774-5f1c261c4a77?q=80&w=687&auto=format&fit=crop',
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 16, // overlap amount
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1669704099119-7fcaaf77f2e8?q=80&w=688&auto=format&fit=crop',
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 32,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1669704098858-8cd103f4ac2e?q=80&w=688&auto=format&fit=crop',
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(width: 8),
              Text(members, style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLearningCard({required String title, required String imagePath}) {
    return Container(
      width: 200,
      height: 150,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDD57A),
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imagePath), // Use NetworkImage for URL images
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('💡', style: TextStyle(fontSize: 24)),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set the background to black
      body: Stack(
        children: [
          const RingsBackground(), // Add the RingsBackground widget
          Column(
          children: [
            // App Bar Section with off-white background
            Container(
              color: Colors.grey.shade200, // Off-white color for the app bar
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0), // Adjust padding for a cleaner look
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey), // grey outline
                      shape: const CircleBorder(), // keeps it circular like IconButton
                      padding: const EdgeInsets.all(8), // same inner spacing
                    ),
                    onPressed: () {
                      // Handle search
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  )

                ],
              ),
            ),
            // Main content with black background
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Suggested for You Section
                      _buildSectionHeader('Suggested for You'),
                      const SizedBox(height: 12),
                      _buildSuggestedHabits(),
                      const SizedBox(height: 24),

                      // Habit Clubs Section
                      _buildSectionHeader('Habit Clubs'),
                      const SizedBox(height: 12),
                      _buildHabitClubs(),
                      const SizedBox(height: 24),



                      // Learning Section
                      _buildSectionHeader('Learning'),
                      const SizedBox(height: 12),
                      _buildLearningCards(),
                      const SizedBox(height: 24),

                      // Challenges Section
                      _buildSectionHeader('Challenges'),
                      const SizedBox(height: 12),
                      _buildChallenges(),
                      const SizedBox(height: 100),// Add padding for Navbar
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    ],
      ),
    );
  }
}
