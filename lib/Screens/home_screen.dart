import 'package:flutter/material.dart';
import 'package:rowing_app/Widgets/weekday_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedDay = 0;

  Widget buildHomeBody(int index) {
    Widget content;
    switch (index) {
      case 0:
        content = const Center(child: Text('Monday'));
        break;
      case 1:
        content = const Center(child: Text('Tuesday'));
        break;
      case 2:
        content = const Center(child: Text('Wednesday'));
        break;
      case 3:
        content = const Center(child: Text('Thursday'));
        break;
      case 4:
        content = const Center(child: Text('Friday'));
        break;
      case 5:
        content = const Center(child: Text('Saturday'));
        break;
      case 6:
        content = const Center(child: Text('Sunday'));
        break;
      default:
        content = const Center(child: Text('Error'));
        break;
    }
    return Expanded(child: Container(child: content));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeekdaySelector(
          onDaySelected: (index) {
            setState(() {
              selectedDay = index;
            });
          },
        ),
        buildHomeBody(selectedDay),
      ],
    );
  }
}
