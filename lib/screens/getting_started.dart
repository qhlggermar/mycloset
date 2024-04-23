import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:my_closet/screens/auth_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LandingPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: TextStrokePainter(
                    text: 'MyCloset',
                    fontSize: 48,
                    fontFamily: 'Gluten',
                    color: Colors.white, // Text color
                    strokeColor: const Color(0xffeeeeee), // Text stroke color
                    strokeWidth: 2.0,
                  ),
                  child: const Text(
                    'MyCloset',
                    style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Gluten',
                      color: Colors.white, // Text color
                      shadows: [
                        Shadow(
                          color: Color(0xff6F6D6D), // Shadow color
                          offset: Offset(2, 2), // Shadow offset
                          blurRadius: 2, // Shadow blur radius
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextStrokePainter extends CustomPainter {
  final String text;
  final double fontSize;
  final Color color;
  final Color strokeColor;
  final double strokeWidth;
  final String fontFamily;

  TextStrokePainter({
    required this.text,
    required this.fontSize,
    required this.color,
    required this.strokeColor,
    required this.strokeWidth,
    required this.fontFamily,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
      shadows: [
        Shadow(
          color: strokeColor,
          blurRadius: strokeWidth,
        ),
      ],
    );

    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final offset = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          CustomPaint(
            painter: TextStrokePainter(
              text: 'MyCloset',
              fontSize: 48,
              fontFamily: 'Gluten',
              color: Colors.white, // Text color
              strokeColor: const Color(0xffeeeeee), // Text stroke color
              strokeWidth: 2.0,
            ),
            child: const Text(
              'MyCloset',
              style: TextStyle(
                fontSize: 48,
                fontFamily: 'Gluten',
                color: Colors.white, // Text color
                shadows: [
                  Shadow(
                    color: Color(0xff6F6D6D), // Shadow color
                    offset: Offset(2, 2), // Shadow offset
                    blurRadius: 2, // Shadow blur radius
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('image/s1.png'), // Change the image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 80),
          const Center(
            child: Text(
              'Took a lot of time choosing your outfits and \n'
                  'trying them on, and in the end it made you tired \n'
                  'and decided to not to go out at all?',
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'Dongle',
                color: Color(0xff463F3A),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          DotsIndicator(
            dotsCount: 3, // Number of dots
            position: 0, // Current position of the dot (0-indexed)
            decorator: DotsDecorator(
              size: const Size(10, 10),
              activeSize: const Size(20.0, 10.0) ,// Size of each dot
              color: const Color(0xffB2967D), // Color of inactive dots
              activeColor: const Color(0xff463F3A), // Color of active dot
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AuthPage(),
                  ));
                },
                child: const Text('Skip', style: TextStyle(
                  fontFamily: 'Dongle',
                  color: Color(0xff463F3A),
                  fontSize: 24,
                )),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SecondLandingPage(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xffB2967D), // Text color
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder( // Button border shape
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            ],
          ),
        ],
      ),
    );
  }
}

class SecondLandingPage extends StatelessWidget {
  const SecondLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          CustomPaint(
            painter: TextStrokePainter(
              text: 'MyCloset',
              fontSize: 48,
              fontFamily: 'Gluten',
              color: Colors.white, // Text color
              strokeColor: const Color(0xffeeeeee), // Text stroke color
              strokeWidth: 2.0,
            ),
            child: const Text(
              'MyCloset',
              style: TextStyle(
                fontSize: 48,
                fontFamily: 'Gluten',
                color: Colors.white, // Text color
                shadows: [
                  Shadow(
                    color: Color(0xff6F6D6D), // Shadow color
                    offset: Offset(2, 2), // Shadow offset
                    blurRadius: 2, // Shadow blur radius
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('image/s2.png'), // Change the image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 80),
          const Center(
            child: Text(
              'Why bother wearing almost everything you have \n'
                  'when you can virtually view what \n'
                  'it looks like to you?',
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'Dongle',
                color: Color(0xff463F3A),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          DotsIndicator(
            dotsCount: 3, // Number of dots
            position: 1, // Current position of the dot (0-indexed)
            decorator: DotsDecorator(
              size: const Size(10, 10),
              activeSize: const Size(20.0, 10.0) ,// Size of each dot
              color: const Color(0xffB2967D), // Color of inactive dots
              activeColor: const Color(0xff463F3A), // Color of active dot
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),// Size of active dot
            ),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AuthPage(),
                  ));
                },
                child: const Text('Skip', style: TextStyle(
                  fontFamily: 'Dongle',
                  color: Color(0xff463F3A),
                  fontSize: 24,
                )),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ThirdLandingPage(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xffB2967D), // Text color
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder( // Button border shape
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            ],

          ),
        ],
      ),
    );
  }
}


class ThirdLandingPage extends StatelessWidget {
  const ThirdLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          CustomPaint(
            painter: TextStrokePainter(
              text: 'MyCloset',
              fontSize: 48,
              fontFamily: 'Gluten',
              color: const Color(0xffeeeeee), // Text color
              strokeColor: const Color(0xff6F6D6D), // Text stroke color
              strokeWidth: 1.0,
            ),
            child: const Text(
              'MyCloset',
              style: TextStyle(
                fontSize: 48,
                fontFamily: 'Gluten',
                color: Colors.white, // Text color
                shadows: [
                  Shadow(
                    color: Color(0xff6F6D6D), // Shadow color
                    offset: Offset(2, 2), // Shadow offset
                    blurRadius: 2, // Shadow blur radius
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('image/s3.png'), // Change the image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 80),
          const Center(
            child: Text(
              'Your digital wardrobe companion.',
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'Dongle',
                color: Color(0xff463F3A),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          DotsIndicator(
            dotsCount: 3, // Number of dots
            position: 2, // Current position of the dot (0-indexed)
            decorator: DotsDecorator(
              size: const Size(10, 10),
              activeSize: const Size(20.0, 10.0) ,// Size of each dot
              color: const Color(0xffB2967D), // Color of inactive dots
              activeColor: const Color(0xff463F3A), // Color of active dot
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ), // Size of active dot
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AuthPage(),
                  ));
                },
                child: const Text('Skip', style: TextStyle(
                  fontFamily: 'Dongle',
                  color: Color(0xff463F3A),
                  fontSize: 24,
                )),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AuthPage(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xffB2967D), // Text color
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder( // Button border shape
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            ],

          ),
        ],
      ),
    );
  }
}
