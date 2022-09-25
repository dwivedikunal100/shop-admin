import 'package:flutter/material.dart';

class ShopAdmin extends StatefulWidget {
  const ShopAdmin({super.key});


  @override
  State<ShopAdmin> createState() => _ShopAdmin();
}

class _ShopAdmin extends State<ShopAdmin> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Portal"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),// This trailing comma makes auto-formatting nicer for build methods.
     ),);
  }
}