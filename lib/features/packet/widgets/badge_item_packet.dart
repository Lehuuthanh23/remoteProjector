import 'package:flutter/material.dart';

class BadgeItemPacket extends StatelessWidget {
  final String type;
  final Color color;

  const BadgeItemPacket({super.key, required this.type, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(type, style: const TextStyle(color: Colors.white)),
    );
  }
}
