import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/HomeScreen/homescreen.dart';
import 'package:newsapp/News/news_details_screen.dart';

import 'my-theme.dart';
import 'my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routename,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        NewsDetailsScreen.routename: (context) => NewsDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
    );
  }
}
