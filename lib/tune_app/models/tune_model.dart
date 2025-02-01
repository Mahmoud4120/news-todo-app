import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';

class TuneModel{
  String sound;
  Color color;
  TuneModel({required this.color, required this.sound});
  void playSound(){
   final player = AudioPlayer();
   player.play(AssetSource(sound));
  }
}