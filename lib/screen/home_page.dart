import 'package:flutter/material.dart';
import 'package:untitled/widets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Appbar',
        ),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome in my app'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
