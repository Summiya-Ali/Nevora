import 'package:assignment1/onboarding/RingsBackground.dart';
import 'package:flutter/material.dart';
import '../onboarding/Apppbar.dart';

class CreateCustomHabitScreen extends StatefulWidget {
  const CreateCustomHabitScreen({Key? key}) : super(key: key);

  @override
  _CreateCustomHabitScreenState createState() => _CreateCustomHabitScreenState();
}

class _CreateCustomHabitScreenState extends State<CreateCustomHabitScreen> {
  bool _isReminderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the scaffold background to black
      appBar: CustomAppBar(
        title: "Create Custom habit",
        onBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: RingsBackground(),
              ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NAME',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      hintText: 'Walk',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'ICON AND COLOR',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.directions_run, color: Colors.white),
                            SizedBox(width: 8),
                            Text('Walking', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 12,
                            ),
                            SizedBox(width: 8),
                            Text('Orange', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'GOAL',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '1 times\nor more per day',
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              // Handle edit button press
                            },
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white54, height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.refresh, color: Colors.blue),
                              const SizedBox(width: 4),
                              const Text('Daily', style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, color: Colors.white),
                              const SizedBox(width: 4),
                              const Text('Every day', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'REMINDERS',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Remember to set off time for a workout\ntoday.',
                        style: TextStyle(color: Colors.white),
                      ),
                      Switch(
                        value: _isReminderEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            _isReminderEnabled = value;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.schedule, color: Colors.white),
                      SizedBox(width: 8),
                      Text('09:30', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 16),
                      Icon(Icons.calendar_today, color: Colors.white),
                      SizedBox(width: 8),
                      Text('Every day', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle add reminder
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: Text('Add Reminder', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'HABIT TYPE',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text('Build', style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: const Center(
                            child: Text('Quit', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'LOCATION',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle add habit button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: Text('Add Habit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
          ),
        ),
      ),
    );
  }
}