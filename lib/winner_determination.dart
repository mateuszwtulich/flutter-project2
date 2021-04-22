class WinnerDeterminator {
    String checkTheWinner(int index, List<String> _xOrOList, int _filledBoxes) {
    var rowCounter = 1;
    var colCounter = 1;
    var diagCounter1 = 1;
    var diagCounter2 = 1;

    var i = 1;
    while (index + i < 100 &&
        _xOrOList[index] == _xOrOList[index + i] &&
        _xOrOList[index] != '') {
      rowCounter++;
      i++;
    }
    var j = 1;
    while (index - j >= 0 &&
        _xOrOList[index] == _xOrOList[index - j] &&
        _xOrOList[index] != '') {
      rowCounter++;
      j++;
    }
    var k = 1;
    while (index + (10 * k) < 100 &&
        _xOrOList[index] == _xOrOList[index + (10 * k)] &&
        _xOrOList[index] != '') {
      colCounter++;
      k++;
    }
    var l = 1;
    while (index - (10 * l) >= 0 &&
        _xOrOList[index] == _xOrOList[index - (10 * l)] &&
        _xOrOList[index] != '') {
      colCounter++;
      l++;
    }
    var m = 1;
    while (index + (10 * m) + m < 100 &&
        _xOrOList[index] == _xOrOList[index + (10 * m) + m] &&
        _xOrOList[index] != '') {
      diagCounter1++;
      m++;
    }
    var n = 1;
    while (index - (10 * n) - n >= 0 &&
        _xOrOList[index] == _xOrOList[index - (10 * n) - n] &&
        _xOrOList[index] != '') {
      diagCounter1++;
      n++;
    }
    var o = 1;
    while (index + (10 * o) - o < 100 &&
        _xOrOList[index] == _xOrOList[index + (10 * o) - o] &&
        _xOrOList[index] != '') {
      diagCounter2++;
      o++;
    }
    var p = 1;
    while (index - (10 * p) + p >= 0 &&
        _xOrOList[index] == _xOrOList[index - (10 * p) + p] &&
        _xOrOList[index] != '') {
      diagCounter2++;
      p++;
    }
    if (rowCounter >= 5 ||
        colCounter >= 5 ||
        diagCounter1 >= 5 ||
        diagCounter2 >= 5) {
        return _xOrOList[index];
        }
    else if (_filledBoxes == 100) {
      return 'DRAW';
    } else {
      return '';
    }
  }
}