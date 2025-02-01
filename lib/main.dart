import 'package:first_project/news_app/cubit/NewsApp_states.dart';
import 'package:first_project/news_app/cubit/dio/dio_helper.dart';
import 'package:first_project/todo_app/widgets/home_layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_app/cubit/bloc_observe.dart';
import 'news_app/cubit/newsApp_cubit.dart';
import 'news_app/cubit/shared_preference/shared.dart';
import 'news_app/news_layout.dart';

void main() async {
  ///معناها ان كل حاجه ف الميثود خلصت قبل ما يرن الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  bool? isDark = CashHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCubit()
        ..getBusiness()
        ..getSports()
        ..getScience()
        ..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
               // primarySwatch: Colors.deepOrange,
               //  progressIndicatorTheme: ProgressIndicatorThemeData(
               //    color: Colors.deepOrange,
               //  ),
                textTheme: TextTheme(
                  bodyLarge: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  color: Colors.white,
                  elevation: 0,
                  iconTheme: IconThemeData(size: 30),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.blue,
                  elevation: 20,
                ),
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.grey), // لون الـ Label
                  hintStyle: TextStyle(color: Colors.grey), // لون الـ Hint Text
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              themeMode: NewsAppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              darkTheme: ThemeData(
               // primarySwatch: Colors.deepOrange,
                textTheme: TextTheme(
                  bodyLarge: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: AppBarTheme(
                  color: Colors.black,
                  elevation: 0,
                  iconTheme: IconThemeData(size: 30, color: Colors.white),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.white,
                  elevation: 20,
                  backgroundColor: Colors.black,
                  selectedIconTheme: IconThemeData(color: Colors.blue),
                  unselectedIconTheme: IconThemeData(color: Colors.white),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.white70), // لون الـ Label في الوضع الليلي
                  hintStyle: TextStyle(color: Colors.white70), // لون الـ Hint Text في الوضع الليلي
                  border: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.deepOrange),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
              ),
              home: HomeLayout(),
            );
          }),
    );
  }
}
