import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/news_app/cubit/NewsApp_states.dart';
import 'package:first_project/news_app/cubit/newsApp_cubit.dart';
import 'package:first_project/news_app/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsAppCubit.get(context).business;
          return articleBuilder(context: context, list: list);
        });
  }
}
