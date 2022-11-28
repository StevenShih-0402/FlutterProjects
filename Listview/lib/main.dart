import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listview'),
          backgroundColor: Color(0xFF006064),
        ),
        body: HomePage(),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        );


        // ListView.builder(
        //   padding: const EdgeInsets.all(8),
        //   itemCount: entries.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       height: 50,
        //       color: Colors.amber[colorCodes[index]],
        //       child: Center(child: Text('Entry ${entries[index]}')),
        //     );
        //   }
        // ),
        //
        // ListView.separated(
        //   padding: const EdgeInsets.all(8),
        //   itemCount: entries.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       height: 50,
        //       color: Colors.amber[colorCodes[index]],
        //       child: Center(child: Text('Entry ${entries[index]}')),
        //     );
        //   },
        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
        // ),

  }
}