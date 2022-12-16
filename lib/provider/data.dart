import 'package:flutter/cupertino.dart';

class ProviderData extends ChangeNotifier {
  Offset _position = Offset.zero;

  Offset get position => _position;

  void updateUpdatePosition(position) {
    _position = position;
    notifyListeners();
  }

  void updateEndPosition(position) {
    _position = position;
    notifyListeners();
  }

  void updateStartPosition(position) {
    _position = position;
    notifyListeners();
  }
}
