import 'package:flutter/material.dart';

class BankingData extends StatefulWidget {
  const BankingData({super.key});

  @override
  State<BankingData> createState() => _BankingDataState();
}

class _BankingDataState extends State<BankingData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bankdaten"),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const ImageWidget();
            } else {
              return CardInfos(
                index: index,
              );
            }
          }),
    );
  }
}

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(50),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 62, 62, 62),
            spreadRadius: 0,
            blurRadius: 20,
          )
        ]),
        child: Image.asset("images/card.png"),
      ),
    );
  }
}

class CardInfos extends StatefulWidget {
  final int index;

  const CardInfos({required this.index, super.key});

  @override
  State<CardInfos> createState() => _CardInfosState();
}

class _CardInfosState extends State<CardInfos> {
  List<String> titleOfLine = [
    "image",
    "card number",
    "iban",
    "bic",
    "valid until",
    "expires",
  ];
  List<IconData> iconsForLines = [
    Icons.credit_card,
    Icons.credit_card,
    Icons.numbers,
    Icons.numbers,
    Icons.date_range,
    Icons.abc_rounded
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Color.fromARGB(255, 58, 58, 58), width: 3))),
      child: ListTile(
          leading: Icon(
            iconsForLines[widget.index],
            size: 30,
          ),
          title: Text(
            "${titleOfLine[widget.index]}: Text",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
    );
  }
}
