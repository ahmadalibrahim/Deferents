import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text('First App '),
        actions: [
          IconButton(
              icon: Icon(Icons.notification_important),
              onPressed: notificationButtonClickied),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print('search icon ');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 100.0,
              color: Colors.red,
              child: Text(
                'First Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100.0,
              color: Colors.green,
              child: Text(
                'Second Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100.0,
              color: Colors.blue,
              child: Text(
                'Third  Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          
          Expanded(
            flex: 1,
            child: Container(
              height: 100.0,
              color: Colors.yellow,
              child: Text(
                'Fourth Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void notificationButtonClickied() {
    print('notification Button is Clickied');
  }
}
