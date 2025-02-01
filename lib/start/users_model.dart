import 'package:flutter/material.dart';

class UserModel {
  String? name;
  int? id;
  String? phone;
  UserModel({required this.name, required this.id, required this.phone});
}

class UsersModel extends StatelessWidget {
  List<UserModel> users = [
    UserModel(name: 'Mahmoud hawsa', id: 1, phone: '01124726782'),
    UserModel(name: 'Mahmoud ana', id: 2, phone: '01002156750'),
    UserModel(name: 'Mahmoud he', id: 3, phone: '01121226782'),
    UserModel(name: 'Mahmoud hawsa', id: 1, phone: '01124726782'),
    UserModel(name: 'Mahmoud ana', id: 2, phone: '01002156750'),
    UserModel(name: 'Mahmoud he', id: 3, phone: '01121226782'),
    UserModel(name: 'Mahmoud hawsa', id: 1, phone: '01124726782'),
    UserModel(name: 'Mahmoud ana', id: 2, phone: '01002156750'),
    UserModel(name: 'Mahmoud he', id: 3, phone: '01121226782'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Users',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Padding(
                padding: EdgeInsetsDirectional.only(start: 20),
                child: Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: .8,
                ),
              ),
          itemCount: users.length),
    );
  }
}

Widget buildUserItem(UserModel user) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Text(
              '${user.id}',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                '${user.phone}',
              ),
            ],
          )
        ],
      ),
    );
