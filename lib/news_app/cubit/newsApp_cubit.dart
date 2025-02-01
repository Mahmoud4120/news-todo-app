import 'package:first_project/news_app/cubit/shared_preference/shared.dart';
import 'package:first_project/news_app/widgets/business_screen.dart';
import 'package:first_project/news_app/widgets/scince_screen.dart';
import 'package:first_project/news_app/widgets/settings_screen.dart';
import 'package:first_project/news_app/widgets/soprts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'NewsApp_states.dart';
import 'dio/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsAppInitialStates());
  static NewsAppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  void changeBottomSheet(int index) {
    currentIndex = index;
    emit(NewsAppBottomSheetStates());
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingStates());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '682053e29b4042e4aaa39614f03613f0'
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetBusinessErrorStates(onError.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingStates());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '682053e29b4042e4aaa39614f03613f0'
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetSportsErrorStates(onError.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingStates());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '682053e29b4042e4aaa39614f03613f0'
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetScienceErrorStates(onError.toString()));
    });
  }

  List<dynamic> search = [];
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=682053e29b4042e4aaa39614f03613f0
  void getSearch(String value) {
    emit(NewsGetSearchLoadingStates());
    search = [];
    DioHelper.getData(
            url: 'v2/everything',
            query: {'q': value, 'apiKey': '682053e29b4042e4aaa39614f03613f0'})
        .then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetSearchErrorStates(onError.toString()));
    });
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeAppThemeStates());
    } else {
      isDark = !isDark;
      CashHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeAppThemeStates());
      });
    }
  }
}
