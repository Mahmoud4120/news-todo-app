import 'package:flutter/material.dart';

class BirthdayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Mahmoud hawsa',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontFamily: 'Pacifico'),
          ),
          Divider(
            color: Colors.black,
            height: 10,endIndent: 5,indent: 5, thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Mahmoud hawsa'),
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

          ),
          Image(
              image: AssetImage(
                  'images/WhatsApp Image 2024-07-11 at 02.32.57_993d8191.jpg')),

        ],
      ),
    );
  }
}
