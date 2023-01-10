import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../classes/card.dart';
import 'dart:convert';

class BankingData extends StatefulWidget {
  const BankingData({super.key});

  @override
  State<BankingData> createState() => _BankingDataState();
}

class _BankingDataState extends State<BankingData> {
  late Future<BankingCard> futureCardInfos;

  @override
  void initState() {
    super.initState();
    futureCardInfos = fetchBankData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bankdaten"),
        ),
        body: Center(
          child: FutureBuilder<BankingCard>(
            future: futureCardInfos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<String> help = [];
                help.add(snapshot.data!.image);
                help.add(snapshot.data!.card_number);
                help.add(snapshot.data!.iban);
                help.add(snapshot.data!.bic);
                help.add(snapshot.data!.expires);
                return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return ImageWidget(
                          path: snapshot.data!.image,
                        );
                      } else {
                        return CardInfos(
                          index: index,
                          text: help[index],
                        );
                      }
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}

class ImageWidget extends StatefulWidget {
  final String path;
  const ImageWidget({required this.path, super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(50),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 62, 62, 62),
                spreadRadius: 0,
                blurRadius: 20,
              )
            ],
            image: DecorationImage(
                image: AssetImage("images/${widget.path}.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}

class CardInfos extends StatefulWidget {
  final int index;
  final String text;

  const CardInfos({required this.index, required this.text, super.key});

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
  ];
  List<IconData> iconsForLines = [
    Icons.credit_card,
    Icons.credit_card,
    Icons.numbers,
    Icons.numbers,
    Icons.date_range,
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
            "${titleOfLine[widget.index]}: ${widget.text}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
    );
  }
}

Future<BankingCard> fetchBankData() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8080/banking/random'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return BankingCard.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}
