import 'package:flutter/widgets.dart';
import 'package:function_tree/function_tree.dart';

class BaseData with ChangeNotifier {
  String _num = '0';
  String _result = '';
  String _lastNum = '';
  String _lastCheck = '';

  bool _check = false;

  String get getNum => _num;

  String get getResult => _result;

  void sum() {
    if (_result.substring(_result.length - 1) != '=') {
      print(_result);
      var sum = ('$_result $_num').replaceAll('÷', '/').replaceAll('×', '*').interpret();
      _result += ' $_num =';
      if (sum.toString().substring(sum.toString().length - 1) == '0') {
        _lastNum = _num;
        _num = sum.toInt().toString();
      } else {
        _lastNum = _num;
        _num = sum.toStringAsFixed(7 - sum.toInt().toString().length);
      }
    } else {
      _result = '$_num $_lastCheck $_lastNum =';
      var sum = '$_num $_lastCheck $_lastNum'.interpret();
      if (sum.toString().substring(sum.toString().length - 1) == '0') {
        _num = sum.toInt().toString();
      } else {
        _num = sum.toString();
      }
    }
    _check = true;
    notifyListeners();
  }

  void changeNum(String newNum) {
    switch (newNum) {
      case 'C':
        clear();
        break;
      case '⌫':
        _num = _num.substring(0, _num.length - 1);
        if (_num.length == 0) _num = '0';
        break;
      case '%':
        swap(newNum);
        break;
      case '.':
        if (_num != '') _num += newNum;
        _check = false;
        break;
      case '+':
        swap(newNum);
        break;
      case '-':
        swap(newNum);
        break;
      case '÷':
        swap(newNum);
        break;
      case '×':
        swap(newNum);
        break;
      default:
        if (_num.length < 9) {
          if (_check && _result.length != 0 && _result.substring(_result.length - 1) == '=')
            _result = '$_num $_lastCheck';
          if (_num == '0' || _check) _num = '';
          _check = false;
          _num += newNum;
        }
    }

    notifyListeners();
  }

  void swap(String newNum) {
    if (_result == '') {
      _result = '$_num $newNum';
    } else if (_result.substring(_result.length - 1) == '=') {
      if (_lastCheck == newNum) {
        _result = '$_num $newNum $_lastNum =';
        sum();
      } else {
        _result = '$_num $newNum';
        _num = '';
      }
    } else if (_result.substring(_result.length - 1) == '$newNum') {
      sum();
    } else {
      _result = '${_result.substring(0, _result.length - 1)} $newNum';
    }
    _check = true;
    _lastCheck = '$newNum';
  }

  void clear() {
    _num = '0';
    _result = '';
  }
}