import 'package:first_project/counter_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialStates());
  static CounterCubit get(context)=> BlocProvider.of(context);
  int counter = 1;
  void minus(){
    counter--;
    emit(CounterMinusStates());
  }
  void plus(){
    counter++;
    emit(CounterPlusStates());
  }
}
