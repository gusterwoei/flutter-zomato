import 'package:flutter/material.dart';
import 'package:flutter_zomato/models/restaurant.dart';
import 'package:flutter_zomato/ui/image-container.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    Key key,
    @required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageContainer(width: 50, height: 50, url: restaurant.thumbUrl),
      title: Text(restaurant.name),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}