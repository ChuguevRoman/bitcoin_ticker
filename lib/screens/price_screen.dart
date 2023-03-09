import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

@override
  void initState() {
    super.initState();
    getData();
  }

  String? selectedCurrency = 'AUD';
  String coinValue = '?';



  void getData() async {
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      setState(() {
        coinValue = data;
      });
    } catch (e) {
      throw 'Problem with the get request\nError $e';
    }
  }

  DropdownButton<String> androidDropdownButton() {
    List<DropdownMenuItem<String>> itemList = [];
    for (String currency in currenciesList) {
      itemList.add(
        DropdownMenuItem(
          value: currency,
          child: Text(currency),
        ),
      );
    }
    return DropdownButton(
        items: itemList,
        value: selectedCurrency,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            getData();
          });
        });
  }

  CupertinoPicker iOSCupertinoPicker() {
    List<Text> itemList = [];
    for (String currency in currenciesList) {
      itemList.add(Text(currency));
    }
    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            selectedCurrency = currenciesList[selectedIndex];
          });
        },
        children: itemList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: null,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child:
                Platform.isIOS ? iOSCupertinoPicker() : androidDropdownButton(),
          ),
        ],
      ),
    );
  }
}
