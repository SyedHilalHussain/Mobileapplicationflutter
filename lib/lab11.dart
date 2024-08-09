
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListTile Exercises'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Exercise1(),
              Exercise2(),
              Exercise3(),
            ],
          ),
        ),
      ),
    );
  }
}

// Question 1: ListTile with CircleAvatar, Trailing Icon, and Padding
class Exercise1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('MD'),
        ),
        title: Text('Maaz Nadeem'),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}

// Question 2: ListView of ListTiles with Different CircleAvatars and Padding
class Exercise2 extends StatelessWidget {
  final List<Map<String, String>> users = [
    {"initials": "AB", "title": "Alice Brown", "subtitle": "Developer"},
    {"initials": "CD", "title": "Charlie Davis", "subtitle": "Designer"},
    {"initials": "EF", "title": "Eve Foster", "subtitle": "Manager"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        shrinkWrap: true, // Added to prevent infinite height error
        physics: NeverScrollableScrollPhysics(), // Added to prevent nested scroll conflict
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(user['initials']!),
            ),
            title: Text(user['title']!),
            subtitle: Text(user['subtitle']!),
          );
        },
      ),
    );
  }
}

// Question 3: ListTile with CircleAvatar, Padding, and an onTap Event
class Exercise3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo_flutter.jpg'),// Ensure you have an image in assets

        ),
        title: Text('Profile Name'),
        onTap: () {
          print('Tile tapped');
        },
      ),
    );
  }
}
