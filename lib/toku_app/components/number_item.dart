import 'package:audioplayers/audioplayers.dart';
import 'package:first_project/toku_app/models/numbers.dart';
import 'package:flutter/material.dart';

class NumbersItem extends StatelessWidget {
  Number? number;
  NumbersItem({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.orange,
      child: Row(
        children: [
          Container(
            color: Colors.white60,
            child: Image.asset(number!.image),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number!.jpName,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  number!.enName,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                onPressed: () {
                  final player = AudioPlayer();
                  player.play(AssetSource(
                      'sounds/colors/black.wav'));
                },
                icon: Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.white,
                  size: 30,
                ),
              ))
        ],
      ),
    );
  }
}
