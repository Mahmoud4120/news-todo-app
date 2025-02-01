import 'package:first_project/tune_app/models/tune_model.dart';
import 'package:first_project/tune_app/widgets/tune_item.dart';
import 'package:flutter/material.dart';

class TuneScreen extends StatelessWidget {
   List<TuneModel> tunes = [
     TuneModel(color: Colors.red, sound:'note1.wav'),
     TuneModel(color: Colors.green, sound:'note2.wav'),
     TuneModel(color: Colors.black, sound:'note3.wav'),
     TuneModel(color: Colors.yellow, sound:'note4.wav'),
     TuneModel(color: Colors.white12, sound:'note5.wav'),
     TuneModel(color: Colors.brown, sound:'note6.wav'),
     TuneModel(color: Colors.blue, sound:'note7.wav'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Flutter Tune',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: tunes.map((color)=>TuneItem(tune: color,)).toList(),
      ),
    );
  }

  // List<TuneItem> getTuneItem() {
  //   List<TuneItem> items = [];
  //   for (var color in tuneColors) {
  //     items.add(TuneItem(color: color));
  //   }
  //   return items;
  // }


}
