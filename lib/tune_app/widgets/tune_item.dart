import 'package:first_project/tune_app/models/tune_model.dart';
import 'package:flutter/material.dart';

class TuneItem extends StatelessWidget {
  TuneItem({ super.key,required this.tune});
  TuneModel tune;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          tune.playSound();
        },
        child: Container(
          color: tune.color,
        ),
      ),
    );
  }
}
