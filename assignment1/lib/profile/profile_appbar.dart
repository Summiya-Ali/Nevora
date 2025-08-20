// profile_appbar.dart

import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  final Function(String) onTabSelected;
  final String selectedTab;

  const ProfileAppBar({
    super.key,
    required this.onTabSelected,
    required this.selectedTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
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
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.black, size: 28),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage('https://plus.unsplash.com/premium_photo-1664474697787-8c4644a8677c?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mert Kahveci',
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
              _buildTab(context, 'Activity'),
              const SizedBox(width: 10),
              _buildTab(context, 'Friends'),
              const SizedBox(width: 10),
              _buildTab(context, 'Achievements'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, String title) {
    bool isSelected = selectedTab == title;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabSelected(title),
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
              color: isSelected ? Colors.blue.shade900 : Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}