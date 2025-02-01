import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/todo_app/cubit/app_states.dart';
import 'package:first_project/todo_app/cubit/cubit.dart';
import 'package:first_project/todo_app/widgets/archive-tasks.dart';
import 'package:first_project/todo_app/widgets/done_tasks.dart';
import 'package:first_project/todo_app/widgets/news_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        if (state is AppInsertDataBaseStates) {
          Navigator.pop(context);
        }

      }, builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              cubit.title[cubit.currentIndex],
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: ConditionalBuilder(
            builder: (context) => cubit.screens[cubit.currentIndex],
            condition: state is! AppGetDataBaseLoadingStates,
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (cubit.isBottomSheetShown) {
                if (formKey.currentState!.validate()) {
                  cubit
                      .insertToDataBase(
                    title: titleController.text,
                    date: dateController.text,
                    time: timeController.text,
                  )
                      .then((value) {
                    titleController.clear();
                    dateController.clear();
                    timeController.clear();
                  });
                }
              } else {
                scaffoldKey.currentState!
                    .showBottomSheet(
                      (context) => Container(
                        color: Colors.grey[100],
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.text,
                                controller: titleController,
                                onTap: () {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Title must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    label: Text('Task Title'),
                                    prefixIcon: Icon(Icons.title),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                keyboardType: TextInputType.datetime,
                                controller: timeController,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((onValue) {
                                    timeController.text =
                                        onValue!.format(context).toString();
                                    //زى ما بناخد الداتا من الكنترولر بالشكل اللى فوق بنديله داتا
                                  }).catchError((error) {
                                    print('$error error');
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Time must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    label: Text('Task Time'),
                                    prefixIcon:
                                        Icon(Icons.watch_later_outlined),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                keyboardType: TextInputType.datetime,
                                controller: dateController,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2025-10-10'),
                                  ).then((onValue) {
                                    dateController.text =
                                        DateFormat.yMMMd().format(onValue!);

                                    print(onValue.toString());
                                    //زى ما بناخد الداتا من الكنترولر بالشكل اللى فوق بنديله داتا
                                  }).catchError((error) {
                                    print('$error error');
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Date must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    label: Text('Task Date'),
                                    prefixIcon: Icon(Icons.date_range_outlined),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .closed
                    .then((value) {
                  cubit.changeBottomSheet(isShown: false, icon: Icons.edit);
                });
                cubit.changeBottomSheet(isShown: true, icon: Icons.add);
              }
            },
            backgroundColor: Colors.blue,
            child: Icon(
              cubit.fabIcon,
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archive'),
              ]),
        );
      }),
    );
  }
}
