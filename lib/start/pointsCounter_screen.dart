import 'package:flutter/material.dart';

class PointsCounterScreen extends StatefulWidget {
  const PointsCounterScreen({super.key});

  @override
  State<PointsCounterScreen> createState() => PointsCounterScreenState();
}

class PointsCounterScreenState extends State<PointsCounterScreen> {
  var counterA =0;
  var counterB =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Points Counter ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Team A ',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$counterA',
                    style: TextStyle(fontSize: 100),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange,
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            counterA++;
                            print(counterA);
                          });
                        },
                        child: Text(
                          'Add 1 Point',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange,
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            counterA =counterA+2;
                            print(counterA);
                          });
                        },
                        child: Text(
                          'Add 2 Point',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange,
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            counterA =counterA+3;
                            print(counterA);
                          });

                        },
                        child: Text(
                          'Add 3 Point',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 380,
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 1.5,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Team B ',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$counterB',
                    style: TextStyle(fontSize: 100),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange,
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            counterB++;
                            print(counterB);
                          });
                        },
                        child: Text(
                          'Add 1 Point',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange,
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            counterB =counterB+2;
                            print(counterB);
                          });
                        },
                        child: Text(
                          'Add 2 Point',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange,
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            counterB =counterB+3;
                            print(counterB);
                          });
                        },
                        child: Text(
                          'Add 3 Point',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                ],
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
            child: Container(
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      counterA = 0;
                      counterB=0;
                    });
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
