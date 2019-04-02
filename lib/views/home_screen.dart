import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../viewmodel/nice_card_viewmodel.dart';
import '../views/card_view.dart';

class HomeScreen extends StatelessWidget {
  final NiceCardViewModel niceCardModel = NiceCardViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScopedModel<NiceCardViewModel>(
        model: NiceCardViewModel(),
        child: Column(
          children: <Widget>[
            //Listview
            Container(
              height: 128,
              child: ScopedModelDescendant<NiceCardViewModel>(
                  builder: (context, child, model) => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.nicecards.length,
                        itemBuilder: (context, index) => Container(
                              width: 96,
                              child: CardView(
                                model.nicecards[index],
                                onClick: onCardSelected,
                              ),
                            ),
                      )),
            ),

            //Cardview
            Container(
              width: 108,
              height: 144,
              child: ScopedModelDescendant<NiceCardViewModel>(
                builder: (context, child, model) {
                  return CardView(
                    model.selectedCard,
                    onClick: onSelectedCardClicked,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCardSelected(int cardId) {
    print('Oncard selected $cardId');
    niceCardModel.setSelectedCardId(cardId);
  }

  void onSelectedCardClicked(int cardId) {
    print('Oncard clicked $cardId');
    niceCardModel.onSelectedCardClicked(cardId);
  }
}
