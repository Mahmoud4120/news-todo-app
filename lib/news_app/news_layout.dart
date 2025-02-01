import 'package:first_project/news_app/cubit/NewsApp_states.dart';
import 'package:first_project/news_app/cubit/dio/dio_helper.dart';
import 'package:first_project/news_app/cubit/newsApp_cubit.dart';
import 'package:first_project/news_app/widgets/searsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearshScreen(),
                          ));
                    },
                    icon: Icon(Icons.search)),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: IconButton(
                      onPressed: () {
                        NewsAppCubit.get(context).changeAppMode();
                      },
                      icon: Icon(Icons.brightness_2_outlined)),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomSheet(index);
                },
                items: cubit.bottomItem),
          );
        });
  }
}
