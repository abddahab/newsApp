import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news/news_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {
  runApp( MyApp());
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit() ,
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                elevation: 0,
                color: Colors.white,
                backwardsCompatibility: false,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 0,
                selectedItemColor: Colors.deepOrange,
                type:BottomNavigationBarType.fixed,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )
              ),
            ),
            darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                scaffoldBackgroundColor: Colors.white10,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  elevation: 0,
                  color: Colors.white10,
                  backwardsCompatibility: false,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white10,
                    statusBarIconBrightness: Brightness.dark,

                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white10,
                  elevation: 0,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  type:BottomNavigationBarType.fixed,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
              textDirection: TextDirection.ltr ,
              child:  NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}
