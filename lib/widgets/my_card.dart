import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String crypto;
  final String coinValue;
  final String selectedCurrency;

  const MyCard(
      {required this.crypto,
      required this.coinValue,
      required this.selectedCurrency,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $crypto = $coinValue $selectedCurrency',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
