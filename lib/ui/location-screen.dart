import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zomato/bloc/bloc-provider.dart';
import 'package:flutter_zomato/bloc/location-bloc.dart';
import 'package:flutter_zomato/bloc/location-query-bloc.dart';
import 'package:flutter_zomato/models/location.dart';

class LocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;
  const LocationScreen({Key key, this.isFullScreenDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bloc = LocationQueryBloc();

    return BlocProvider(
      create: (context) => LocationQueryBloc(),
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
                  onChanged: (query) =>
                      context.bloc<LocationQueryBloc>().submitQuery(query),
                )),
            Expanded(
              child: BlocBuilder(
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
    

    // return BlocProvider<LocationQueryBloc>(
    //   bloc: bloc,
    //   child: Scaffold(
    //     appBar: AppBar(title: Text('Where do you want to eat?')),
    //     body: Column(
    //       children: <Widget>[
    //         Padding(
    //             padding: EdgeInsets.all(16.0),
    //             child: TextField(
    //               decoration: InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   hintText: 'Enter a location'),
    //               onChanged: (query) => bloc.submitQuery(query),
    //             )),
    //         Expanded(
    //           child: _buildResult(bloc),
    //         )
    //       ],
    //     ),
    //   ),
    // );
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
              
              context.bloc<LocationBloc>().selectLocation(location);

              if (isFullScreenDialog) {
                Navigator.of(context).pop();
              }
            },
          );
        },
      );
    }

  // Widget _buildResult(LocationQueryBloc bloc) {
  //   return StreamBuilder<List<Location>>(
  //     stream: bloc.locationStream,
  //     builder: (context, snapshot) {
  //       // 1
  //       final results = snapshot.data;

  //       if (results == null) {
  //         return Center(child: Text('Enter a location'));
  //       }

  //       if (results.isEmpty) {
  //         return Center(child: Text('No Results'));
  //       }

  //       return _buildSearchResults(results);
  //     },
  //   );
  // }

  // Widget _buildSearchResults(List<Location> results) {
  //   return ListView.separated(
  //     itemCount: results.length,
  //     separatorBuilder: (BuildContext context, int index) => Divider(),
  //     itemBuilder: (context, index) {
  //       final location = results[index];
  //       return ListTile(
  //         title: Text(location.title),
  //         onTap: () {
  //           // 3
  //           final locationBloc = BlocProvider.of<LocationBloc>(context);
  //           locationBloc.selectLocation(location);

  //           if (isFullScreenDialog) {
  //             Navigator.of(context).pop();
  //           }
  //         },
  //       );
  //     },
  //   );
  // }
}
