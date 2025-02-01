
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';


import '../widgets/archive-tasks.dart';
import '../widgets/done_tasks.dart';
import '../widgets/news_tasks.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];
  List<String> title = [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBArStates());
  }

  Database? dataBase;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  Future<void> createDataBase() async {
    try {
      dataBase = await openDatabase(
        'toda.db',
        version: 1,
        onCreate: (dataBase, version) async {
          print('Database created');
          await dataBase.execute(
            'CREATE TABLE Test ('
                'id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)',
          );
          print('Table created successfully');
        },
        onOpen: (dataBase) {
          print('Database opened successfully');
          getDataFromDataBase(dataBase);
        },
      );
      emit(AppCreateDataBaseStates());
    } catch (error) {
      print('Error creating database: ${error.toString()}');
    }
  }

  Future<void> insertToDataBase({
    required String title,
    required String date,
    required String time,
  }) async {
    if (dataBase == null) {
      print("Database is not initialized. Retrying...");
      await createDataBase();
    }
    if (dataBase != null) {
      try {
        await dataBase!.transaction((txn) async {
          await txn.rawInsert(
            'INSERT INTO Test (title, date, time, status) VALUES(?, ?, ?, ?)',
            [title, date, time, 'new'],
          );
          print('Record inserted successfully');
          getDataFromDataBase(dataBase!);
          emit(AppInsertDataBaseStates());

        });
      } catch (error) {
        print('Error inserting record: ${error.toString()}');
      }
    } else {
      print("Failed to initialize database even after retrying.");
    }
  }

  void getDataFromDataBase(Database dataBase) async {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    emit(AppGetDataBaseLoadingStates());
    try {
      List<Map> tasks = await dataBase.rawQuery('SELECT * FROM Test');
      for (var element in tasks) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else if (element['status'] == 'archive') {
          archiveTasks.add(element);
        }
      }
      emit(AppGetDataBaseStates());
    } catch (error) {
      print('Error fetching data: ${error.toString()}');
    }
  }


  void updateData({
    required String status,
    required int id,
  }) async {
    await dataBase!.rawUpdate('UPDATE Test SET status = ?  WHERE id = ?',
        [status, id]).then((onValue) {
      emit(AppUpdateDataBaseStates());
      getDataFromDataBase(dataBase!);

    });
  }

  void deleteData({
    required int id,
  }) async {
    await dataBase!.rawDelete('DELETE FROM Test WHERE id = ?', [id]);
    getDataFromDataBase(dataBase!);
    emit(AppDeleteDataBaseStates());
  }
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheet({
    required bool isShown,
    required IconData icon,
  }) {
    isBottomSheetShown = isShown;
    fabIcon = icon;
    emit(AppChangeBottomSheetStates());
  }
}
