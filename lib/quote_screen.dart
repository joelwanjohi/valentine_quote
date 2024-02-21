import 'dart:math';

import 'package:flutter/material.dart';
import 'package:valentine/home-screen.dart';

class QuoteScreen extends StatefulWidget {
  
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  String quote = "";
  final List<String> allQuotes = [
'Where there is great love, there are always wishes.',
'Doubt thou the stars are fire, Doubt that the sun doth move. Doubt the truth to be a liar, But never doubt I love.',
'If you have only one smile in you give it to the people you love.',
'This fire that we call Loving is too strong for human minds. But just right for human souls.',
'Most people are slow to champion love because they fear the transformation it brings into their lives. And make no mistake about it: love does take over and transform the schemes and operations of our egos in a very mighty way.', 
'Each time you love, love as deeply as if it were forever.',
'Romance is thinking about your significant other, when you are supposed to be thinking about something else.',
'Love is when the desire to be desired takes you so badly that you feel you could die of it.',
'I won’t give up on us, even if the skies get rough.',
'We love because he first loved us.',
'A kiss is a lovely trick designed by nature to stop speech when words become superfluous.',
'Love is being stupid together.” —Paul Valery.',
'Love is a condition in which the happiness of another person is essential to your own.',
'Anyone can be passionate but it takes real lovers to be silly.',
'Love is our true destiny. We do not find the meaning of life by ourselves- alone we find it with another.',
  ];

  void generateRandoQuote() {
    quote = allQuotes[Random().nextInt(allQuotes.length)];
  }

  void _showQuoteDialog(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                color: Color(0xffc63026),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Affectionate Lines",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      quote,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                           => Homescreen(),
                           ));
                        },
                        child: const Text(
                          "Close",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }

  @override
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xffc63026),
      title: const Text("Hey Dear!"),
    ),
    
    body: Center(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              const Text(
                "Happy Valentine!",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              const Text(
                'Choose a Sweet Container',
                style: TextStyle(fontSize: 19),
              ),
             const SizedBox(height: 20),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Ink.image(
                      image: const AssetImage("images/gift.png"),
                      fit: BoxFit.cover,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          generateRandoQuote();
                          _showQuoteDialog(context);
                          if (mounted) {
                            setState(() {});
                          }
                        },
                      )
                    );
                  
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}