import 'package:flutter/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'Settings Screen ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ));
  }
}
