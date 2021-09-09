import 'package:flutter/material.dart';
import 'package:my_calculated/params/custom_colors.dart';
import 'package:my_calculated/widgets/base.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: CustomColors.black),
      initialRoute: '/',
      routes: {
        '/': (context) => Base(),
      },
    ));
