
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/ui/global/theme/bloc/theme_bloc.dart';

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      )
    );
//      return BlocProvider(
//        builder: (cotext) => ThemeBloc(),
//        child: BlocBuilder<ThemeBloc,ThemeState>,
//      );


  }



}