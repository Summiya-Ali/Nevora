import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Ensure this dependency is added

class CustomComplexListItem extends StatelessWidget {
  // 1. Properties (Arguments) for customization
  final double progressPercent;
  final IconData leadingIcon;
  final String title;
  final String subtitle;
  final List<String> imageUrls; // List of avatar image URLs
  final int additionalUsersCount; // For the "+X" badge
  final IconData trailingIcon; // For the icon in the trailing button
  final VoidCallback? onTrailingButtonPressed; // Callback for the trailing button

  // 2. Constructor to accept these arguments
  const CustomComplexListItem({
    Key? key,
    required this.progressPercent,
    required this.leadingIcon,

    required this.title,
    required this.subtitle,
    required this.imageUrls,
    this.additionalUsersCount = 0, // Default to 0 if not provided
    required this.trailingIcon,
    this.onTrailingButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 40),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            // Leading Circular Progress Indicator
            CircularPercentIndicator(
              radius: 20.0,
              lineWidth: 2.0,
              percent: progressPercent, // Use argument
              center: IconTheme(
                data: IconThemeData(color: null), // null = let system decide
                child: Icon(leadingIcon, size: 16),
              ),

// Use argument
              progressColor: Colors.black,
              backgroundColor: Colors.grey.shade500,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            SizedBox(width: 16.0),

            // Title and Subtitle Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title, // Use argument
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle, // Use argument
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),

            // User Avatars Stack
            // Dynamically show avatars based on imageUrls list
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Display first avatar if available
                if (imageUrls.isNotEmpty)
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(imageUrls[0]),
                    backgroundColor: Colors.grey.shade200,
                  ),
                // Display second avatar with overlap if available
                if (imageUrls.length > 1)
                  Transform.translate(
                    offset: Offset(-8, 0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(imageUrls[1]),
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                // Display the "+X" badge if there are additional users
                if (additionalUsersCount > 0)
                  Transform.translate(
                    // Adjust offset based on how many direct avatars are shown
                    offset: Offset(-(imageUrls.length > 0 ? (imageUrls.length * 8) : 0) - (imageUrls.length > 1 ? 8 : 0), 0),
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
                          "+$additionalUsersCount", // Use argument
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
            SizedBox(width: 16.0),

            // Trailing Plus/Tick Button
            GestureDetector(
              onTap: onTrailingButtonPressed, // Use argument
              child: Container(
                decoration: BoxDecoration(
                  color:  Color(0xFFEDC967),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(8.0),
                child: Icon(
                    trailingIcon,
                color: Colors.black), // Use argument
              ),
            ),
          ],
        ),
      ),
    );
  }
}