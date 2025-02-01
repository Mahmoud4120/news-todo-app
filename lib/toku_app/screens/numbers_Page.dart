import 'package:flutter/material.dart';

import '../components/number_item.dart';
import '../models/numbers.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  List<Number> numbers = [
      Number(image: 'assets/images/numbers/number_one.png',
          enName: 'Two', jpName: 'ichi'),
      Number(image: 'assets/images/numbers/number_two.png',
          enName: 'two', jpName: 'ichi'),
      Number(image: 'assets/images/numbers/number_three.png',
          enName: 'three', jpName: 'ichi'),
      Number(image: 'assets/images/numbers/number_four.png',
          enName: 'four', jpName: 'ichi'),
      Number(image: 'assets/images/numbers/number_five.png',
          enName: 'five', jpName: 'ichi'),
      Number(image: 'assets/images/numbers/number_six.png',
          enName: 'six', jpName: 'ichi'),
      Number(image: 'assets/images/numbers/number_seven.png',
          enName: 'seven', jpName: 'ichi'),
      Number(image: 'assets/images/numbers/number_eight.png',
          enName: 'eight', jpName: 'ichi'),
      Number(image: 'assets/images/numbers/number_nine.png',
          enName: 'nine', jpName: 'ichi'),
      Number(image: 'assets/images/numbers/number_ten.png',
          enName: 'Ten', jpName: 'ichi'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(
            'Numbers',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context,index)=> NumbersItem(number: numbers[index],),
          itemCount: numbers.length,
        ));
  }
}
