import 'dart:async';
import 'package:flutter_zomato/models/location.dart';
import 'package:flutter_zomato/services/zomato-client.dart';
import 'bloc.dart';

class LocationQueryBloc extends Bloc {
  final _controller = StreamController<List<Location>>();
  final _client = ZomatoClient();

  Stream<List<Location>> get locationStream => _controller.stream;

  void submitQuery(String query) async {
    final results = await _client.fetchLocations(query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
