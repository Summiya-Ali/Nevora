import 'package:flutter/material.dart';

class AvatarWaveSection extends StatelessWidget {
  const AvatarWaveSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // You can tweak this height
      width: double.infinity,
      child: Stack(
        children: [
          // Background wave line
          Positioned.fill(
            child: CustomPaint(
              painter: WavePainter(),
            ),
          ),

          // Avatars with trails
          _buildAvatarWithTrail(left: 12, top: 70, imagePath: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          //_buildAvatarWithTrail(left: 120, top: 40, imagePath: 'assets/user2.png'),
          buildUpsideDownAvatarWithTrail(
            left: 90,
            top: 80,
            imagePath: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          _buildAvatarWithTrail(left: 250, top: 20, imagePath: 'https://plus.unsplash.com/premium_photo-1663099868219-51301da86d34?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          _buildAvatarWithTrail(left: 400, top: 60, imagePath: 'https://images.unsplash.com/photo-1667857481427-382ee0b5207e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D'),


          // Streak Info Box
          Positioned(
            top: 90,
            left: 150,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'BEST STREAK DAY',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1.2,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '22',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarWithTrail({
    required double left,
    required double top,
    required String imagePath,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(imagePath),
          ),
          Transform.translate(
            offset: const Offset(0, -24), // Tighten connection
            child: ClipPath(
              clipper: TightConcaveClipper(),
              child: Container(
                height:110,
                width: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.25),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.2,
        size.width * 0.5, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.6,
        size.width, size.height * 0.4);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}





Widget buildUpsideDownAvatarWithTrail({
  required double left,
  required double top,
  required String imagePath,
}) {
  return Positioned(
    top: top,
    left: left,
    child: Column(
      children: [
        // Trail above
        ClipPath(
          clipper: BottomConcaveClipper(arcDepth: 12),
          child: Container(
            width: 50,
            height: 90,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.25),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),

        // This spacer is unnecessary if you want them flush together
        // SizedBox(height: 0),

        // Avatar right below it (use Transform to tighten gap)
        Transform.translate(
          offset: const Offset(0, -11), // move up to touch or overlap slightly
          child: CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(imagePath),
          ),
        ),
      ],
    ),
  );

}

class TightConcaveClipper extends CustomClipper<Path> {
final double avatarRadius;

TightConcaveClipper({this.avatarRadius = 20});

@override
Path getClip(Size size) {
  final path = Path();

  // Start from top-left
  path.moveTo(0, 0);

  // Concave arc that hugs the avatar perfectly
  path.arcToPoint(
    Offset(size.width, 0),
    radius: Radius.circular(avatarRadius),
    clockwise: false, // Concave (inward)
  );

  // Right edge
  path.lineTo(size.width, size.height);

  // Bottom edge
  path.lineTo(0, size.height);

  path.close();

  return path;
}

@override
bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomConcaveClipper extends CustomClipper<Path> {
  final double arcDepth;

  BottomConcaveClipper({this.arcDepth = 40});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Start at top-left
    path.moveTo(0, 0);

    // Top edge → right
    path.lineTo(size.width, 0);

    // Right edge → down
    path.lineTo(size.width, size.height);

    // ✅ Bottom edge with concave arc → left
    path.quadraticBezierTo(
      size.width / 2,                        // control point (center dip)
      size.height - 2 * arcDepth,           // how deep the dip is
      0, size.height,                       // end at bottom-left
    );

    // Left edge → up
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

