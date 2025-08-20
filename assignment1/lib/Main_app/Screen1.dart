import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'HomeBar.dart';
import 'HabChal.dart';
import 'Screen2.dart';
import '../Explore/ExploreScreen.dart';
import '../Main_app/Screen3.dart';
import '../Activity/activity_screen.dart';
import '../profile/pfscreen1.dart';
import 'NavBar.dart';
import '../Main_app/Screen3.dart';
import '../onboarding/RingsBackground.dart';// Make sure this import exists

// Custom ShapeBorder class for the unique top curve and indentation
class _CustomBottomSheetShape extends ShapeBorder {
  const _CustomBottomSheetShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    final double topRadius = 30.0;
    final double bottomRadius = 12.0;
    final double cutoutRadius = 12.0;
    final double cutoutWidth = 50.0;

    // Top left curve
    path.moveTo(rect.left, rect.top + topRadius);
    path.quadraticBezierTo(rect.left, rect.top, rect.left + topRadius, rect.top);

    // Left side to start of convex curve
    path.lineTo(rect.center.dx - cutoutWidth / 2, rect.top);

    // Convex curve
    path.arcToPoint(
      Offset(rect.center.dx + cutoutWidth / 2, rect.top),
      radius: Radius.circular(cutoutRadius),
      clockwise: true,
    );

    // Top right curve
    path.lineTo(rect.right - topRadius, rect.top);
    path.quadraticBezierTo(rect.right, rect.top, rect.right, rect.top + topRadius);

    // Right side down
    path.lineTo(rect.right, rect.bottom - bottomRadius);
    path.quadraticBezierTo(rect.right, rect.bottom, rect.right - bottomRadius, rect.bottom);

    // Bottom edge
    path.lineTo(rect.left + bottomRadius, rect.bottom);
    path.quadraticBezierTo(rect.left, rect.bottom, rect.left, rect.bottom - bottomRadius);

    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final double cutoutCenterX = rect.center.dx;
    final double cutoutCenterY = rect.top + 5;

    final Paint paint = Paint()
      ..color = const Color(0x55000000)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(cutoutCenterX, cutoutCenterY),
      6.0,
      paint,
    );
  }

  @override
  ShapeBorder scale(double t) => this;
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin  {
  int _selectedIndex = 0;
  bool _showDialogs = false;
  List<bool> _isEmojiHovered = List.filled(5, false);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleDialogs() {
    setState(() {
      _showDialogs = !_showDialogs;
    });
  }

  Widget _buildEmojiButton(String emoji, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isEmojiHovered[index] = true),
        onExit: (_) => setState(() => _isEmojiHovered[index] = false),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: _isEmojiHovered[index] ? Colors.blue.shade100 : Colors.white,
            side: BorderSide(color: Colors.grey.shade400),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            minimumSize: const Size(32, 32),
          ),
          onPressed: () {},
          child: Text(emoji, style: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }

  Widget _buildSmallDialogs(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              // First dialog box
              Expanded(
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    title: const Text('Quit bad habit',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    subtitle: const Text('Never too late'),
                    trailing: const Icon(Icons.shield, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Second dialog box
              Expanded(
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    title: const Text('New good habit',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    subtitle: const Text('Lets do it'),
                    trailing: const Icon(Icons.shield, color: Colors.green),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            margin: const EdgeInsets.only(top: 40),
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: _CustomBottomSheetShape(),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: 40,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text('NEW GOOD HABIT',
                                      style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                                  const SizedBox(height: 16),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[350],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            title: const Text(
                                              'Create Custom Habit',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => const CreateCustomHabitScreen()),
                                              );
                                            },
                                          ),
                                        ),
                                        const Icon(Icons.add),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  const Text('POPULAR HABITS',
                                      style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Card(
                                          color: Colors.orange[50],
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.directions_run, color: Colors.green),
                                                SizedBox(height: 8),
                                                Text('Walk',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.black87)),
                                                Text('10 km', style: TextStyle(color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Card(
                                          color: Colors.blue[50],
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.pool, color: Colors.blue),
                                                SizedBox(height: 8),
                                                Text('Swim',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.black87)),
                                                Text('30 min', style: TextStyle(color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Card(
                                          color: Colors.green[50],
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.menu_book, color: Colors.red),
                                                SizedBox(height: 8),
                                                Text('Read',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.black87)),
                                                Text('20 min', style: TextStyle(color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          Card(
            color: Colors.white,
            child: ListTile(
              title: const Text('Add Mood',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              subtitle: const Text('How are you feeling'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildEmojiButton('😀', 0),
                  _buildEmojiButton('😐', 1),
                  _buildEmojiButton('😢', 2),
                  _buildEmojiButton('😠', 3),
                  _buildEmojiButton('😴', 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();


    _screens.addAll([
      Stack(
        children: [
          const RingsBackground(), // 👈 yaha bhi daal do

          SingleChildScrollView(
            child: Column(
              children: [
                HomeBar(),
                const SizedBox(height: 19),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Screen2()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 40),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade300,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: ListTile(
                      leading: CircularPercentIndicator(
                        radius: 18,
                        percent: 0.25,
                        lineWidth: 2,
                        progressColor: Colors.white,
                        backgroundColor: Colors.black,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: const Text("25%", style: TextStyle(fontSize: 10, color: Colors.black)),
                      ),
                      title: const Text(
                        "Your goal is almost done",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      subtitle: const Text(
                        "1 of 4 goals done",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Habchal(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      const ExploreScreen(),
      const Placeholder(),
      const ActivityScreen(),
      const Pfscreen1(),
    ]);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const RingsBackground(),


          _screens[_selectedIndex],
          if (_showDialogs)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: kBottomNavigationBarHeight + 20,
              child: Material(
                color: Colors.transparent,
                child: Navbar(
                  selectedIndex: _selectedIndex,
                  onIconTapped: _onItemTapped,
                  onAddButtonPressed: _toggleDialogs,
                  isDialogsShowing: _showDialogs,
                ),
              ),
            ),
          ),
          if (_showDialogs)
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: _buildSmallDialogs(context),
            ),
        ],
      ),
    );
  }
}
