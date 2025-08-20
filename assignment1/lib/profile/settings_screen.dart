import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
          toolbarHeight: 60, // smaller overall app bar height
          leadingWidth: 60,  // reduce space for leading widget
          leading: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 28,
                height: 28,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 13),
              ),
            ),
          ),
          title: const Text(
            'Settings',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),


        body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'GENERAL',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildSettingsGroup([
                _buildSettingsItem(
                    title: 'General', icon: Icons.chat, showArrow: true, showSwitch: false),
                _buildSettingsItem(
                    title: 'Dark Mode',
                    icon: Icons.lightbulb_outline,
                    showArrow: false,
                    showSwitch: true,
                    initialSwitchValue: false),
                _buildSettingsItem(
                    title: 'Security', icon: Icons.security, showArrow: true, showSwitch: false),
                _buildSettingsItem(
                    title: 'Notifications',
                    icon: Icons.notifications,
                    showArrow: true,
                    showSwitch: false),
                _buildSettingsItem(
                    title: 'Sounds',
                    icon: Icons.volume_up,
                    showArrow: false,
                    showSwitch: true,
                    initialSwitchValue: true),
                _buildSettingsItem(
                    title: 'Vacation Mode',
                    icon: Icons.play_circle_outline,
                    showArrow: false,
                    showSwitch: true,
                    initialSwitchValue: false),
              ]),
              const SizedBox(height: 20),
              const Text(
                'ABOUT US',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildSettingsGroup([
                _buildSettingsItem(
                    title: 'Rate Routiner', icon: Icons.star_border, showArrow: true, showSwitch: false),
                _buildSettingsItem(
                    title: 'Share with Friends', icon: Icons.share, showArrow: true, showSwitch: false),
                _buildSettingsItem(
                    title: 'About Us', icon: Icons.info_outline, showArrow: true, showSwitch: false),
                _buildSettingsItem(
                    title: 'Support', icon: Icons.chat_bubble_outline, showArrow: true, showSwitch: false),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSettingsItem({
    required String title,
    required IconData icon,
    required bool showArrow,
    required bool showSwitch,
    bool initialSwitchValue = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black54),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          if (showArrow)
            const Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 16),
          if (showSwitch)
            Switch(
              value: initialSwitchValue,
              onChanged: (bool value) {
                // Handle switch toggle
              },
              activeColor: Colors.green,
            ),
        ],
      ),
    );
  }
}