import 'package:flutter/material.dart';
import '../entities/nicecard.dart';

class CardView extends StatelessWidget {
  final NiceCard card;
  final void Function(int) onClick;

  CardView(this.card, {this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: GestureDetector(
      onTap: () {
        onClick(card.id);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        color: card.color,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(1, -1),
              child: Text((card.id + 1).toString()),
            ),
            Center(
              child: Align(
                alignment: Alignment(0, 0),
                child: Text(card.value.toString()),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
