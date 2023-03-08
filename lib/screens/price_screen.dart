import 'package:flutter/material.dart';

import '../coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedValue = 'USD';

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
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        });
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
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card(
              color: Theme.of(context).primaryColor,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? $selectedValue',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child: androidDropdownButton(),
          ),
        ],
      ),
    );
  }
}
