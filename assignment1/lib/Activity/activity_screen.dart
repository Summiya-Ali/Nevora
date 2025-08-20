import 'package:flutter/material.dart';
import 'dart:async'; // Import for using Timer
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Placeholder for the SuccessScreen. In a real app, this would be a separate file.
class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  Set<String> _selectedPeriod = {'Weekly'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Changed to blue background
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Section (App Bar-like)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 16),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(width: 32),
                      const Text(
                        'Leaderboard',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildPeriodToggleButton()

                ],
              ),
            ),

            // Top 3 Section
            const SizedBox(height: 20),
            _buildTopThree(),
            const SizedBox(height: 20),

            // List of other users
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _buildOtherUsersList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodToggleButton() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildToggleButton('Daily', 0),
            _buildToggleButton('Weekly', 1),
            _buildToggleButton('Monthly', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, int index) {
    final isSelected = <bool>[
      _selectedPeriod.contains('Daily'),
      _selectedPeriod.contains('Weekly'),
      _selectedPeriod.contains('Monthly'),
    ][index];

    return GestureDetector(
      onTap: () {
        setState(() {
          if (index == 0) _selectedPeriod = {'Daily'};
          if (index == 1) _selectedPeriod = {'Weekly'};
          if (index == 2) _selectedPeriod = {'Monthly'};
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 100,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.yellow.shade600 : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  Widget _buildTopThree() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildTopUserCard(
          rank: 2,
          rankText: '2nd',
          name: 'Miray K.',
          points: 1223,
          imageUrl: 'https://images.unsplash.com/photo-1713392899774-5f1c261c4a77?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        _buildTopUserCard(
          rank: 1,
          rankText: '1st',
          name: 'JTS',
          points: 1452,
          imageUrl: 'https://plus.unsplash.com/premium_photo-1669704098858-8cd103f4ac2e?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        _buildTopUserCard(
          rank: 3,
          rankText: '3rd',
          name: 'Onur O.',
          points: 968,
          imageUrl: 'https://plus.unsplash.com/premium_photo-1669704099119-7fcaaf77f2e8?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ],
    );
  }

  Widget _buildTopUserCard({
    required int rank,
    required String rankText,
    required String name,
    required int points,
    required String imageUrl,
  }) {
    double size = rank == 1 ? 150 : 120;

    return Column(
      children: [
        if (rank == 1)
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(FontAwesomeIcons.crown, color: Colors.yellow, size: 24),
          ),
        Container(padding: const EdgeInsets.all(3), // border thickness
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey, // border color
              width: 4,           // border width
            ),
          ),
          child: CircleAvatar(
            radius: size / 2,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          width: size * 0.5,
          height: size * 0.7,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size * 0.35),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(rankText, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(FontAwesomeIcons.medal, color: Colors.amber, size: 12),
                  const SizedBox(width: 4),
                  Text('$points', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOtherUsersList() {
    final otherUsers = [
      {'name': 'Jennings Stohler', 'points': 912, 'imageUrl': 'https://plus.unsplash.com/premium_photo-1669704099119-7fcaaf77f2e8?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'name': 'Scotty Tovias', 'points': 846, 'imageUrl': 'https://images.unsplash.com/photo-1581843046438-8a502f9719fc?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'name': 'Amelina Aguila', 'points': 771, 'imageUrl': 'https://plus.unsplash.com/premium_photo-1672790905681-ef3b169f5a19?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'name': 'Kally Cirrincione', 'points': 693, 'imageUrl': 'https://images.unsplash.com/photo-1649626306353-126afb2aa9a6?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'name': 'Layla Schupbach', 'points': 555, 'imageUrl': 'https://images.unsplash.com/photo-1713392899774-5f1c261c4a77?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    ];

    return Column(
      children: [
        for (int i = 0; i < otherUsers.length; i++)
          _buildUserListItem(
            rank: i + 4,
            name: otherUsers[i]['name'] as String,
            points: otherUsers[i]['points'] as int,
            imageUrl: otherUsers[i]['imageUrl'] as String,
          ),
      ],
    );
  }

  Widget _buildUserListItem({
    required int rank,
    required String name,
    required int points,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
          decoration: BoxDecoration(
            color: Colors.white, // optional background
            border: Border.all(
              color: Colors.grey, // grey border
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8), // rounded corners
            shape: BoxShape.rectangle, // square/rectangular shape
          ),

                alignment: Alignment.center,
                child: Text('$rank', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  Text('$points Points', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                ],
              ),
            ],
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ],
      ),
    );
  }
}

// Custom painter to draw the line graph with a grid background.
class HabitsLineChart extends StatelessWidget {
  const HabitsLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // Grid background
          CustomPaint(
            size: const Size(double.infinity, 100),
            painter: _GridPainter(),
          ),
          // Line graph on top of the grid
          CustomPaint(
            size: const Size(double.infinity, 100),
            painter: _LineChartPainter(),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade800
      ..strokeWidth = 1;

    // Draw horizontal lines
    final lineCount = 4;
    for (int i = 0; i <= lineCount; i++) {
      final y = size.height / lineCount * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 103, 103, 238)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    // Example data points for the line graph
    final points = [
      Offset(size.width * 0.05, size.height * 0.8),
      Offset(size.width * 0.15, size.height * 0.6),
      Offset(size.width * 0.25, size.height * 0.4),
      Offset(size.width * 0.35, size.height * 0.5),
      Offset(size.width * 0.45, size.height * 0.3),
      Offset(size.width * 0.55, size.height * 0.6),
      Offset(size.width * 0.65, size.height * 0.7),
      Offset(size.width * 0.75, size.height * 0.5),
      Offset(size.width * 0.85, size.height * 0.4),
      Offset(size.width * 0.95, size.height * 0.2),
    ];

    path.moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, paint);

    // Draw the circles at each point
    final pointPaint = Paint()
      ..color = const Color.fromARGB(255, 103, 103, 238)
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    for (final point in points) {
      canvas.drawCircle(point, 3, pointPaint);
    }

    // Draw the final point with a highlight
    canvas.drawCircle(points.last, 5, pointPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter to draw the emoji mood chart
class MoodEmojiChart extends StatelessWidget {
  const MoodEmojiChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 50),
      painter: _MoodEmojiPainter(),
    );
  }
}

class _MoodEmojiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    const List<String> emojis = ['😞', '😐', '😊', '😁', '😍'];
    const List<double> yPositions = [0.6, 0.4, 0.2, 0.5, 0.1]; // Example heights from the bottom

    for (int i = 0; i < emojis.length; i++) {
      final x = size.width * (i + 0.5) / emojis.length;
      final y = size.height * yPositions[i];
      final offset = Offset(x, y);

      // Draw dotted vertical line
      final paint = Paint()
        ..color = Colors.grey.shade700
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke;

      const double dashWidth = 5;
      const double dashSpace = 3;
      double startY = offset.dy;
      while (startY < size.height) {
        canvas.drawLine(Offset(offset.dx, startY), Offset(offset.dx, startY + dashWidth), paint);
        startY += dashWidth + dashSpace;
      }

      // Draw emoji
      textPainter.text = TextSpan(
        text: emojis[i],
        style: const TextStyle(fontSize: 24),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


// Main screen for the Activity page, based on the provided image.
class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  // A Timer to handle the 6-second delay
  Timer? _timer;

  // State variables for the UI components
  Set<String> _selectedPeriod = {'Weekly'};
  bool _isAllHabitsExpanded = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 10), () {
      // Navigate to the SuccessScreen after 6 seconds
      if (mounted) { // Check if the widget is still in the tree
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SuccessScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Main background is black
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section (App Bar-like)
            Container(
              color: Colors.white, // Off-white color for the app bar
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Activity',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(FontAwesomeIcons.solidBell, color: Colors.black, size: 20),
                          onPressed: () {
                            // Handle notifications icon press
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildPeriodToggleButton(),
                ],
              ),
            ),

            // Main content area with black background
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 16),

                  // Date Navigation Row
                  _buildDateNavigation(),
                  const SizedBox(height: 24),

                  // All Habits Card
                  _buildAllHabitsCard(),
                  const SizedBox(height: 24),

                  // Habits Graph Card
                  _buildHabitsGraphCard(),
                  const SizedBox(height: 24),

                  // Happy Mood Card (Emoji Graph)
                  _buildHappyMoodCard(),
                  const SizedBox(height: 100), // Padding for bottom nav bar
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodToggleButton() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildToggleButton('Daily', 0),
            _buildToggleButton('Weekly', 1),
            _buildToggleButton('Monthly', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, int index) {
    final isSelected = <bool>[
      _selectedPeriod.contains('Daily'),
      _selectedPeriod.contains('Weekly'),
      _selectedPeriod.contains('Monthly'),
    ][index];

    return GestureDetector(
      onTap: () {
        setState(() {
          if (index == 0) _selectedPeriod = {'Daily'};
          if (index == 1) _selectedPeriod = {'Weekly'};
          if (index == 2) _selectedPeriod = {'Monthly'};
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 100,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.yellow.shade600 : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
  Widget _buildDateNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'This week',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'May 27 - Jun 3',
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAllHabitsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('😊', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('All Habits', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('Summary', style: TextStyle(color: Colors.white54, fontSize: 14)),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  _isAllHabitsExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isAllHabitsExpanded = !_isAllHabitsExpanded;
                  });
                },
              ),
            ],
          ),

          if (_isAllHabitsExpanded) ...[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem(title: 'SUCCESS RATE', value: '%98'),
                _buildSummaryItem(title: 'COMPLETED', value: '244'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem(title: 'POINTS EARNED', value: '💰322'),
                _buildSummaryItem(title: 'BEST STREAK DAY', value: '22'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem(title: 'SKIPPED', value: '4'),
                _buildSummaryItem(title: 'FAILED', value: '2'),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryItem({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildHabitsGraphCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(FontAwesomeIcons.chartLine, color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Habits', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('Comparison by week', style: TextStyle(color: Colors.white54, fontSize: 14)),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text('🔥 Burn! 32 habits', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const HabitsLineChart(), // Using the new custom chart widget
        ],
      ),
    );
  }

  Widget _buildHappyMoodCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text('😀', style: TextStyle(fontSize: 24)),
              SizedBox(width: 8),
              Text('Happy', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const Text('Avg. Mood', style: TextStyle(color: Colors.white54, fontSize: 14)),
          const SizedBox(height: 16),
          const MoodEmojiChart(),
        ],
      ),
    );
  }
}
