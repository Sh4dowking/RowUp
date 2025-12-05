import 'package:flutter/material.dart';

class WeekdayBox extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const WeekdayBox({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
