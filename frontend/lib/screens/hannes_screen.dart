import 'package:flutter/material.dart';
import 'package:flutter_statefull_example/screens/banking_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'felix_screen.dart' show FelixScreen;

class HannesScreen extends StatelessWidget {
  const HannesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcead9c),
      body: ListView(padding: const EdgeInsets.all(0), children: [
        Image.asset("images/Hannes_Flutter.png"),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Hannes Scheibelauer",
            style: TextStyle(
                fontSize: 34,
                color: Color.fromARGB(255, 51, 71, 82),
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(30),
          child: Text(
            "Ich bin ein 17 jähriger Schüler der It-htl ybbs der sich gerne mit Web-, software- und game- development beschäftigt. Aktuell lerne ich Rust und arbeite an einen 3D Game.",
            style: GoogleFonts.roboto(
                fontSize: 24, color: Colors.black, height: 1.5),
          ),
        ),
        Center(
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                  /*side: MaterialStatePropertyAll<BorderSide>(
                      BorderSide(width: 3)),*/
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 20)),
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 156, 188, 206))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FelixScreen()));
              },
              child: const Text(
                "Zu Felix",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              )),
        ),
        Container(
          height: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/triangles.png"),
                  fit: BoxFit.cover)),
        ),
      ]),
      floatingActionButton: SizedBox(
        width: 75,
        height: 75,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BankingData()));
          },
          child: const Icon(Icons.attach_money, size: 35),
        ),
      ),
    );
  }
}
