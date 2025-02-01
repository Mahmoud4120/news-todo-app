import 'package:first_project/todo_app/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget buildTaskItem(Map model ,context) {
  return Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 40,
            child: Text(
              '${model['time']}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${model['date']}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          TextButton(
              onPressed: () {
                AppCubit.get(context).updateData(status: 'done', id: model['id']);
              },
              child: Icon(
                Icons.check_box,
                color: Colors.green,
                size: 25,
              )),
          TextButton(
              onPressed: () {
                AppCubit.get(context).updateData(status: 'archive', id: model['id']);

              },
              child: Icon(
                Icons.archive_outlined,
                color: Colors.black54,
                size: 25,
              )),
        ],
      ),
    ),
    onDismissed: (direction) {
      AppCubit.get(context).deleteData(id: model['id']);
    },
  );
}
