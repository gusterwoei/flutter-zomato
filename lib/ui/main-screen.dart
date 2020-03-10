import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_zomato/bloc/bloc-provider.dart';
import 'package:flutter_zomato/bloc/location-bloc.dart';
import 'package:flutter_zomato/models/location.dart';
import 'package:flutter_zomato/ui/location-screen.dart';
import 'package:flutter_zomato/ui/restaurant-screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, Location>(
      bloc: LocationBloc(),
      builder: (context, state) {
        final location = state;
        
        if (location == null) return LocationScreen();

        return RestaurantScreen(location: location);
      },
    );
  }
}
