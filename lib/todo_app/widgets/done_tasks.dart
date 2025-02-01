import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constans/const.dart';
import '../cubit/app_states.dart';
import '../cubit/cubit.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).doneTasks;
        return ConditionalBuilder(
          builder: (context) => ListView.separated(
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                width: double.infinity,
                height: .5,
                color: Colors.grey[300],
              ),
            ),
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return buildTaskItem(tasks[index], context);
            },
          ),
          condition: tasks.isNotEmpty,
          fallback: (context) => Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu,
                size: 100,
                color: Colors.grey,
              ),
              Text(
                "No Done Tasks Available",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.grey),
              ),
            ],
          )),
        );
      },
    );
  }
}
