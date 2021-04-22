import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projekt2/game_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {

  int winsCount;

  _HomePageState() {
    getData();
  }

    getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      winsCount = prefs.getInt('winsCount');
    });
  }

  @override
  Widget build(BuildContext context) {

    
    display() {
      if (winsCount != null && winsCount > 0) {
        return Text("Liczba wszystkich zwycięstw z komputerem: $winsCount", style: TextStyle(fontSize: 15));
      } else {
        return Text("Brak zwycięstw z komputerem!", style: TextStyle(fontSize: 15));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Witamy w grze kółko i krzyżyk!", style: TextStyle(fontSize: 20),),
          Center(
            child: ButtonTheme(
              minWidth: 200,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.lightBlue, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameScreen(false))
                  );
                },
                child: Text("Gra wielosobowa", style: TextStyle(fontSize: 20),),
              ),
            ),
          ),
           Center(
            child: ButtonTheme(
              minWidth: 200,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.lightBlue, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameScreen(true)), ).then((value) => getData()
                  );
                },
                child: Text("Gra jednoosobowa", style: TextStyle(fontSize: 20),),
              ),
            ),
          ),
           Center(
            child: ButtonTheme(
              minWidth: 200,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.lightBlue, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                color: Colors.lightBlue,
                onPressed: () {
                  exit(0);
                },
                child: Text("Opuść grę", style: TextStyle(fontSize: 20),),
              ),
            ),
          ),
          Center(
                child: display())
        ],
      ),
    );
  }
}