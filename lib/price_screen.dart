import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'constants.dart';
import 'IOSpicker.dart';
import 'AndroidPicker.dart';
import 'DataCard.dart';

CoinData obj = CoinData();

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  void initState() {
    super.initState();
    setData();
  }

  Widget getPicker() {
    // Checks for the platform and returns the widget for ios / android
    if (Platform.isAndroid) {
      return AndroidPicker(
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            setData();
          });
        },
      );
    } else if (Platform.isIOS) {
      return IOSpicker(
        onSelectedItemChange: (selectedIndex) {
          setState(() {
            selectedCurrency = currenciesList[selectedIndex];
            setData();
            print(selectedCurrency);
          });
        },
      );
    }
    return AndroidPicker(
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          setData();
        });
      },
    );
  }

  Future<void> setData() async {
    var function = await obj.getPrice(selectedCurrency);
    setState(() {
      if (obj.statusCode == 200) {
        btcPrice = (obj.btcPrice).toStringAsFixed(2);
        ltcPrice = (obj.ltcPrice).toStringAsFixed(2);
        ethPrice = (obj.ethPrice).toStringAsFixed(2);
        batPrice = (obj.batPrice).toStringAsFixed(2);
        neoPrice = (obj.neoPrice).toStringAsFixed(2);
        bnbPrice = (obj.bnbPrice).toStringAsFixed(2);
        name = obj.currencyName;
      } else {
        btcPrice = "ERROR.";
        ethPrice = "ERROR.";
        ltcPrice = "ERROR.";
        batPrice = "ERROR.";
        bnbPrice = "ERROR.";
        neoPrice = "ERROR.";
        name = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('₿ Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DataCard('1 BTC', btcPrice),
                  DataCard('1 ETH', ethPrice),
                  DataCard('1 LTC', ltcPrice),
                  DataCard('1 BAT', batPrice),
                  DataCard('1 BNB', bnbPrice),
                  DataCard('1 NEO', neoPrice),
                ],
              )),
          Container(
            height: 270.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 10.0),
            color: pickerColor,
            child: IOSpicker(
              onSelectedItemChange: (selectedIndex) {
                setState(() {
                  selectedCurrency = currenciesList[selectedIndex];
                  setData();
                  print(selectedCurrency);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

//ANDROID PICKER

// DropdownButton<String>(
// value: selectedCurrency,
// items: getDropDownItems(),
// onChanged: (value) {
// setState(() {
// selectedCurrency = value;
// });
// },
// ),

//IOS PICKER

// CupertinoPicker(
// itemExtent: 35.0,
// backgroundColor: Colors.lightBlue,
// onSelectedItemChanged: (selectedIndex) {
// print(selectedIndex);
// },
// children: getCupertino(),
// ),
