import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zomato/models/location.dart';
import 'package:flutter_zomato/services/zomato-client.dart';
// import 'bloc.dart';

class LocationQueryBloc extends Bloc<List<Location>, List<Location>> {
  final _client = ZomatoClient();

  void submitQuery(String query) async {
    if (query.trim() == "") {
      this.add([]);
      return;
    }
    final results = await _client.fetchLocations(query);
    this.add(results);
  }

  @override
  List<Location> get initialState => List<Location>();

  @override
  Stream<List<Location>> mapEventToState(List<Location> event) async* {
    yield event;
  }
}
