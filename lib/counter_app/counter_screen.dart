import 'package:first_project/counter_app/cubit/cubit.dart';
import 'package:first_project/counter_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {

  CounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text('Counter'),
            backgroundColor: Colors.grey,
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      'MINUS',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    )),
                Text(
                  '${CounterCubit.get(context).counter}',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                      'PLUS',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    )),
              ],
            ),
          ),
        ),
        listener: (context, state) {},
      ),
    );
  }
}
