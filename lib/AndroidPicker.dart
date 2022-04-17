import 'package:flutter/material.dart';
import 'constants.dart';
import 'coin_data.dart';

class AndroidPicker extends StatelessWidget {
  final Function onChanged;
  AndroidPicker({this.onChanged});

  @override
  Widget build(BuildContext context) {
    //ANDROID PICKER
    List<DropdownMenuItem<String>> dropItems = [];

    for (String item in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(item),
        value: item,
      );
      dropItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
      iconEnabledColor: Colors.black,
      iconSize: 40.0,
      items: dropItems,
      dropdownColor: cardColor,
      onChanged: onChanged,
    );
  }
}
