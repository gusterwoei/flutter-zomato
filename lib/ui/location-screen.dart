import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zomato/bloc/location-query-bloc.dart';
import 'package:flutter_zomato/models/location.dart';
import 'package:flutter_zomato/ui/restaurant-screen.dart';

class LocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;
  const LocationScreen({Key key, this.isFullScreenDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LocationQueryBloc();
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(title: Text('Where do you want to eat?')),
        body: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a location'),
                  onChanged: (query) {
                    // final b = context.bloc<LocationBloc>();
                    bloc.submitQuery(query);
                  },
                )),
            Expanded(
              child: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  final results = state;

                  if (results == null) {
                    return Center(child: Text('Enter a location'));
                  }

                  if (results.isEmpty) {
                    return Center(child: Text('No Results'));
                  }

                  return _buildSearchResults(results);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults(List<Location> results) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final location = results[index];
        return ListTile(
          title: Text(location.title),
          onTap: () {
            // context.bloc<LocationBloc>().selectLocation(location);

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RestaurantScreen(location: location) ));

            if (isFullScreenDialog) {
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }
  
}
