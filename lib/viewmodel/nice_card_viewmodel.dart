import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../entities/nicecard.dart';

class NiceCardViewModel extends Model {
  static final NiceCardViewModel _singleton = NiceCardViewModel._internal();
  static const int MAX_NICE_CARD = 100;
  static const List COLORS = [
    Colors.green,
    Colors.lightBlue,
    Colors.lime,
    Colors.orange,
    Colors.pink,
    Colors.red,
    Colors.teal,
    Colors.indigo
  ];

  List<NiceCard> nicecards = List();
  NiceCard selectedCard;

  factory NiceCardViewModel() {
    return _singleton;
  }

  NiceCardViewModel._internal() {
    initNiceCards();
    notifyListeners();
  }

  void initNiceCards() {
    for (var i = 0; i < MAX_NICE_CARD; i++) {
      nicecards.add(NiceCard(i, COLORS[i % COLORS.length]));
    }
    selectedCard = nicecards[0];
  }

  void setSelectedCard(NiceCard card) {
    selectedCard = card;
    notifyListeners();
  }

  void setSelectedCardId(int cardId) {
    selectedCard = nicecards[cardId];
    notifyListeners();
  }

  void onSelectedCardClicked(int cardId) {
    nicecards[cardId].value++;
    notifyListeners();
  }
}
