// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_new

 import 'package:flutter/material.dart';
import 'package:tcc/Widgets/historia.dart';

class FeedBlocos01 extends StatefulWidget {
  const FeedBlocos01({Key? key}) : super(key: key);

  @override
  _FeedBlocos01State createState() => _FeedBlocos01State();
}

class _FeedBlocos01State extends State<FeedBlocos01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // ignore: prefer_const_constructors
              decoration: new BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Acervo:',
                    style: TextStyle(
                      fontSize: 42,
                      fontStyle: FontStyle.normal,
                      color: Colors.amber.shade800,
                    ),
                  ),
                ],
              ),
            ),
            WidgetHistoria(
                'lib/Img/dicionario_aurelio.jpg', 'Dicionario Aurélio'),
            WidgetHistoria(
                'lib/Img/dona_flor.jpg', 'Dona flor e seus dois maridos'),
            WidgetHistoria(
                'lib/Img/Bras_cubas.jpg', 'Memorias postomas de Bras Cubas'),
            WidgetHistoria('lib/img/dom_casmurro.jpg', 'Dom Casmurro'),
          ],
        ),
      ),
    );
  }
}
