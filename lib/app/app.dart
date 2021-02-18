import 'package:flutter/material.dart';
import 'package:flutter_basic_samples/app/theme.dart';
import 'package:flutter_basic_samples/home/home_screen.dart';

class RocketGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: HomeScreen(),
    );
  }
}
