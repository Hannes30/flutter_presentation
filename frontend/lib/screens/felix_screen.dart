import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/glass_card.dart' show GlassCard;
import 'hannes_screen.dart' show HannesScreen;

class FelixScreen extends StatelessWidget {
  final TextStyle regularFont = const TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
  );

  final TextStyle headFont = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 32,
    letterSpacing: 1.8,
  );

  const FelixScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.white.withOpacity(.16),
              Color.fromARGB((255 * .09).round(), 193, 215, 217),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Transform.scale(
                scale: 1.8,
                child: SvgPicture.asset('images/circles.svg'),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: HelloCard(
                        headFont: headFont,
                        regularFont: regularFont,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment(.8, 0),
                        child: MyPortrait(),
                      ),
                    ),
                    AboutSection(headFont: headFont, regularFont: regularFont),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, .9),
              child: HannesButton(
                regularFont: regularFont,
                headFont: headFont,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class AboutSection extends StatelessWidget {
  static const bulletListItems = [
    'Photo & Videography',
    'JavaScript',
    'Flutter',
    'Blender'
  ];

  const AboutSection({
    Key? key,
    required this.headFont,
    required this.regularFont,
  }) : super(key: key);

  final TextStyle headFont;
  final TextStyle regularFont;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I like:',
          style: headFont,
        ),
        ...bulletListItems
            .map((e) => BulletItem(
                  text: e,
                  style: regularFont,
                ))
            .toList(),
      ],
    );
  }
}

class MyPortrait extends StatelessWidget {
  const MyPortrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(
          'images/portrait.png',
          scale: 2.8,
        ),
      ),
    );
  }
}

class HelloCard extends StatelessWidget {
  final TextStyle headFont;
  final TextStyle regularFont;
  const HelloCard(
      {required this.headFont, required this.regularFont, super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      headFont: headFont,
      regularFont: regularFont,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: FittedBox(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: headFont,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      width: 180,
                      child: Text(
                        'I\'m Felix and I made this page.',
                        style: regularFont,
                      ),
                    ),
                  ),
                ],
              ),
              const HandEmoji()
            ],
          ),
        ),
      ),
    );
  }
}

class HandEmoji extends StatelessWidget {
  const HandEmoji({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '👋',
      style: TextStyle(fontSize: 70),
    );
  }
}

class BulletItem extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const BulletItem({required this.text, this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: FittedBox(
        child: Row(
          children: [
            const Text(
              "\u2022",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 8,
            ),
            style == null
                ? Text(text)
                : Text(
                    text,
                    style: style,
                  ),
          ],
        ),
      ),
    );
  }
}

class HannesButton extends StatelessWidget {
  final TextStyle headFont;
  final TextStyle regularFont;
  const HannesButton(
      {required this.headFont, required this.regularFont, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HannesScreen())),
      child: GlassCard(
        headFont: headFont,
        regularFont: regularFont,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: FittedBox(
            child: Row(
              children: [
                Text(
                  'Go to Hannes',
                  style: regularFont,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset('images/arrow.svg'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
