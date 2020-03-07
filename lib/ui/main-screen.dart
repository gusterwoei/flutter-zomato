import 'package:flutter/material.dart';
import 'package:flutter_zomato/bloc/bloc-provider.dart';
import 'package:flutter_zomato/bloc/location-bloc.dart';
import 'package:flutter_zomato/models/location.dart';
import 'package:flutter_zomato/ui/location-screen.dart';
import 'package:flutter_zomato/ui/restaurant-screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Location>(
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (context, snapshot) {
        final location = snapshot.data;
        
        if (location == null) return LocationScreen();

        // Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantScreen(location: location)));

        return RestaurantScreen(location: location);
      },
    );
  }
}
