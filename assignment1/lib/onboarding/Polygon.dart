import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
class Polygon extends StatefulWidget {
  const Polygon({super.key});

  @override
  State<Polygon> createState() => _PolygonState();
}

class _PolygonState extends State<Polygon> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          // Hexagon positioned slightly below top, less than half from left
          Positioned(
            top: 50,
            left: 90,
            child: HexagonWidget.pointy(
              width: 20,
              color: Colors.white.withOpacity(0.5),
            ),
          ),

          // Circle 1 - Example
          Positioned(
            top: 130,
            left: 35,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),

          // Circle 2 - Example
          Positioned(
            top: 150,
            left: 120,
            child: Container(
              width: 17,
              height: 17,
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ],
      );

  }
}
