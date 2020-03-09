import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zomato/models/location.dart';
import 'bloc.dart';

class LocationBloc extends Bloc<Location, Location> {
  
  Location _location;
  Location get selectedLocation => _location;

  // final _controller = StreamController<Location>();

  // Stream<Location> get locationStream => _controller.stream;
  
  void selectLocation(Location location) {
    _location = location;
    this.add(location);
    // _controller.sink.add(location);
  }

  // @override
  // void dispose() {
  //   _controller.close();
  // }

  @override
  Location get initialState => null;

  @override
  Stream<Location> mapEventToState(Location event) async* {
    yield event;
  }
}
