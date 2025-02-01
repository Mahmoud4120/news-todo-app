import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/NewsApp_states.dart';
import '../cubit/newsApp_cubit.dart';
import 'consts.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsAppCubit.get(context).sports;
          return articleBuilder(context: context,list: list);
        });
  }
}
