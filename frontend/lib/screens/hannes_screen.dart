import 'package:flutter/material.dart';
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
            style: TextStyle(fontSize: 34),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(30),
          child: Text(
            "Ich bin ein 17 jähriger Schüler der It-htl ybbs der sich gerne mit Web-, software- und game- development beschäftigt. Aktuell beschäftige ich mich mit Flutter und Blender.",
            style: GoogleFonts.roboto(fontSize: 24),
          ),
        ),
        Center(
          child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FelixScreen()));
              },
              child: const Text(
                "0",
                style: TextStyle(fontSize: 24),
              )),
        ),
        Positioned(
          top: -100,
          child: Image.asset(
            "images/triangles.png",
          ),
        )
      ]),
    );
  }
}
