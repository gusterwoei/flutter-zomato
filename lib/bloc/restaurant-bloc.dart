
import 'dart:async';

import 'package:flutter_zomato/bloc/bloc.dart';
import 'package:flutter_zomato/models/location.dart';
import 'package:flutter_zomato/models/restaurant.dart';
import 'package:flutter_zomato/services/zomato-client.dart';

class RestaurantBloc extends Bloc {
  final Location location;
  final _client = ZomatoClient();
  final _controller = StreamController<List<Restaurant>>();
  Stream<List<Restaurant>> get stream => _controller.stream;

  RestaurantBloc(this.location);

  void submitQuery(String query) async {
    final results = await _client.fetchRestaurants(location, query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}