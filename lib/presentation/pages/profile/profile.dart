import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CircleAvatar(
            radius: 100,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
