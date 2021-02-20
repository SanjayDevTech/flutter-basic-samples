import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_samples/app/theme.dart';
import 'package:flutter_basic_samples/home/home_screen.dart';
import 'package:flutter_basic_samples/loading.dart';
import 'package:flutter_basic_samples/login/login_screen.dart';

class FireChatApp extends StatelessWidget {
  final _firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: FutureBuilder(
        future: _firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Column(
                children: [
                  Text('Something went Wrong'),
                  Text('${snapshot.error}'),
                ],
              ),
            );

          if (snapshot.connectionState == ConnectionState.done) {
            print(FirebaseAuth.instance.currentUser == null);
            if (FirebaseAuth.instance.currentUser == null) return LoginScreen();
            else return HomeScreen();
          }

          return LoadingScreen();
        },
      ),
    );
  }
}
