
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zomato/models/location.dart';
import 'package:flutter_zomato/models/restaurant.dart';
import 'package:flutter_zomato/services/zomato-client.dart';

class RestaurantBloc extends Bloc<List<Restaurant>, List<Restaurant>> {
  final Location location;
  final _client = ZomatoClient();

  RestaurantBloc(this.location);

  void submitQuery(String query) async {
    final results = await _client.fetchRestaurants(location, query);
    this.add(results);
  }

  @override
  get initialState => List<Restaurant>();

  @override
  Stream<List<Restaurant>> mapEventToState(List<Restaurant> event) async* {
    yield event;
  }

  
}