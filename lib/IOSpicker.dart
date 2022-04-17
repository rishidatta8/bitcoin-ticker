import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'constants.dart';

class IOSpicker extends StatelessWidget {
  final Function onSelectedItemChange;
  IOSpicker({this.onSelectedItemChange});

  @override
  Widget build(BuildContext context) {
    //IOS PICKER
    List<Text> itemList = [];

    for (String item in currenciesList) {
      Widget listWidgget = Text(item);
      itemList.add(listWidgget);
    }

    return CupertinoPicker(
      itemExtent: 39.0,
      diameterRatio: 1.0,
      backgroundColor: pickerColor,
      onSelectedItemChanged: onSelectedItemChange,
      children: itemList,
    );
  }
}
