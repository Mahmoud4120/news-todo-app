import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
          size: 30,
        ),
        title: Text(
          'Hello',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('Soso My Love ');
            },
            icon: Icon(
              Icons.notification_add,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image(
                      image: NetworkImage(
                          'https://m.media-amazon.com/images/I/61dlft5BTGL.__AC_SX300_SY300_QL70_ML2_.jpg'),
                      fit: BoxFit.fill,
                      width: 150,
                      height: 180,
                    ),
                    Container(
                      width: 150,
                      padding: EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 10),
                      color: Colors.black.withOpacity(.8),
                      child: Text(
                        'sally',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
