import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zomato/bloc/bloc-provider.dart';
import 'package:flutter_zomato/bloc/location-bloc.dart';
import 'package:flutter_zomato/ui/main-screen.dart';

import 'models/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LocationBloc(),
        // bloc: LocationBloc(),
        child: BlocBuilder<LocationBloc, Location>(
          builder: (_, location) {
            return MaterialApp(
                title: 'Zomato Restaurant Finder',
                theme: ThemeData(
                  primarySwatch: Colors.red,
                ),
                home: MainScreen());
          },
        ));
    // return BlocProvider<LocationBloc>(
    //   bloc: LocationBloc(),
    //   child: MaterialApp(
    //     title: 'Zomato Restaurant Finder',
    //     theme: ThemeData(
    //       primarySwatch: Colors.red,
    //     ),
    //     home: MainScreen(),
    //   ),
    // );
  }
}
