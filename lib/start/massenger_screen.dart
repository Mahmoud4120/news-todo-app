import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 15,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://m.media-amazon.com/images/I/61isn07eSUL.__AC_SY445_SX342_QL70_ML2_.jpg'),
            ),
            SizedBox(
              width: 13,
            ),
            Text(
              'Chats',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 15,
                  child:
                      Icon(Icons.camera_alt, size: 20, color: Colors.black))),
          SizedBox(
            width: 0,
          ),
          IconButton(
              onPressed: () {},
              icon: Center(
                  child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 15,
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.black,
                      )))),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    hintText: 'search',
                    hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 28,
                      color: Colors.white54,
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 80,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStoryItem(),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                    itemCount: 10),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>buildChatItem(),
                  separatorBuilder: (context, index)=> SizedBox(height: 20,),
                  itemCount: 20)
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildStoryItem() {
  return Container(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://m.media-amazon.com/images/I/61isn07eSUL.__AC_SY445_SX342_QL70_ML2_.jpg'),
            ),
            CircleAvatar(
              radius: 9,
              backgroundColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 3, end: 3),
              child: CircleAvatar(
                radius: 5.5,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        Text(
          'Mahmoud Abd Elmoniem hawsa sally ',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    ),
  );
}

Widget buildChatItem() {
  return Row(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://m.media-amazon.com/images/I/61isn07eSUL.__AC_SY445_SX342_QL70_ML2_.jpg'),
          ),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.black,
          ),
          CircleAvatar(
            maxRadius: 10,
            child: Text('35 m'),
          )
        ],
      ),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mahmoud Hawsa',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              children: [
                Text(
                  'عامل ايه ي برو .',
                  style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '11:25 am',
                  style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                )
              ],
            )
          ],
        ),
      )
    ],
  );
}
