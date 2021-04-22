// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:projekt2/winner_determination.dart';

void main() {
  
  test('No winner should be found', () {
    final winnerDeterminator = WinnerDeterminator();
    final index = 10;
    var _xOrOList = new List<String>.generate(100, (index) => '');
    var _filledBoxes = 0;
      for (int i = 0; i < 100; i++) {
        if(i==3 || i==13 || i==33 || i==37 || i==73) {
          _xOrOList[i] = 'x';
          _filledBoxes++;
        }
        if(i==31 || i==39 || i==83 || i==43 || i==23) {
          _xOrOList[i] = 'o';
          _filledBoxes++;
        }
      }
    
    expect(winnerDeterminator.checkTheWinner(index, _xOrOList, _filledBoxes), '');
  });

  test('Winner x in row should be found', () {
    final winnerDeterminator = WinnerDeterminator();
    final index = 93;
    var _xOrOList = new List<String>.generate(100, (index) => '');
    var _filledBoxes = 0;
      for (int i = 0; i < 100; i++) {
        if(i==3 || i==13 || i==33 || i==37 || i==73 || i==91 || i==92 || i==93 || i==94 || i==95) {
          _xOrOList[i] = 'x';
          _filledBoxes++;
        }
        if(i==31 || i==39 || i==83 || i==43 || i==23) {
          _xOrOList[i] = 'o';
          _filledBoxes++;
        }
      }
    
    expect(winnerDeterminator.checkTheWinner(index, _xOrOList, _filledBoxes), 'x');
  });

  test('Winner o in column should be found', () {
    final winnerDeterminator = WinnerDeterminator();
    final index = 73;
    var _xOrOList = new List<String>.generate(100, (index) => '');
    var _filledBoxes = 0;
      for (int i = 0; i < 100; i++) {
        if(i==3 || i==13 || i==33 || i==37 || i==93) {
          _xOrOList[i] = 'x';
          _filledBoxes++;
        }
        if(i==31 || i==39 || i==83 || i==43 || i==23 || i==53 || i==63 || i==73 || i==83) {
          _xOrOList[i] = 'o';
          _filledBoxes++;
        }
      }
    
    expect(winnerDeterminator.checkTheWinner(index, _xOrOList, _filledBoxes), 'o');
  });

  test('Winner x in diagonal right should be found', () {
    final winnerDeterminator = WinnerDeterminator();
    final index = 25;
    var _xOrOList = new List<String>.generate(100, (index) => '');
    var _filledBoxes = 0;
      for (int i = 0; i < 100; i++) {
        if(i==3 || i==14 || i==33 || i==37 || i==73 || i==25 || i==36 || i==47) {
          _xOrOList[i] = 'x';
          _filledBoxes++;
        }
        if(i==31 || i==39 || i==83 || i==43 || i==23) {
          _xOrOList[i] = 'o';
          _filledBoxes++;
        }
      }
    
    expect(winnerDeterminator.checkTheWinner(index, _xOrOList, _filledBoxes), 'x');
  });

    test('Winner o in diagonal left should be found', () {
    final winnerDeterminator = WinnerDeterminator();
    final index = 64;
    var _xOrOList = new List<String>.generate(100, (index) => '');
    var _filledBoxes = 0;
      for (int i = 0; i < 100; i++) {
        if(i==3 || i==13 || i==33 || i==37 || i==73) {
          _xOrOList[i] = 'x';
          _filledBoxes++;
        }
        if(i==31 || i==39 || i==83 || i==55 || i==23 || i==64 || i==73 || i==82 || i==91 || i==23) {
          _xOrOList[i] = 'o';
          _filledBoxes++;
        }
      }
    
    expect(winnerDeterminator.checkTheWinner(index, _xOrOList, _filledBoxes), 'o');
  });

  test('Draw should be found', () {
    final winnerDeterminator = WinnerDeterminator();
    final index = 10;
    var _xOrOList = new List<String>.generate(100, (index) => '');
    var _filledBoxes = 100;
    
    expect(winnerDeterminator.checkTheWinner(index, _xOrOList, _filledBoxes), 'DRAW');
  });
}
