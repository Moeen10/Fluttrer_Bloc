import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:single_test/Screens/Test_screen.dart';
import 'package:single_test/Screens/home.dart';
import 'package:single_test/cubit/InternetCubit.dart';
import 'package:single_test/cubit/postcubit/post_Cubit.dart';
import 'package:single_test/data/models/post_model.dart';
import 'package:single_test/data/repository/post_repository.dart';

void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) => InternetCubit(),
        child: BlocProvider(
          create: (context) => PostCubit(),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

            primarySwatch: Colors.green,
            ),
            home:  TestPage(),
          ),
        ),
      );
  }
}




// BlocProvider(
// create: (context) => InternetCubit(),
// child: MaterialApp(
// title: 'Flutter Demo',
// theme: ThemeData(
//
// primarySwatch: Colors.green,
// ),
// home:  MyHomePage(title: 'Flutter Demo Home Page'),
// ),
// )