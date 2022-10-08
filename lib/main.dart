import 'package:flutter/material.dart';
import 'package:rk_weather_app/activities/home.dart';
import 'package:rk_weather_app/activities/home.dart';
import 'package:rk_weather_app/activities/loading.dart';
import 'package:rk_weather_app/activities/location.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context)=>Home(),
        '/':(context)=>Loading(),
        '/loading':(context)=>Loading(),
      },
    );
  }
}
