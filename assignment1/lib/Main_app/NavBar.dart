import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatefulWidget {
  final int selectedIndex; // <--- Add this line
  final Function(int) onIconTapped;
  final VoidCallback onAddButtonPressed;
  final bool isDialogsShowing;

  const Navbar({
    super.key,
    required this.selectedIndex, // <--- Add 'required' for selectedIndex
    required this.onIconTapped,
    required this.onAddButtonPressed,
    this.isDialogsShowing = false,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 260,
              height: 50,

              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Home icon
                  InkWell(
                    onTap: () => widget.onIconTapped(0),
                    child: Icon(Icons.house, size: 25, color: widget.selectedIndex == 0 ? Colors.black : Colors.grey),
                  ),
                  const SizedBox(width: 15),
                  // Compass icon (Explore)
                  InkWell(
                    onTap: () => widget.onIconTapped(1),
                    child: Icon(FontAwesomeIcons.compass, size: 25, color: widget.selectedIndex == 1 ? Colors.black : Colors.grey),
                  ),
                  const SizedBox(width: 15),
                  // Center plus/cross button
                  Container(
                    width: 44,
                    height: 44,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton(
                      onPressed: widget.onAddButtonPressed,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.yellow.shade600,
                        elevation: 2,
                      ),
                      child: Icon(
                        widget.isDialogsShowing ? Icons.close : Icons.add,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Medal icon
                  InkWell(
                    onTap: () => widget.onIconTapped(3),
                    child: FaIcon(FontAwesomeIcons.medal, size: 25, color: widget.selectedIndex == 3 ? Colors.black : Colors.grey),
                  ),
                  const SizedBox(width: 15),
                  // Person icon
                  InkWell(
                    onTap: () => widget.onIconTapped(4),
                    child: Icon(Icons.person, size: 25, color: widget.selectedIndex == 4 ? Colors.black : Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}