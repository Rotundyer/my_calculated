import 'package:flutter/widgets.dart';
import 'package:function_tree/function_tree.dart';
import 'package:my_calculated/params/custom_colors.dart';

class BaseStyle with ChangeNotifier {
  List _styleList = ['Dark', 'Light'];
  Color _backColor = CustomColors.black;
  Color _buttonColor = CustomColors.grey_black;
  Color _textColor = CustomColors.white;
  Color _swipeColor = CustomColors.black_30;

  List get getStyleList => _styleList;
  Color get getBackColor => _backColor;
  Color get getButtonColor => _buttonColor;
  Color get getTextColor => _textColor;
  Color get getSwipeColor => _swipeColor;

  final blackColor = CustomColors.black;
  final whiteColor = CustomColors.white;

  void swapStyle(String style) {
    if (style == 'Dark') {
      _backColor = CustomColors.black;
      _buttonColor = CustomColors.grey_black;
      _textColor = CustomColors.white;
      _swipeColor = CustomColors.black_30;
    } else {
      _backColor = CustomColors.white;
      _buttonColor = CustomColors.grey_white;
      _textColor = CustomColors.grey_black;
      _swipeColor = CustomColors.white_30;
    }
    notifyListeners();
  }
}
