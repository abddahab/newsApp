import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/setting/setting.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),

  ];

  void changeBottomNevBarScreen(int index){
    currentIndex = index;
    if(currentIndex == 1)
      getDataSports();
    else if(currentIndex == 2)
      getDataScience();

    emit(NewsBottomNevBarState());
  }


  List<dynamic> business = [] ;

  void getDataBusiness (){
    emit(NewsGetDataBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'business',
          'apiKey' : '5e81decfc13244dcb4e3c002fd7a8bf1',
        }).then((value) {
          business = value?.data['articles'];
          print(business[0] ['title']);
      emit(NewsGetDataSuccessBusinessState());
    } ).catchError((error){
      emit(NewsGetDataErrorBusinessState(error.toString()));
    });

  }

  List<dynamic> sports = [] ;

  void getDataSports (){
    emit(NewsGetDataSportsLoadingState());
    if(sports.length == 0)
    {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country' : 'eg',
            'category' : 'sports',
            'apiKey' : '5e81decfc13244dcb4e3c002fd7a8bf1',
          }).then((value) {
        sports = value?.data['articles'];
        print(sports[0] ['title']);
        emit(NewsGetDataSuccessSportsState());
      } ).catchError((error){
        emit(NewsGetDataErrorSportsState(error.toString()));
      });
    }

    else
    {
      emit(NewsGetDataSuccessSportsState());
    }



  }

  List<dynamic> science = [] ;

  void getDataScience (){
    emit(NewsGetDataScienceLoadingState());

    if(science.length == 0 )
    {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country' : 'eg',
            'category' : 'science',
            'apiKey' : '5e81decfc13244dcb4e3c002fd7a8bf1',
          }).then((value) {
        science = value?.data['articles'];
        print(science[0] ['title']);
        emit(NewsGetDataSuccessScienceState());
      } ).catchError((error){
        emit(NewsGetDataErrorScienceState(error.toString()));
      });

    }
   else
   {
     emit(NewsGetDataSuccessScienceState());
   }
  }




}

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get (context)=> BlocProvider.of(context);

  bool isDark = false ;
  void changeAppMode ()
  {
    isDark = !isDark ;
    emit(NewsChangeAppModeState());
  }

}