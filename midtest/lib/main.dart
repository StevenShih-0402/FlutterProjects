import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('408630852_image'),
          backgroundColor: Color(0xFF006064),
        ),
        body: HomePage(),
        backgroundColor: Colors.lightBlue[100],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = 0;

    var backbtn = ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo[900], // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: () {
        (controller > 0) ? controller-- : controller == 0;
      },
      child: Text('▲ Back'),
    );

    var nextbtn = ElevatedButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.cyan[900],
      ),
      onPressed: () {
        (controller < 3) ? controller++ : controller == 3;
      },
      child: Text('▼ Next'),
    );



    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 800,
          height: 500,
          child: imgSet(context, controller),
          alignment: Alignment.topCenter,
          margin: EdgeInsets.all(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Container(
              child: backbtn,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(20),
            ),
            Container(
              child: nextbtn,
              alignment: Alignment.topRight,
              margin: EdgeInsets.all(20),
            ),
          ],
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String msg){
    final snackbar = SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      action: SnackBarAction(
        label: 'Toast',
        textColor: Colors.white,
        onPressed: () => Fluttertoast.showToast(
          msg: '按下了SnackBar',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 20,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  TextButton imgSet(BuildContext context, var controller){
    var photo = [
      'pic/0.png',
      'pic/1.png',
      'pic/2.png',
      'pic/3.png',
    ];
    return TextButton(
      onPressed: () {
        _showSnackBar(context, 'photo: $controller');
      },
      child: Image.asset(photo[controller]),
    );
  }
}