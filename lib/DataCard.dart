import 'package:flutter/material.dart';
import 'constants.dart';

class DataCard extends StatelessWidget {
  final currency;
  final price;
  DataCard(this.currency, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '$currency = $price $name',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
