import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/news_app/cubit/newsApp_cubit.dart';
import 'package:first_project/news_app/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/NewsApp_states.dart';

class SearshScreen extends StatelessWidget {
  var searchController = TextEditingController();
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsAppCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      NewsAppCubit.get(context).getSearch(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 18), // لون النص داخل الحقل
                  ),
                ),
                Expanded(
                  child: articleBuilder(context: context,list: list,isSearch: true)
                ),
              ],
            ),
          );
        });
  }
}
