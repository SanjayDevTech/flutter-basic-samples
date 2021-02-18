import 'package:flutter/material.dart';
import 'package:flutter_basic_samples/backend/backend.dart';

class RocketListTile extends StatelessWidget {
  const RocketListTile({
    Key key,
    @required this.onTap,
    @required this.rocket,
  })  : assert(rocket != null),
        super(key: key);

  final VoidCallback onTap;
  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(rocket.name),
      subtitle: Text(rocket.description),
    );
  }
}
