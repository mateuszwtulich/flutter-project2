import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projekt2/winner_determination.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'alert_dialog.dart';
import 'constants.dart';

class GameScreen extends StatefulWidget {

  final bool gameOption;
  GameScreen(this.gameOption);

  @override
  _GameScreenState createState() => _GameScreenState(this.gameOption);
}

class _GameScreenState extends State<GameScreen> {
  int _scoreX = 0;
  int _scoreO = 0;
  bool _turnOfO = true;
  int _filledBoxes = 0;
  final List<String> _xOrOList = new List<String>.generate(100, (index) => '');

  final bool gameOption;
  _GameScreenState(this.gameOption);

  @override
  Widget build(BuildContext context) {
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return _landscapeContent();
      case Orientation.portrait:
      default:
        return _portraitContent();
    }
  }

  Widget _portraitContent() {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _clearBoard();
            },
          )
        ],
        title: Text(
          'Kółko i krzyżyk',
          style: kCustomText(
              fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          _buildPointsTable(),
          _buildGrid(),
          _buildTurn(),
        ],
      ),
    );
  }

  Widget _landscapeContent() {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  _clearBoard();
                },
              )
            ],
            title: Text(
              'Kółko i krzyżyk',
              style: kCustomText(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          )),
      body: Row(
        children: [
          _buildPointsTableLandscape(),
          _buildGrid(),
          _buildTurnLandscape(),
        ],
      ),
    );
  }

  Widget _buildPointsTable() {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Gracz O',
                    style: kCustomText(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _scoreO.toString(),
                    style: kCustomText(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                children: [
                  Text(
                    this.gameOption ? 'Komputer' : 'Gracz X',
                    style: kCustomText(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _scoreX.toString(),
                    style: kCustomText(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPointsTableLandscape() {
    return Container(
      child: Padding(
      padding: const EdgeInsets.only(left: 72.0, right: 72.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Gracz O',
                    style: kCustomText(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _scoreO.toString(),
                    style: kCustomText(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
              ),
              child: Column(
                children: [
                  Text(
                    this.gameOption ? 'Komputer' : 'Gracz X',
                    style: kCustomText(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _scoreX.toString(),
                    style: kCustomText(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
          itemCount: 100,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white, width: 1.0), color: Colors.lightBlueAccent),
                child: Center(
                  child: Text(
                    _xOrOList[index],
                    style: TextStyle(
                      color:
                          _xOrOList[index] == 'x' ? Colors.white : Colors.black,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildTurn() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            this.gameOption ? 'Jesteś O' : _turnOfO ? 'Kolej na O' : 'Kolej na X',
            style: kCustomText(color: Colors.black, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget _buildTurnLandscape() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Center(
          child: Text(
            this.gameOption ? 'Jesteś O' : _turnOfO ? 'Kolej na O' : 'Kolej na X',
            style: kCustomText(color: Colors.black, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

    void _tapped(int index) {
    setState(() {
      if (this.gameOption) {
        if (_xOrOList[index] == '') {
          _xOrOList[index] = 'o';
          _filledBoxes += 1;
          Random random = new Random();
          int randomNumber = random.nextInt(100);
          while (_xOrOList[randomNumber] != '') {
            randomNumber = random.nextInt(100);
          }
          _xOrOList[randomNumber] = 'x';
          _filledBoxes += 1;
        }
      } else {
        if (_turnOfO && _xOrOList[index] == '') {
          _xOrOList[index] = 'o';
          _filledBoxes += 1;
        } else if (!_turnOfO && _xOrOList[index] == '') {
          _xOrOList[index] = 'x';
          _filledBoxes += 1;
        }
        _turnOfO = !_turnOfO;
      }

      var result = WinnerDeterminator().checkTheWinner(index, _xOrOList, _filledBoxes);
      
      if (result != '') {
        if (result == 'DRAW') {
          _showAlertDialog('Draw', '');
        } else {
          _showAlertDialog('Winner', _xOrOList[index]);

          if (this.gameOption && _xOrOList[index] == 'o') {
            saveWinWithComputer();
          }
        }
      }
    });
  }

  void _showAlertDialog(String title, String winner) {
    showAlertDialog(
        context: context,
        title: title,
        content: winner == ''
            ? 'The match ended in a draw'
            : 'The winner is ${winner.toUpperCase()}',
        defaultActionText: 'OK',
        onOkPressed: () {
          _clearBoard();
          Navigator.of(context).pop();
        });

    if (winner == 'o') {
      _scoreO += 1;
    } else if (winner == 'x') {
      _scoreX += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 100; i++) {
        _xOrOList[i] = '';
      }
    });

    _filledBoxes = 0;
  }

  Future<void> saveWinWithComputer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var wins = prefs.getInt('winsCount');
    if (wins != null) {
      prefs.setInt('winsCount', wins + 1);
    } else {
      prefs.setInt('winsCount', 1);
    }
  }
}