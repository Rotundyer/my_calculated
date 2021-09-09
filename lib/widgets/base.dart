import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_calculated/params/custom_colors.dart';
import 'package:my_calculated/providers/base_data.dart';
import 'package:my_calculated/providers/base_style.dart';
import 'package:provider/provider.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseData>(
          create: (context) => BaseData(),
        ),
        ChangeNotifierProvider<BaseStyle>(create: (context) => BaseStyle()),
      ],
      child: BaseGrid(),
    );
  }
}

class BaseGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backColor = context.watch<BaseStyle>().getBackColor;
    return Scaffold(
        backgroundColor: backColor,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BaseListButton(),
                BaseText(),
                Divider(
                  color: CustomColors.border,
                  indent: 20,
                  endIndent: 20,
                ),
                BaseRow1(),
                BaseRow2(),
                BaseRow3(),
                BaseRow4(),
                BaseRow5(),
              ],
            ),
          ),
        ));
  }
}

class BaseListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            BaseStyleButton(style: 'Dark'),
            BaseStyleButton(style: 'Light'),
          ],
        )
      ],
    ));
  }
}

class BaseText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = context.watch<BaseStyle>().getTextColor;
    return Align(
      alignment: Alignment.bottomRight,
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  context.watch<BaseData>().getResult,
                  style: TextStyle(
                      color: CustomColors.text_second,
                      fontSize: 30,
                      fontFamily: 'MontserratMedium'),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 20),
            child: Text(
              context.watch<BaseData>().getNum,
              style: TextStyle(
                  color: textColor,
                  fontSize: 75,
                  fontFamily: 'MontserratMedium'),
            ),
          ),
        ],
      )),
    );
  }
}

class BaseRow1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BaseNumberButton(
            num: 'C',
            fontSize: 40,
          ),
          BaseNumberButton(
            num: '⌫',
            fontSize: 25,
          ),
          BaseNumberButton(
            num: '%',
            fontSize: 40,
          ),
          BaseGradientButton(num: '÷'),
        ],
      ),
    );
  }
}

class BaseRow2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BaseNumberButton(
            num: '7',
            fontSize: 40,
          ),
          BaseNumberButton(
            num: '8',
            fontSize: 40,
          ),
          BaseNumberButton(
            num: '9',
            fontSize: 40,
          ),
          BaseGradientButton(num: '×'),
        ],
      ),
    );
  }
}

class BaseRow3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BaseNumberButton(
            num: '4',
            fontSize: 40,
          ),
          BaseNumberButton(
            num: '5',
            fontSize: 40,
          ),
          BaseNumberButton(
            num: '6',
            fontSize: 40,
          ),
          BaseGradientButton(num: '-')
        ],
      ),
    );
  }
}

class BaseRow4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BaseNumberButton(
            num: '1',
            fontSize: 40,
          ),
          BaseNumberButton(
            num: '2',
            fontSize: 40,
          ),
          BaseNumberButton(
            num: '3',
            fontSize: 40,
          ),
          BaseGradientButton(num: '+')
        ],
      ),
    );
  }
}

class BaseRow5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = context.watch<BaseStyle>().getBackColor;
    final buttonColor = context.watch<BaseStyle>().getTextColor;
    final swipeColor = context.watch<BaseStyle>().getSwipeColor;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BaseNumberButton(
                  num: '.',
                  fontSize: 40,
                ),
                BaseNumberButton(
                  num: '0',
                  fontSize: 40,
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: ElevatedButton(
                onPressed: () {
                  context.read<BaseData>().sum();
                },
                child: Text(
                  '=',
                  style: TextStyle(
                      fontSize: 40,
                      color: textColor,
                      fontFamily: 'MontserratMedium'),
                ),
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(swipeColor),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(buttonColor),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                )),
          ))
        ],
      ),
    );
  }
}

class BaseNumberButton extends StatelessWidget {
  final String num;
  final double fontSize;

  BaseNumberButton({required this.num, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final buttonColor = context.watch<BaseStyle>().getButtonColor;
    final textColor = context.watch<BaseStyle>().getTextColor;
    return ElevatedButton(
      onPressed: () {
        context.read<BaseData>().changeNum(num);
      },
      child: Text(
        '$num',
        style: TextStyle(color: textColor, fontSize: fontSize, fontFamily: 'MontserratMedium'),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(65, 65),
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        primary: buttonColor,
      ),
    );
  }
}

class BaseGradientButton extends StatelessWidget {
  final String num;

  BaseGradientButton({required this.num});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(0.0),
      ),
      onPressed: () {
        context.read<BaseData>().changeNum(num);
      },
      child: Ink(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient:
              LinearGradient(colors: [CustomColors.blue, CustomColors.purple]),
        ),
        child: Center(
          child: Text(
            '$num',
            style: TextStyle(
                color: CustomColors.white,
                fontSize: 40,
                fontFamily: 'MontserratMedium'),
          ),
        ),
      ),
    );
  }
}

class BaseStyleButton extends StatelessWidget {
  final String style;

  BaseStyleButton({required this.style});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: ElevatedButton(
          onPressed: () {
            context.read<BaseStyle>().swapStyle(style);
          },
          child: Text(
            style,
            style: TextStyle(
                fontSize: 30,
                color:
                    style != 'Dark' ? CustomColors.black : CustomColors.white,
                fontFamily: 'MontserratMedium'),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(
              style == 'Dark' ? CustomColors.white_30 : CustomColors.black_30,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              style == 'Dark' ? CustomColors.grey_black : CustomColors.white,
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
          )),
    ));
  }
}
