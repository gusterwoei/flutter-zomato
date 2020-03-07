import 'package:flutter/material.dart';
import 'package:flutter_zomato/bloc/bloc-provider.dart';
import 'package:flutter_zomato/bloc/location-bloc.dart';
import 'package:flutter_zomato/ui/main-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      bloc: LocationBloc(),
      child: MaterialApp(
        title: 'Zomato Restaurant Finder',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MainScreen(),
      ),
    );
  }
}
