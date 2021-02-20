import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_samples/home/messages_list.dart';
import 'package:flutter_basic_samples/login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            tooltip: 'Sign out',
            icon: Icon(Icons.logout),
            onPressed: () async {
              try {
                await auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Cannot sign out')));
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: MessagesList()),
          _buildChatBox(),
        ],
      ),
    );
  }

  Widget _buildChatBox() {
    return Row(
      children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(),
        )),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {},
        ),
      ],
    );
  }
}
