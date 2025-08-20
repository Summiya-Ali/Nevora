import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final List<String> emojiList;
  final List<String> cardText;

  Cards({super.key, required this.emojiList, required this.cardText});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  late List<bool> isHoveringList;

  @override
  void initState() {
    super.initState();
    isHoveringList = List.filled(widget.emojiList.length, false); // Initialize all to false
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: widget.emojiList.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHoveringList[index] = true),
          onExit: (_) => setState(() => isHoveringList[index] = false),
          child: Card(
            elevation: 2,

            color: Colors.white30,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isHoveringList[index] ? Colors.amber : Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.emojiList[index],
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.cardText[index],
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
