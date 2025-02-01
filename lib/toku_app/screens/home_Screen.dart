import 'package:flutter/material.dart';

import '../components/category_screen.dart';
import 'numbers_Page.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Toku',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Category(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NumbersPage(),
                  ));
            },
            color: Colors.deepPurple,
            text: 'Numbers',
          ),
          Category(
              color: Colors.deepOrangeAccent,
              text: 'Family Members'),
          Category(onTap: () {}, color: Colors.greenAccent, text: 'Colors'),
          Category(onTap: () {}, color: Colors.green, text: 'Phrases')
        ],
      ),
    );
  }
}
