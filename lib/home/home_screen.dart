import 'package:flutter/material.dart';
import 'package:flutter_basic_samples/backend/backend.dart';
import 'package:flutter_basic_samples/home/rocket_list_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Guide'),
      ),
      body: FutureBuilder<List<Rocket>>(
        future: Backend("").getRockets(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return Center(child: Text('Error'));
          return ListView(
            children: snapshot.data
                .map((e) => RocketListTile(onTap: () {}, rocket: e))
                .toList(),
          );
        },
      ),
    );
  }
}
